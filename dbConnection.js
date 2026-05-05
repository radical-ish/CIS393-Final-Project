import mysql from "mysql2/promise";

const con = await mysql.createConnection({
  host: "localhost",
  user: "root",
  database: "article_db",
  password: "",
});

con.connect((err) => {
  if (err) throw err;
  console.log("Database is connected");
});

export default con;
