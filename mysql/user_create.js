const mysql = require('mysql2');

// Create a connection pool
const pool = mysql.createPool({
  connectionLimit: 10, // Number of connections to create
  host: '127.0.0.1',
  user: 'M$ds^j_k4GX2dsk_',
  password: 'Sf2jd#SdB54Sj#$_3$',
  database: 'main_db'
});

const test=()=>{
// Attempt to get a connection from the pool
pool.getConnection((err, connection) => {
  if (err) {
    console.error('Error getting connection from pool:', err);
    return;
  }
  console.error('Connect to the pool.');
    // Release the connection back to the pool when done testing
    connection.release();
})
};




module.exports = {
  test,
  executeStoredProcedureWithOutputParams_main,
};




