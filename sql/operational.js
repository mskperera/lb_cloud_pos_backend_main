const {
  mainDbConnection_pool,
  mainDbConnection_error_handler_pool,
} = require("../mysql/main_db_connection");
const mysql = require("mysql2");
const { SP_STATUS } = require("../constants/constants");
const {
  executeStoredProcedureWithOutputParamsByPool,
  executeSqlQueryWithOutputParamsByPool,
} = require("../mysql/sql_executer");
const {CONSOLE_TEXT_COLORS} =require('../constants/constants')
const {consoleSuccessText,consoleErrorText,consoleExceptionText }=CONSOLE_TEXT_COLORS;



exports.addConnectionToMainDb_sql = async (
  server,
  dbUsername,
  dbPassword,
  port,
  accUserName,
  accPassword,
  jwtSecret
) => {
  const functionName = "addConnectionToMainDb_sql()";
  try {
    const procedureParameters = [
      server,
      dbUsername,
      dbPassword,
      port,
      accUserName,
      accPassword,
      jwtSecret,
    ];
    const procedureOutputParameters = [
      "responseStatus",
      "outputMessage",
      "tenantId",
      "dbName",
      "connectionId",
    ];
    const procedureName = "add_Connection_to_mainDb";
    const result = await executeStoredProcedureWithOutputParamsByPool(
      procedureName,
      procedureParameters,
      procedureOutputParameters,
      mainDbConnection_pool
    );

    const { responseStatus, outputMessage } = result.outputValues;
    if (responseStatus === SP_STATUS.failed) {
      console.log(consoleExceptionText,`${functionName} -> exception:`, outputMessage);
      return { exception: { message: outputMessage } };
    }

    const message = outputMessage;
    console.log(consoleSuccessText,`${functionName} -> success: ${message} `);
    return {message,records:null,values:result.outputValues };
  } catch (error) {
    console.error(consoleErrorText,`${functionName} -> error :`, error);
    throw error;
  }
};


exports.remove_DbConnection_from_mainDb_sql = async (connectionId) => {
  const functionName="remove_DbConnection_from_mainDb_sql()";
  try {
    const procedureParameters = [
      connectionId,
    ];
    const procedureOutputParameters = [
      "responseStatus",
      "outputMessage"
    ];
    const procedureName = "remove_DbConnection_from_mainDb";
    const result = await executeStoredProcedureWithOutputParamsByPool(
      procedureName,
      procedureParameters,
      procedureOutputParameters,
      mainDbConnection_pool
    );

    const { responseStatus, outputMessage } = result.outputValues;
    if (responseStatus === SP_STATUS.failed) {
      console.log(consoleExceptionText,`${functionName} -> exception:`, outputMessage);
      return { exception: { message: outputMessage } };
    }

    const message = outputMessage;
    console.log(consoleSuccessText,`${functionName} -> success: ${message} `);
    return {message,records:null,values:result.outputValues };

  } catch (error) {
    console.error(consoleErrorText,`${functionName} -> error :`, error);
    throw error;
  }
};

// exports.createUserAccountForDb_sql = async (
//   dbHost,
//   serverAdminCred,
//   dbUserCred
// ) => {
 
//     const { adminUser, adminPassword, port, connectionLimit } = serverAdminCred;
//     const { dbUsername, dbPassword, dbName } = dbUserCred;

//     const credentials = {
//       connectionLimit, // Number of connections to create
//       host: dbHost,
//       user: adminUser,
//       password: adminPassword,
//       multipleStatements: true, // this allows to run multiple queries at once
//       port,
//     };

//     const pool = mysql.createPool(credentials);

//     const sqlQuery = `
//       CREATE USER '${dbUsername}'@'${dbHost}' IDENTIFIED BY '${dbPassword}';
//       GRANT ALL PRIVILEGES ON ${dbName}.* TO '${dbUsername}'@'${dbHost}';
//       FLUSH PRIVILEGES;
//     `;

//     // Input parameters
//     const inputParameters = [];

//     // Output parameters (empty array in this example)
//     const outputParameters = [];

//     // Call the executeSqlQueryWithOutputParamsByPool function
//     try {
//       const { results, outputValues } =
//         await executeSqlQueryWithOutputParamsByPool(
//           sqlQuery,
//           inputParameters,
//           outputParameters,
//           pool
//         );

