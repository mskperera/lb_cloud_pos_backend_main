const { getTenant } = require("../mysql/tenantList");
const {userPassword_update_sql, userAssignedStores_select_sql, userRegistration_select_by_userName_sql } = require("../sql/auth");
const { get_tenantServerDetailsByIsCurrent_sql, get_connectionDetails_by_accountName_sql, user_verification_delete_sql } = require("../sql/operational");
const { userAccount_select_sql } = require("../sql/user");
const { user_verification_insert_sql, user_verification_select_sql } = require("../sql/verification");
const { sendAccountRegistrationVerification, sendAccountPasswordResetVerification } = require("./email");
const { setupTenant_srv, setupTenantToDefaultServer_srv } = require("./operational");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const { hashPassword, comparePassword } = require("../utils/bcryptHash");
const { userLogInsertUpdate_sql } = require("../sql/log");

exports.verifySignUp_srv = async (userName, displayName) => {
  
    try{
      //1.check user exists in main db; if exists() return faild;
      const userRes = await userAccount_select_sql(userName);
      if (userRes.records) {
        return {exception:{message:"Username is already in use."}}
      }
      
      const addUserVerificationRes = await user_verification_insert_sql(userName);
    
      const { verificationCode, expirationTime_sec } = addUserVerificationRes.values;
  
     //2. verify email
      sendAccountRegistrationVerification(userName, verificationCode, displayName);
  
      return {
        message: "Please enter the verification code sent to your email.",
      };
  
    } catch (error) {
        console.error("verifySignUp_srv()| error:", error);
        throw error;
    }
  };

  exports.completeSignup_srv = async (userName, password, verificationCode) => {

    try {
      //2. verify the userid
      const {records} = await user_verification_select_sql(userName);
      if (!records) {
        return {exception:{message:"Invalid user."}};
      }
      const { userVerificationId, expiresAt, createdAt } = records;
     
      if (verificationCode !== records.verificationCode) {     
        return {
        exception:{  message:
            "The verification code is invalid. Please double-check the code or request a new verification code to be sent.",
        }}
      }
  
      const expiresAtTimestamp = new Date(expiresAt).getTime();
      const currentTimestamp = Date.now();
      console.log("expiresAtTimestamp: ", expiresAtTimestamp);
      console.log("currentTimestamp: ", currentTimestamp);
  
      if (expiresAtTimestamp < currentTimestamp) {
        return{
        exception:{  message:
            "The verification code has expired.",
        }}
      }
  
      //3. inifialize user account and teanant
      const tenentDetailsRes= await get_tenantServerDetailsByIsCurrent_sql(); //const hostName="127.0.0.1";
      if (tenentDetailsRes.exception) {
        return tenentDetailsRes;
      }
      const {hostName}=tenentDetailsRes.records
      
      const setupTenantRes=await setupTenantToDefaultServer_srv(userName, password);
      if (setupTenantRes.exception) {
        return setupTenantRes;
      }
      
      return {
        message: "Your account has been successfully created.",
      };
    }  catch (error) {
        console.error("completeSignup()| error:", error);
        throw error;
    }
  };

  exports.login_srv = async (userName, password ,ipAddress,utcOffset,pageName) => {
  
    try {
      //1.check user exists in main db; if not exists() return faild;
      const userRes = await userAccount_select_sql(userName);
      if (!userRes.records) {
        return {exception:{message:"Invalid username."}}
      }
  
      const tenentDetailsRes = await get_connectionDetails_by_accountName_sql(userName);
      const {
        connectionId,
        hostName,
        dbUsername,
        dbPassword,
        dbName,
        tenantId,
        roleId,
        jwtSecret,
      } = tenentDetailsRes.records;
      const tenant = await getTenant(tenantId);
      const {records} = await userRegistration_select_by_userName_sql(tenant, userName);
  
      if(!records){
        return {exception:{message:"Invalid Registered Username"}}
      }
  
      const {
        userId,
        uName,
        passwordHash,
        email,
        displayName,
        profilePic,
        isActive,
        userRoleId
      } = records;
    
      if (!isActive) {
        return {exception:{message:"Your account is inactive. Please contact support for assistance."}}
      }

      const isMatch = await comparePassword(password, passwordHash);

      const loginStatus=isMatch ? "Success":"Failed";
      const userLog=await userLogInsertUpdate_sql(tenant, userId,loginStatus,ipAddress,'userAgent','sessionId','additionalInfo',utcOffset,pageName)
      console.log("userLog ooooooo:", userLog);

      if (!isMatch) {
        return {exception:{message:"Invalid User Name or Password."}}
      }

      const accessToken = jwt.sign(
        { displayName, email, userId, uName,tenantId,userRoleId,
          userLogId:userLog.values.userLogId,timeZoneId:1,utcOffset:330 },
        jwtSecret,
        {
          expiresIn: "7d",
        }
      );
  
  
      return {
        accessToken,
        message: "Successful login has been completed.",
        uName,email,displayName,profilePic  
      };

    } catch (error) {
        console.log("login_srv()-> err :", error);
        throw error;
    }
  };

  exports.resetForgotPasswordVerify_srv = async (userName) => {

    try {
        const userRes = await userAccount_select_sql(userName);
      if (!userRes.records) {
        return {exception:{message:"Invalid username."}}
      }
  

      const tenentDetailsRes = await get_connectionDetails_by_accountName_sql(userName);
      const {
        connectionId,
        hostName,
        dbUsername,
        dbPassword,
        dbName,
        tenantId,
        roleId,
        jwtSecret,
      } = tenentDetailsRes.records;


      const tenant = await getTenant(tenantId);
  
      const {records} = await userRegistration_select_by_userName_sql(tenant, userName);
  
      if(!records){
        return {exception:{message:"Invalid username."}}
      }
      const {displayName}=records;

      const addUserVerificationRes = await user_verification_insert_sql(userName);
    
      const { verificationCode, expirationTime_sec } = addUserVerificationRes.values;
  
      sendAccountPasswordResetVerification(userName, verificationCode, displayName);
  
     return {
        message: "Please enter the verification code sent to your email.",
      };

    } catch (error) {
        console.log("resetForgotPasswordVerify_srv()-> err :", error);
        throw error;
    }
  };

  exports.resetForgotPassword_srv = async (userName, password, verificationCode ) => {
  
    try {
      
        const userVerificationRes = await user_verification_select_sql(userName);
        if (!userVerificationRes.records) {
          return {exception:{message:"Verification not found. Please request a new verification code"}};
        }

        const tenentDetailsRes = await get_connectionDetails_by_accountName_sql(userName);
        const {
          connectionId,
          hostName,
          dbUsername,
          dbPassword,
          dbName,
          tenantId,
          roleId,
          jwtSecret,
        } = tenentDetailsRes.records;

        const tenant = await getTenant(tenantId);
        const userRegistrationRes = await userRegistration_select_by_userName_sql(tenant, userName);
    
        if(!userRegistrationRes.records){
          return {exception:{message:"Invalid username or password."}}
        }
        
        const { userVerificationId, expiresAt, createdAt } = userVerificationRes.records;
       
        if (verificationCode !== userVerificationRes.records.verificationCode) {     
          return {
          exception:{  message:
              "The verification code is invalid. Please double-check the code or request a new verification code to be sent.",
          }}
        }
  
        const expiresAtTimestamp = new Date(expiresAt).getTime();
        const currentTimestamp = Date.now();
        console.log("expiresAtTimestamp: ", expiresAtTimestamp);
        console.log("currentTimestamp: ", currentTimestamp);
    
        if (expiresAtTimestamp < currentTimestamp) {
          return{
          exception:{  message:
              "The verification code has expired.",
          }}
        }
 
      const passwordSalt = bcrypt.genSaltSync(10);
      const passwordHash =await hashPassword(password);
    
      const userRegRes = await userPassword_update_sql(
        tenant,
        userName,
        passwordHash,
        passwordSalt
      );

      if (userRegRes.exception) {
        return userRegRes;
      }

     await user_verification_delete_sql(userName);

      return {
        message: "Your account password has been successfully changed.",
      };

    } catch (error) {
        console.log("resetForgotPassword_srv()-> err :", error);
        throw error;
    }
  };

  exports.crpLogin_srv = async (userName, password ) => {
  
    try {
      //1.check user exists in main db; if not exists() return faild;
      const userRes = await userAccount_select_sql(userName);
      if (!userRes.records) {
        return {exception:{message:"Invalid username or password."}}
      }
  
      const tenentDetailsRes = await get_connectionDetails_by_accountName_sql(userName);
      const {
        connectionId,
        hostName,
        dbUsername,
        dbPassword,
        dbName,
        tenantId,
        roleId,
        jwtSecret,
      } = tenentDetailsRes.records;
      const tenant = await getTenant(tenantId);
      const {records} = await userRegistration_select_by_userName_sql(tenant, userName);
  
      if(!records){
        return {exception:{message:"Invalid username or passwordoonnn."}}
      }
  
      const {
        userId,
        uName,
        passwordHash,
        passwordSalt,
        email,
        displayName,
        profilePic,
        isActive,
      } = records;
  
      const isMatch = await comparePassword(password, passwordHash);
      if (!isMatch) {
        return {exception:{message:"Invalid User Name or Password nnnnnn ii."}}
      }
  
      //sign and generate a token
      const accessToken = jwt.sign(
        { displayName, email, userId, uName,tenantId },
        jwtSecret,
        {
          expiresIn: "100d",
        }
      );
  
  
      return {
        accessToken,
         userId,tenantId,
        message: "Successful login has been completed.",
      };
    } catch (error) {
        console.log("login_srv()-> err :", error);
        throw error;
    }
  };