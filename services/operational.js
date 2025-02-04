const crypto = require("crypto");
const bcrypt = require("bcrypt");
const {
  is_tenancySettingUpCompleted,
  addConnectionToMainDb_sql,
  get_tenantServerDetailsByHostName_sql,
  mark_tenancySetupAsCompleted_sql,
  get_connectionDetails_by_tenantId_sql,
  remove_DbConnection_from_mainDb_sql,
  createUserAccountForDb_sql,
  get_tenantServerDetailsByIsCurrent_sql,
} = require("../sql/operational");
const moment = require("moment/moment");
const {
  dropDatabase_shcmd,
  removeDBUserAccount_shcmd,
  backupMySQLDatabase_shcmd,
  restoreDatabase_shcmd
} = require("../sql_shell_commands/operational");
const { getTenant } = require("../mysql/tenantList");
const { encryptPassword } = require("../utils/encrypt");
const { userRegistration_insert, userRegistration_insert_sql } = require("../sql/auth");

// Function to generate a random string of a specified length
function generateRandomString(length) {
  return crypto
    .randomBytes(Math.ceil(length / 2))
    .toString("hex")
    .slice(0, length);
}


exports.restoreDatabase_srv = async (hostName, dbName, dumpFile) => {
  try {
    const tenantservres = await get_tenantServerDetailsByHostName_sql(hostName);
    if (tenantservres.exception) {
      return tenantservres;
    }
    //server Admincred
    const { userName, password, port, connectionLimit } = tenantservres.records;
    const adminUser = userName; //"serverAdmin";
    const adminPassword = password; //"admin@123";

    const restoreMySqlDbRes = await restoreDatabase_shcmd(
      hostName,
      adminUser,
      adminPassword,
      port,
      dbName,
      dumpFile
    );
    return restoreMySqlDbRes;
  } catch (err) {
    console.log("backupDatabaseTo_live_db_dumps_srv()-> err :", err);
    throw err;
  }
};

const setupTenant_srv = async (hostName, accUserName, accPassword,displayName,dumpFile) => {
  try {


    const tenantservres = await get_tenantServerDetailsByHostName_sql(hostName);
    if (tenantservres.exception) {
      return tenantservres;
    }
    console.log('tenantservres.records;',tenantservres.records)
    //server Admincred
    const { userName, password, port, connectionLimit } = tenantservres.records;
    const adminUser = userName; //"serverAdmin";
    const adminPassword = password; //"admin@123";

    //db user cred
    const dbUsername = generateRandomString(8);
    const dbPassword = generateRandomString(12);
    const jwtSecret = generateRandomString(32);
    //const secretKey = crypto.randomBytes(32).toString('hex');

    const addConnToMainDbRes = await addConnectionToMainDb_sql(
      hostName,
      dbUsername,
      dbPassword,
      port,
      accUserName,
      accPassword,
      jwtSecret
    );

    if (addConnToMainDbRes.exception) {
      return addConnToMainDbRes;
    }

    const { responseStatus, outputMessage, tenantId, dbName, connectionId } =
      addConnToMainDbRes.values;

    const restoreMySqlDbRes = await restoreDatabase_shcmd(
      hostName,
      adminUser,
      adminPassword,
      port,
      dbName,
      dumpFile
    );
    if (restoreMySqlDbRes.exception) {
      return restoreMySqlDbRes;
    }

    const serverAdminCred = { adminUser, adminPassword, port, connectionLimit };
    const dbUserCred = { dbUsername, dbPassword, dbName };

    const createDbUserAccountRes = await createUserAccountForDb_sql(
      hostName,
      serverAdminCred,
      dbUserCred
    );

    if (createDbUserAccountRes.exception) {
      return createDbUserAccountRes;
    }

    //4. register user in the tenant database
    const tenant = await getTenant(tenantId);
    const passwordSalt = bcrypt.genSaltSync(10);
    const passwordHash = encryptPassword(accPassword, passwordSalt);

    const userRegRes = await userRegistration_insert_sql(
      tenant,
      accUserName,
      passwordHash,
      passwordSalt,
      userName,
      displayName
    );
    if (userRegRes.exception) {
      return userRegRes;
    }

    console.log("user_Insert_Update  : ", userRegRes);

    const mark_tenancySetupAsCompletedRes =
      await mark_tenancySetupAsCompleted_sql(connectionId);
    if (mark_tenancySetupAsCompletedRes.exception) {
      return mark_tenancySetupAsCompletedRes;
    }

    return { message: "The tenant setup has been completed successfully." };
  } catch (error) {
    console.error("setupTenant_srv()| error:", error);
    throw error;
  }
};