//       console.log("Query results:", results[0]);
//       console.log("Output parameters:", outputValues);
//     } catch (error) {
//       console.log("createUserAccountForDb_sql()-> error:", error);
//       throw error;
//     }
 
// };


exports.get_connectionDetails_by_accountName_sql = async (accountName) => {
  const functionName="get_connectionDetails_by_accountName_sql()";
  try {
    const procedureParameters = [null,accountName];
    const procedureOutputParameters = ["responseStatus", "outputMessage"];
    const procedureName = "get_connectionDetails";
    const result = await executeStoredProcedureWithOutputParamsByPool(
      procedureName,
      procedureParameters,
      procedureOutputParameters,
      mainDbConnection_pool
    );

    const { responseStatus, outputMessage } = result.outputValues;
    if (responseStatus === SP_STATUS.failed) {
      console.log(consoleExceptionText,`${functionName} -> exception:`, outputMessage);
      return { exception: { message: outputMessage } };
    }
    const message = outputMessage;
    console.log(consoleSuccessText,`${functionName} -> success: ${message} `);
    return {message,records:result.results[0][0],values:result.outputValues };

  } catch (error) {
    console.error(consoleErrorText,`${functionName} -> error :`, error);
    throw error;
  }
};

exports.get_connectionDetails_by_tenantId_sql = async (tenantId) => {
  const functionName="get_connectionDetails_by_tenantId_sql()";
  try {
    const procedureParameters = [tenantId,null];
    const procedureOutputParameters = ["responseStatus", "outputMessage"];
    const procedureName = "get_connectionDetails";
    const result = await executeStoredProcedureWithOutputParamsByPool(
      procedureName,
      procedureParameters,
      procedureOutputParameters,
      mainDbConnection_pool
    );

    const { responseStatus, outputMessage } = result.outputValues;
    if (responseStatus === SP_STATUS.failed) {
      console.log(consoleExceptionText,`${functionName} -> exception:`, outputMessage);
      return { exception: { message: outputMessage } };
    }
    const message = outputMessage;
    console.log(consoleSuccessText,`${functionName} -> success: ${message} `);
    return {message,records:result.results[0][0],values:result.outputValues };

  } catch (error) {
    console.error(consoleErrorText,`${functionName} -> error :`, error);
    throw error;
  }
};

exports.get_tenantServerDetailsByHostName_sql = async (hostName) => {
  const functionName="get_tenantServerDetailsByHostName_sql()";
  try {
    const procedureParameters = [hostName, null];
    const procedureOutputParameters = ["responseStatus", "outputMessage"];
    const procedureName = "get_tenantServerDetails";
    const result = await executeStoredProcedureWithOutputParamsByPool(
      procedureName,
      procedureParameters,
      procedureOutputParameters,
      mainDbConnection_pool
    );
    const { responseStatus, outputMessage } = result.outputValues;
    if (responseStatus === SP_STATUS.failed) {
      console.log(consoleExceptionText,`${functionName} -> exception:`, outputMessage);
      return { exception: { message: outputMessage } };
    }
    const message = outputMessage;
    console.log(consoleSuccessText,`${functionName} -> success: ${message} `);
    return {message,records:result.results[0][0],values:result.outputValues };
    //return {data:result.results[0][0]};

  } catch (error) {
   console.error(consoleErrorText,`${functionName} -> error :`, error);
    throw error;
  }
};

exports.get_tenantServerDetailsByIsCurrent_sql = async () => {
  const functionName="get_tenantServerDetailsByIsCurrent_sql()";
  try {
    const procedureParameters = [null, true];
    const procedureOutputParameters = ["responseStatus", "outputMessage"];
    const procedureName = "get_tenantServerDetails";
    const result = await executeStoredProcedureWithOutputParamsByPool(
      procedureName,
      procedureParameters,
      procedureOutputParameters,
      mainDbConnection_pool
    );
    const { responseStatus, outputMessage } = result.outputValues;
    if (responseStatus === SP_STATUS.failed) {
      console.log(consoleExceptionText,`${functionName} -> exception:`, outputMessage);
      return {exception:{message: outputMessage} };
    }
    const message = outputMessage;
    console.log(consoleSuccessText,`${functionName} -> success: ${message} `);
    return {message,records:result.results[0][0],values:result.outputValues };

  } catch (error) {
    console.error(consoleErrorText,`${functionName} -> error :`, error);
    throw error;
  }
};

