
const util = require("util");
const { exec } = require("child_process");
const fs = require('fs');

const MYSQL_PATH =process.env.MYSQL_PATH; //"C:/Program Files/MariaDB 11.3/bin"; // Use forward slashes on Windows
const consoleSuccessText='\x1b[92m%s\x1b[0m';
const consoleErrorText='\x1b[91m%s\x1b[0m';
const consoleException='\x1b[33m%s\x1b[0m';

exports.dropDatabase_shcmd = async (
  hostName,
  adminUser,
  adminPassword,
  port,
  dbName
) => {
  const functionName="dropDatabase_shcmd()";
  try {
    // Construct the SQL query to check if the database exists.
    const checkDatabaseCommand = `"${MYSQL_PATH}/mysql" -h ${hostName} -P ${port} -u ${adminUser} -p${adminPassword} -e "SHOW DATABASES LIKE '${dbName}'"`;

    // Execute the SQL query to check if the database exists.
    const execPromisified = util.promisify(exec);
    const { stdout, stderr } = await execPromisified(checkDatabaseCommand);

    // Check if the database exists based on the query result.
    if (stdout.includes(dbName)) {
      // The database exists, so proceed with the drop.
      const dropCommand = `"${MYSQL_PATH}/mysql" -h ${hostName} -P ${port} -u ${adminUser} -p${adminPassword} -e "DROP DATABASE ${dbName}"`;
      console.log("Dropping MySQL Database.......");

      // Perform the database drop.
      await execPromisified(dropCommand);
  
      const message=`Database ${dbName} has been dropped.`;
      console.log(consoleSuccessText,`${functionName} -> ${message}`);
      return {message}

    } else {
      // The database does not exist.
      const exception={message:`Database ${dbName} does not exist.`};
      console.log(consoleException,`${functionName} -> ${exception.message}`);
      return {exception};
    }
  } catch (error) {
    console.error(consoleErrorText,`${functionName} -> error :`, error);
    throw error;
  }
};

exports.backupMySQLDatabase_shcmd = async (
  hostName,
  adminUser,
  adminPassword,
  port,
  dbName,
  dumpFile
) => {
  const functionName="backupMySQLDatabase_shcmd()";
  try {
    // Construct the SQL query to check if the database exists.
    const checkDatabaseCommand = `"${MYSQL_PATH}/mysql" -h ${hostName} -P ${port} -u ${adminUser} -p${adminPassword} -e "SHOW DATABASES LIKE '${dbName}'"`;

    const execPromisified = util.promisify(exec);

    // Execute the SQL query to check if the database exists.
    const { stdout } = await execPromisified(checkDatabaseCommand);

    // Check if the database exists based on the query result.
    if (stdout.includes(dbName)) {
      // The database exists, so proceed with the backup.
      const backupCommand = `"${MYSQL_PATH}/mysqldump" -h ${hostName} -P ${port} -u ${adminUser} -p${adminPassword} --routines --events --comments ${dbName} > ${dumpFile}`;
      console.log("Performing database backup.......");

      // Perform the database backup.
      await execPromisified(backupCommand);
      const message=`Database ${dbName} has been backed up to ${dumpFile}.`;
      console.log(consoleSuccessText,`${functionName} -> ${message}`);
      return {message}
    } else {
      // The database does not exist.
      const exception={message:`Database ${dbName} does not exist. Backup not performed.`};
      console.log(consoleException,`${functionName} -> ${exception.message}`);
      return {exception};
    }
  } catch (error) {
    console.error(consoleErrorText,`${functionName} -> error :`, error);
    throw error;
  }
};


