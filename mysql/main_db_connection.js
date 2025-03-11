const mysql = require('mysql2');

const mainDbConnection_pool = mysql.createPool({
  connectionLimit: 10, // Number of connections to create
  // host: 'localhost',
  // user: 'maindbUser',
  // password: 'Sf2jd#SdB54Sj#$_3$',
  // database: 'main_db',
  host: process.env.CONNECTION_MAIN_DB_HOST,
  user: process.env.CONNECTION_MAIN_DB_USERNAME,
  password:  process.env.CONNECTION_MAIN_DB_PASSWORD,
  database:  process.env.CONNECTION_MAIN_DB_NAME,
  port:process.env.CONNECTION_MAIN_DB_SERVER_PORT,
  ssl: false // Specify SSL should not be used
});


const mainDbConnection_error_handler_pool = mysql.createPool({
  connectionLimit: 10, // Number of connections to create
  // host: 'localhost',
  // user: 'maindbUser',
  // password: 'Sf2jd#SdB54Sj#$_3$',
  // database: 'main_db',
  host: process.env.CONNECTION_MAIN_DB_HOST,
  user: process.env.CONNECTION_MAIN_DB_USERNAME,
  password:  process.env.CONNECTION_MAIN_DB_PASSWORD,
  database:  process.env.CONNECTION_MAIN_DB_NAME,
  port:process.env.CONNECTION_MAIN_DB_SERVER_PORT,
  ssl: false // Specify SSL should not be used
});

const test=()=>{
pool.getConnection((err, connection) => {
  if (err) {
    console.error('Error getting connection from pool:', err);
    return;
  }
  console.error('Connect to the pool.');
    connection.release();
})
};


module.exports = {
  test,
  mainDbConnection_pool,
  mainDbConnection_error_handler_pool
};




