const {
  mainDbConnection_pool,
  mainDbConnection_error_handler_pool,
} = require("../mysql/main_db_connection");
const mysql = require("mysql2");
const util = require("util");
const { exec } = require("child_process");
const { SP_STATUS } = require("../constants");
const {
  executeStoredProcedureWithOutputParamsByPool,
  executeSqlQueryWithOutputParamsByPool,
} = require("../mysql/sql_executer");

const MYSQL_PATH =process.env.MYSQL_PATH; //"C:/Program Files/MariaDB 11.3/bin"; // Use forward slashes on Windows

const consoleSuccessText='\x1b[92m%s\x1b[0m';
const consoleErrorText='\x1b[91m%s\x1b[0m';
const consoleException='\x1b[33m%s\x1b[0m';

exports.userAccount_select_sql = async (userName) => {
  const functionName = "userAccount_select_sql()";
  try {
    const procedureParameters = [userName];
    const procedureOutputParameters = ["responseStatus", "outputMessage"];
    const procedureName = "userAccount_select";
    const result = await executeStoredProcedureWithOutputParamsByPool(
      procedureName,
      procedureParameters,
      procedureOutputParameters,
      mainDbConnection_pool
    );

    const { responseStatus, outputMessage } = result.outputValues;
    if (responseStatus === SP_STATUS.failed) {
      console.log(consoleException,`${functionName} -> exception:`, outputMessage);
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