exports.setupTenantToCustomServer_srv = async (
  hostName,accEmail, accPassword
) => {
  try {


    const dumpFile2 =process.env.LATEST_RELEASE_DUMP_PATH;

    return await setupTenant_srv(hostName,accEmail, accPassword,accEmail,dumpFile2);

  } catch (err) {
    console.log("setupTenantToCustomServer_srv()-> err :", err);
    throw err;
  }
};


exports.setupTenantToDefaultServer_srv = async (
  accEmail, accPassword
) => {
  try {

    const tenantservres = await get_tenantServerDetailsByIsCurrent_sql(); //const hostName="127.0.0.1";
    const {hostName}=tenantservres.records;
    return await setupTenant_srv(hostName,accEmail, accPassword);

  } catch (err) {
    console.log("setupTenantToDefaultServer_srv()-> err :", err);
    throw err;
  }
};

exports.backupDatabaseTo_live_db_dumps_srv = async (
  hostName,
  dbName,
  dumpFileName
) => {
  try {
    const tenantservres = await get_tenantServerDetailsByHostName_sql(hostName);
    if (tenantservres.exception) {
      return tenantservres;
    }
    //server Admincred
    const { userName, password, port, connectionLimit } = tenantservres.records;
    const adminUser = userName; //"serverAdmin";
    const adminPassword = password; //"admin@123";

    const dumpFilePath =process.env.LIVE_DB_BACKUP_PATH;// `F:/Projects/Ongoing_Projects/Legendbit_POS_cloud/backup_db_mysql/live_db_dumps`;
    const dumpFile = `${dumpFilePath}/${dumpFileName}.sql`;
    return await backupMySQLDatabase_shcmd(
      hostName,
      adminUser,
      adminPassword,
      port,
      dbName,
      dumpFile
    );
  } catch (err) {
    console.log("backupDatabaseTo_live_db_dumps_srv()-> err :", err);
    throw err;
  }
};


exports.removeDBUserAccount_srv = async (dbUsername,hostName) => {
  try {
    
    const tenantservres = await get_tenantServerDetailsByHostName_sql(hostName);
    if (tenantservres.exception) {
      return tenantservres;
    }
    //server Admincred
    const { userName, password, port, connectionLimit } = tenantservres.records;
    const adminUser = userName; //"serverAdmin";
    const adminPassword = password; //"admin@123";

    const removeDbUserAccountRes = await removeDBUserAccount_shcmd(
      hostName,
      adminUser,
      adminPassword,
      port,
      dbUsername
    );

    return removeDbUserAccountRes;
  } catch (error) {
    console.log("removeTenancySetup_srv()-> err :", error);
    throw error;
  }
};