exports.is_tenancySettingUpCompleted_sql = async (
  connectionId
) => {
  const functionName="is_tenancySettingUpCompleted_sql()";
  try {
    const procedureParameters = [
      connectionId
    ];
    const procedureOutputParameters = [
      "isCompleted"
    ];
    const procedureName = "is_tenancySettingUpCompleted";
    const result = await executeStoredProcedureWithOutputParamsByPool(
      procedureName,
      procedureParameters,
      procedureOutputParameters,
      mainDbConnection_pool
    );

    const { responseStatus, outputMessage } = result.outputValues;
    if (responseStatus === SP_STATUS.failed) {
      console.log(consoleExceptionText,`${functionName} -> exception:`, outputMessage);
      return {exception:{message: outputMessage} };
    }
    const message = outputMessage;
    console.log(consoleSuccessText,`${functionName} -> success: ${message} `);
    return {message,records:result.results[0][0],values:result.outputValues };
    //return isCompleted
  } catch (error) {
    console.error(consoleErrorText,`${functionName} -> error :`, error);
    throw error;
  }
};


exports.mark_tenancySetupAsCompleted_sql = async (
  connectionId
) => {
  const functionName="mark_tenancySetupAsCompleted_sql()";
  try {
    const procedureParameters = [
      connectionId
    ];
    const procedureOutputParameters = [
      "responseStatus",
      "outputMessage"
    ];
    const procedureName = "mark_tenancySetupAsCompleted";
    const result = await executeStoredProcedureWithOutputParamsByPool(
      procedureName,
      procedureParameters,
      procedureOutputParameters,
      mainDbConnection_pool
    );

    const { responseStatus, outputMessage } = result.outputValues;
    if (responseStatus === SP_STATUS.failed) {
      console.log(consoleExceptionText,`${functionName} -> exception:`, outputMessage);
      return {exception:{message: outputMessage} };
    }
    const message = outputMessage;
    console.log(consoleSuccessText,`${functionName} -> success: ${message} `);
    return {message,records:null,values:result.outputValues };
  
  } catch (error) {
    console.error(consoleErrorText,`${functionName} -> error :`, error);
    throw error;
  }
};

exports.error_log_insert_sql = async (user, tenantId, activity, errorLog) => {
  const functionName="error_log_insert_sql()";
  try {
    const procedureParameters = [user, tenantId, activity, errorLog];
    const procedureOutputParameters = ["responseStatus", "outputMessage"];
    const procedureName = "error_log_insert";
    const result = await executeStoredProcedureWithOutputParamsByPool(
      procedureName,
      procedureParameters,
      procedureOutputParameters,
      mainDbConnection_error_handler_pool
    );

    const { responseStatus, outputMessage } = result.outputValues;
    if (responseStatus === SP_STATUS.failed) {
      console.log(consoleExceptionText,`${functionName} -> exception:`, outputMessage);
      return {exception:{message: outputMessage} };
    }
    const message = outputMessage;
    console.log(consoleSuccessText,`${functionName} -> success: ${message} `);
    return {message,records:result.results[0][0],values:result.outputValues };
  } catch (error) {
    console.error(consoleErrorText,"error_log_insert_sql()| error:", error);
    throw error;
  }
};

// Function to check if a user account exists asynchronously
async function checkUserAccount(pool, checkUserQuery) {
  try {
    const [rows] = await pool.promise().query(checkUserQuery);
    return rows.length > 0;
  } catch (error) {
    console.error(consoleErrorText,'Error while checking user account:', error);
    throw error;
  }
}


