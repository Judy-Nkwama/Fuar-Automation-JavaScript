const express = require("express");
const app = express();
app.use(express.json());

const mysql = require("mysql");
//my RESTful verbs functions
const posts = require("./post");
const gets = require("./get");
const puts = require("./put");

//The connection pool creation
const pool = mysql.createPool({
    connectionLimit : 100,
    host : "localhost",
    user : "root",
    password : "1234",
    database : "fuar_veri_tabani"
});

posts(app, pool);//POST REQUESTS
puts(app, pool);//PUTS REQUESTS
gets(app, pool);//GET REQUESTS

const port = process.env.PORT || 8000;
app.listen(port, ()=> { console.log(`Listenig on port ${port}...`); });