exports.removeTenancySetup_srv = async (tenantId) => {
  try {
    const conDetailsRes = await get_connectionDetails_by_tenantId_sql(tenantId);
    if (conDetailsRes.exception) {
      return conDetailsRes;
    }
   
    const { connectionId, dbName, dbUsername, hostName } = conDetailsRes.records;

    const tenantservres = await get_tenantServerDetailsByHostName_sql(hostName);
    if (tenantservres.exception) {
      return tenantservres;
    }
    //server Admincred
    const { userName, password, port, connectionLimit } = tenantservres.records;
    const adminUser = userName; //"serverAdmin";
    const adminPassword = password; //"admin@123";

    const dbdate = moment().format("YY_MM_DD_HH_mm_ss");
    console.log("dbdate:", dbdate);

    const dumpFileName = `${dbName}_${dbdate}`;
    const dumpFilePath =process.env.REMOVED_TENANT_DB_BACKUP_PATH; //`F:/Projects/Ongoing_Projects/Legendbit_POS_cloud/backup_db_mysql/removed_db_dumps`;
    const dumpFile = `${dumpFilePath}/${dumpFileName}.sql`;
    const backupDbRes = await backupMySQLDatabase_shcmd(
      hostName,
      adminUser,
      adminPassword,
      port,
      dbName,
      dumpFile
    );

    if (backupDbRes.exception) {
      return backupDbRes;
    }

    const dropDbRes = await dropDatabase_shcmd(
      hostName,
      adminUser,
      adminPassword,
      port,
      dbName
    );
    if (dropDbRes.exception) {
      return dropDbRes;
    }

    const removeDbUserAccountRes = await removeDBUserAccount_shcmd(
      hostName,
      adminUser,
      adminPassword,
      port,
      dbUsername
    );
    if (removeDbUserAccountRes.exception) {
      return removeDbUserAccountRes;
    }

    const removeDbConnFrMain = await remove_DbConnection_from_mainDb_sql(
      connectionId
    );

    if (removeDbConnFrMain.exception) {
      return removeDbConnFrMain;
    }

    return {message:'Tenant has been removed successfully.'}

  } catch (error) {
    console.log("removeTenancySetup_srv()-> err :", error);
    throw error;
  }
};

exports.cleanupIncompleteTenancySetups_srv = async (tenantId) => {
  try {
    const connection = await get_connectionDetails_by_tenantId_sql(tenantId);
    const { connectionId, dbName, dbUsername, hostName } = connection;

    const isSettingUpCompleted = await is_tenancySettingUpCompleted(
      connectionId
    );
    if (isSettingUpCompleted) {
      return { exception: { message: "SettingUp is already Completed" } };
    }

    const tenantservres = await get_tenantServerDetailsByHostName_sql(hostName);
    if (tenantservres.exception) {
      return tenantservres;
    }
    //server Admincred
    const { userName, password, port, connectionLimit } = tenantservres.records;
    const adminUser = userName; //"serverAdmin";
    const adminPassword = password; //"admin@123";

    await dropDatabase_shcmd(hostName, adminUser, adminPassword, port, dbName);

    // const user= await selectSQLDbUser(dbUsername,);

    await removeDBUserAccount_shcmd(
      hostName,
      adminUser,
      adminPassword,
      port,
      dbUsername
    );
    await remove_DbConnection_from_mainDb_sql(connectionId);
    return { message: "Tenant has been cleaned up successfully." };
  } catch (error) {
    console.log("cleanupIncompleteTenancySetups_srv()-> err :", error);
    throw error;
  }
};

exports.createUserAccountForDb_srv = async (dbUsername,dbPassword,dbName,hostName) => {
  try {
    const tenantservres = await get_tenantServerDetailsByHostName_sql(hostName);
    if (tenantservres.exception) {
      return tenantservres;
    }

    //server Admincred
    const { userName, password, port, connectionLimit } = tenantservres.records;
    const adminUser = userName; //"serverAdmin";
    const adminPassword = password; //"admin@123";

    const serverAdminCred = { adminUser, adminPassword, port, connectionLimit };
    const dbUserCred = { dbUsername, dbPassword, dbName };

    const createDbUserAccountRes = await createUserAccountForDb_sql(
      hostName,
      serverAdminCred,
      dbUserCred
    );

    if (createDbUserAccountRes.exception) {
      return createDbUserAccountRes;
    }

    return createDbUserAccountRes;
  } catch (error) {
    console.log("removeTenancySetup_srv()-> err :", error);
    throw error;
  }
};


exports.getConnectionDetailsByTenantId_srv = async (tenantId) => {
  try {
    const result = await get_connectionDetails_by_tenantId_sql(tenantId);
    if (result.exception) {
      return result;
    }
    return result;
  } catch (error) {
    console.log("getConnectionDetailsByTenantId_srv()-> err :", error);
    throw error;
  }
};