exports.createUserAccountForDb_sql = async (
  dbHost,
  serverAdminCred,
  dbUserCred
) => {
  const functionName="createUserAccountForDb_sql()";
  try {
    const { adminUser, adminPassword, port, connectionLimit } = serverAdminCred;
    const { dbUsername, dbPassword, dbName } = dbUserCred;

    const credentials = {
      connectionLimit, // Number of connections to create
      host: dbHost,
      user: adminUser,
      password: adminPassword,
      multipleStatements: true, // this allows to run multiple queries at once
      port,
    };

    const pool = mysql.createPool(credentials);

    const checkUserQuery = `SELECT User FROM mysql.user WHERE User = '${dbUsername}' AND Host = '${dbHost}'`;

    const userExists = await checkUserAccount(pool, checkUserQuery);

    if (userExists) {
      const message = `MySQL User ${dbUsername}  already exist..`;
      console.log(consoleExceptionText,`${functionName} -> ${message}`);
      return { exception: { message: message } };
    }

    const sqlQuery = `
      CREATE USER '${dbUsername}'@'${dbHost}' IDENTIFIED BY '${dbPassword}';
      GRANT ALL PRIVILEGES ON ${dbName}.* TO '${dbUsername}'@'${dbHost}';
      FLUSH PRIVILEGES;
    `;

    // Input parameters
    const inputParameters = [];

    // Output parameters (empty array in this example)
    const outputParameters = [];

    const { results, outputValues } =
      await executeSqlQueryWithOutputParamsByPool(
        sqlQuery,
        inputParameters,
        outputParameters,
        pool
      );

    const message = `MySQL User ${dbUsername} has been created.`;
    console.log(consoleSuccessText,`${functionName} -> success: ${message} `);

    return { message };
  } catch (error) {
    console.error(consoleErrorText,`${functionName} -> error :`, error);
    throw error;
  }
};

// exports.createUserAccountForDb_sql = async (
//   dbHost,
//   serverAdminCred,
//   dbUserCred
// ) => {
//   try {
//     const { adminUser, adminPassword, port, connectionLimit } = serverAdminCred;
//     const { dbUsername, dbPassword, dbName } = dbUserCred;

//     const credentials = {
//       connectionLimit,
//       host: dbHost,
//       user: adminUser,
//       password: adminPassword,
//       multipleStatements: true,
//       port,
//     };

//     const pool = mysql.createPool(credentials);

//     try {

//         const createUserQuery = `
//           CREATE USER '${dbUsername}'@'${dbHost}' IDENTIFIED BY '${dbPassword}';
//           GRANT ALL PRIVILEGES ON ${dbName}.* TO '${dbUsername}'@'${dbHost}';
//           FLUSH PRIVILEGES;
//         `;

//         await pool.query(createUserQuery);
//         console.log(`User '${dbUsername}'@'${dbHost}' created with privileges for database | success'${dbName}'.`);
      
     
//     } catch (error) {
//       console.error("createUserAccountForDb_sql() catch inner| error:", error);
//       throw error;
//     }
//   } catch (error) {
//     console.log("createUserAccountForDb_sql()-catch outer|error:", error);
//     throw error;
//   }
// };
exports.user_verification_delete_sql = async (
  userId
) => {
  const functionName = "user_verification_delete_sql()";
  try {
    const procedureParameters = [userId];
    const procedureOutputParameters = ["responseStatus", "outputMessage"];
    const procedureName = "user_verification_delete";
    const result = await executeStoredProcedureWithOutputParamsByPool(
      procedureName,
      procedureParameters,
      procedureOutputParameters,
      mainDbConnection_pool
    );

    const { responseStatus, outputMessage } = result.outputValues;
    if (responseStatus === SP_STATUS.failed) {
      console.log(
        consoleExceptionText,
        `${functionName} -> exception:`,
        outputMessage
      );
      return { exception: { message: outputMessage } };
    }
    const message = outputMessage;
    console.log(consoleSuccessText, `${functionName} -> success: ${message} `);

    return {
      message,
      records: null,
      values: result.outputValues,
    };
  } catch (error) {
    console.error(consoleErrorText, `${functionName} -> error :`, error);
    throw error;
  }
};

exports.get_connectionDetails_by_tenantId_sql = async (tenantId) => {
  try {
    const procedureParameters = [tenantId];
    const procedureOutputParameters = ["responseStatus", "outputMessage"];
    const procedureName = "get_connectionDetails_by_tenantId";
    const result = await executeStoredProcedureWithOutputParamsByPool(
      procedureName,
      procedureParameters,
      procedureOutputParameters,
      mainDbConnection_pool
    );
    const { responseStatus, outputMessage } = result.outputValues;

    if (responseStatus === SP_STATUS.failed) {
      throw { message: outputMessage };
    }

    return result.results[0][0];
  } catch (error) {
    throw error;
  }
};