exports.restoreDatabase_shcmd = async (
  hostName,
  adminUser,
  adminPassword,
  port,
  dbName,
  dumpFile
) => {
  const functionName = "restoreDatabase_shcmd()";

  try {

    if(!hostName) throw new Error("hostName is required.");
    if(!adminUser) throw new Error("adminUser is required.");
    if(!adminPassword) throw new Error("adminPassword is required.");
    if(!port) throw new Error("port is required.");
    if(!dbName) throw new Error("dbName is required.");
    if(!dumpFile) throw new Error("dumpFile is required.");

    // Check if the dumpFile path exists and the file itself exists
    if (fs.existsSync(dumpFile)) {
      const checkDatabaseCommand = `"${MYSQL_PATH}/mysql" -h ${hostName} -P ${port} -u ${adminUser} -p${adminPassword} -e "SHOW DATABASES LIKE '${dbName}'"`;

      // Execute the SQL query to check if the database exists.
      const execPromisified = util.promisify(exec);
      const { stdout } = await execPromisified(checkDatabaseCommand);

      // Check if the database exists based on the query result.
      if (!stdout.includes(dbName)) {
        // Construct the create database command.
        const createDbCommand = `"${MYSQL_PATH}/mysqladmin" -h ${hostName} -P ${port} -u ${adminUser} -p${adminPassword} create ${dbName}`;

        // Construct the restore database command with the specified port.
        const restoreDbCommand = `"${MYSQL_PATH}/mysql" -h ${hostName} -P ${port} -u ${adminUser} -p${adminPassword} --comments ${dbName} < ${dumpFile}`;

        console.log("restoreMariaDBDatabase.......");

        // Create the database.
        await execPromisified(createDbCommand);
        console.log(`Database ${dbName} has been created.`);

        // Restore the database.
        await execPromisified(restoreDbCommand);

        const message = `Database ${dbName} has been restored from ${dumpFile}.`;
        console.log(consoleSuccessText,`${functionName} -> ${message}`);
        return { message };
      } else {
        const exception = { message: `Database ${dbName} already exists.` };
        console.log(consoleException,`${functionName} -> ${exception.message}`);
        return { exception };
      }
    } else {
      const exception = { message:`File ${dumpFile} doesn't exist.`};
      console.log(`${functionName} -> ${exception.message}`);
      return { exception };
    }
  } catch (error) {
    console.error(consoleErrorText,`${functionName} -> error:`, error);
    throw error;
  }
};



// exports.restoreDatabase_shcmd = async (
//   hostName,
//   adminUser,
//   adminPassword,
//   port,
//   dbName,
//   dumpFile
// ) => {

//   const functionName="restoreDatabase_shcmd()";
//   try {
//     const checkDatabaseCommand = `"${MYSQL_PATH}/mysql" -h ${hostName} -P ${port} -u ${adminUser} -p${adminPassword} -e "SHOW DATABASES LIKE '${dbName}'"`;

//         // Execute the SQL query to check if the database exists.
//         const execPromisified = util.promisify(exec);
//         const { stdout, stderr } = await execPromisified(checkDatabaseCommand);

//           // Check if the database exists based on the query result.
//     if (!stdout.includes(dbName)) {

//     // Construct the create database command.
//     const createDbCommand = `"${MYSQL_PATH}/mysqladmin" -h ${hostName} -P ${port} -u ${adminUser} -p${adminPassword} create ${dbName}`;

//     // Construct the restore database command with the specified port.
//     const restoreDbCommand = `"${MYSQL_PATH}/mysql" -h ${hostName} -P ${port} -u ${adminUser} -p${adminPassword} --comments ${dbName} < ${dumpFile}`;

//     console.log("restoreMariaDBDatabase.......");

//     // Create the database.
//     await execPromisified(createDbCommand);
//     console.log(`Database ${dbName} has been created.`);

//     // Restore the database.
//     await execPromisified(restoreDbCommand);

//     const message=`Database ${dbName} has been restored from ${dumpFile}.`;
//     console.log(`${functionName} -> ${message}`);
//     return {message}
//   } else {
//     const exception={message:`Database ${dbName} already exist.`};
//     console.log(`${functionName} -> ${exception.message}`);
//     return {exception};
//   }

