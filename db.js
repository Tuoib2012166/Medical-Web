const mysql = require('mysql2/promise');

// const db = mysql.createPool({
//     host: process.env.DB_HOST || "103.221.222.62",
//     user: process.env.DB_USER || "waghgljj_nhakhoauser",
//     port: process.env.DB_PORT || 3306,
//     password: process.env.DB_PASSWORD || "!pr9bTW8vmeLwHY",
//     database: process.env.DB_NAME || "waghgljj_nhakhoa",
//     timezone: '+07:00',
//     waitForConnections: true,
//     connectionLimit: 10,
//     queueLimit: 0
// });


const db = mysql.createPool({
    host: process.env.DB_HOST || "localhost",
    user: process.env.DB_USER || "root",
    port: process.env.DB_PORT || 3306,
    password: process.env.DB_PASSWORD || "",
    database: process.env.DB_NAME || "nhakhoa",
    timezone: '+07:00',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});


module.exports = db;