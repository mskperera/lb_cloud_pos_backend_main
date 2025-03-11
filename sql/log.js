const { CONSOLE_TEXT_COLORS, SP_STATUS } = require("../constants/constants");
const { executeStoredProcedureWithOutputParamsByPool } = require("../mysql/sql_executer");

const {consoleSuccessText,consoleErrorText,consoleExceptionText }=CONSOLE_TEXT_COLORS;

exports.userLogInsertUpdate_sql = async (tenant, userId,loginStatus,ipAddress,userAgent,sessionId,additionalInfo,utcOffset,pageName) => {
    const functionName = "userLogInsertUpdate_sql()";
    try {
      const { pool } = tenant;
      const procedureParameters = [userId,loginStatus,ipAddress,userAgent,sessionId,additionalInfo,utcOffset,pageName];
      const procedureOutputParameters = ["responseStatus","outputMessage","userLogId"];
      const procedureName = "UserLog_Insert_Update";
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