//   } catch (error) {
//     console.error(`${functionName} -> error :`, error);
//     throw error;
//   }
// };

exports.removeDBUserAccount_shcmd = async (
  hostName,
  adminUser,
  adminPassword,
  port,
  userName
) => {
  const functionName="removeDBUserAccount_shcmd()";
  try {

    if(!hostName) throw new Error("hostName is required.");
    if(!adminUser) throw new Error("adminUser is required.");
    if(!adminPassword) throw new Error("adminPassword is required.");
    if(!port) throw new Error("port is required.");
    if(!userName) throw new Error("userName is required.");

    // Construct the SQL query to check if the user exists.
    const checkUserCommand = `"${MYSQL_PATH}/mysql" -h ${hostName} -P ${port} -u ${adminUser} -p${adminPassword} -e "SELECT User FROM mysql.user WHERE User = '${userName}'"`;

    // Execute the SQL query to check if the user exists.
    const execPromisified = util.promisify(exec);
    const { stdout, stderr } = await execPromisified(checkUserCommand);

    // Check if the user exists based on the query result.
    if (stdout.includes(userName)) {
      // The user exists, so proceed with the removal.
      const dropUserCommand = `"${MYSQL_PATH}/mysql" -h ${hostName} -P ${port} -u ${adminUser} -p${adminPassword} -e "DROP USER '${userName}'@'${hostName}'"`;
      console.log(`Removing MySQL User ${userName}.......`);
      await execPromisified(dropUserCommand);

      const message=`MySQL User ${userName} has been removed.`;
      console.log(consoleSuccessText,`${functionName} -> ${message}`);
return {message}
    } else {
      // The user does not exist.
      const exception={message:`MySQL User ${userName} does not exist.`};
      console.log(consoleException,`${functionName} -> ${exception.message}`);
      return {exception};
    }
  } catch (error) {
    console.error(consoleErrorText,`${functionName} -> error :`, error);
    throw error;
  }
};


// exports.createUserAccountForDb_shcmd = async (hostName, serverAdminCred, dbUserCred) => {
//   const functionName = "createUserAccountForDb_shcmd()";

//   try {
//     if (!hostName) throw new Error("hostName is required.");
//     // ... (other parameter validations - adminUser, adminPassword, port, dbUsername, dbPassword, dbName)

//     const dbHost = hostName;
//     const { adminUser, adminPassword, port } = serverAdminCred;
//     const { dbUsername, dbPassword, dbName } = dbUserCred;
    
//     if(!adminUser) throw new Error("adminUser is required.");
//     if(!adminPassword) throw new Error("adminPassword is required.");
//     if(!port) throw new Error("port is required.");
//     if(!dbUsername) throw new Error("dbUsername is required.");
//     if(!dbPassword) throw new Error("dbPassword is required.");
//     if(!dbName) throw new Error("dbName is required.");


//     const createUserCommand = `
//       mysql -h ${dbHost} -P ${port} -u ${adminUser} -p${adminPassword} -e "SELECT User FROM mysql.user WHERE User = '${dbUsername}' AND Host = '${dbHost}'; CREATE USER '${dbUsername}'@'${dbHost}' IDENTIFIED BY '${dbPassword}'; GRANT ALL PRIVILEGES ON ${dbName}.* TO '${dbUsername}'@'${dbHost}'; FLUSH PRIVILEGES;"
//     `;

//     const createUser = util.promisify(exec);
//     const { stdout, stderr } = await createUser(createUserCommand);

//     if (!stderr) {
//       const message = `User '${dbUsername}'@'${dbHost}' created with privileges for database '${dbName}'.`;
//       console.log(`${functionName} -> ${message}`);
//       return { message };
//     } else {
//       console.error(`${functionName} -> error:`, stderr);
//       return { error: stderr };
//     }
//   } catch (error) {
//     console.error(`${functionName} -> error:`, error);
//     throw error;
//   }
// };



