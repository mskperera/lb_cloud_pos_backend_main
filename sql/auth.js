const { SP_STATUS } = require("../constants/constants");
const {
  executeStoredProcedureWithOutputParamsByPool,
} = require("../mysql/sql_executer");

const {CONSOLE_TEXT_COLORS} =require('../constants/constants')
const {consoleSuccessText,consoleErrorText,consoleExceptionText }=CONSOLE_TEXT_COLORS;

exports.userRegistration_select_by_userName_sql = async (tenant, userName) => {
  const functionName = "userRegistration_select_by_userName_sql()";
  try {
    const { pool } = tenant;
    const procedureParameters = [userName];
    const procedureOutputParameters = ["responseStatus", "outputMessage"];
    const procedureName = "userRegistration_select_by_userName";
    const result = await executeStoredProcedureWithOutputParamsByPool(
      procedureName,
      procedureParameters,
      procedureOutputParameters,
      pool
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
      records: result.results[0][0],
      values: result.outputValues,
    };
  } catch (error) {
    console.error(consoleErrorText, `${functionName} -> error :`, error);
    throw error;
  }
};

exports.userRegistration_insert_sql = async (
  tenant,
  userName,
  passwordHash,
  passwordSalt,
  email,
  displayName
) => {
  const functionName = "userRegistration_insert_sql()";
  try {
    const { pool } = tenant;
    const procedureParameters = [
      userName,
      passwordHash,
      passwordSalt,
      email,
      displayName,
    ];
    const procedureOutputParameters = ["responseStatus", "outputMessage"];
    const procedureName = "userRegistration_insert";
    const result = await executeStoredProcedureWithOutputParamsByPool(
      procedureName,
      procedureParameters,
      procedureOutputParameters,
      pool
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

exports.userPassword_update_sql = async (
  tenant,
  userName,
  passwordHash,
  passwordSalt
) => {
  const functionName = "userPassword_update_sql()";
  try {
    const { pool } = tenant;
    const procedureParameters = [userName, passwordHash, passwordSalt];
    const procedureOutputParameters = ["responseStatus", "outputMessage"];
    const procedureName = "userPassword_update";
    const result = await executeStoredProcedureWithOutputParamsByPool(
      procedureName,
      procedureParameters,
      procedureOutputParameters,
      pool
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

exports.userAssignedStores_select_sql = async (tenant, userId) => {
  const functionName = "userAssignedStores_select_sql()";
  try {
    const { pool } = tenant;
    const procedureParameters = [userId];
    const procedureOutputParameters = [];
    const procedureName = "userAssignedStores_select";
    const result = await executeStoredProcedureWithOutputParamsByPool(
      procedureName,
      procedureParameters,
      procedureOutputParameters,
      pool
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
      records: result.results[0],
      values: result.outputValues,
    };
  } catch (error) {
    console.error(consoleErrorText, `${functionName} -> error :`, error);
    throw error;
  }
};