const {
  mainDbConnection_pool
} = require("../mysql/main_db_connection");
const { SP_STATUS } = require("../constants");
const {
  executeStoredProcedureWithOutputParamsByPool
} = require("../mysql/sql_executer");

const consoleSuccessText='\x1b[92m%s\x1b[0m';
const consoleErrorText='\x1b[91m%s\x1b[0m';
const consoleException='\x1b[33m%s\x1b[0m';


exports.user_verification_insert_sql = async (userId) => {
  const functionName = "user_verification_insert_sql()";
  try {
    const procedureParameters = [userId];
    const procedureOutputParameters = ["responseStatus", "outputMessage","verificationCode","expirationTime_sec"];
    const procedureName = "user_verification_insert";
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
    return {message,records:null,values:result.outputValues };

  } catch (error) {
    console.error(consoleErrorText,`${functionName} -> error :`, error);
    throw error;
  }
};

exports.user_verification_select_sql = async (userId) => {
  const functionName = "user_verification_select_sql()";
  try {
    const procedureParameters = [userId];
    const procedureOutputParameters = ["responseStatus", "outputMessage"];
    const procedureName = "user_verification_select";
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