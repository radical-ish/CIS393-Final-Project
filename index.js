import express from "express";
import con from "./dbConnection.js";

const app = express();

const port = 8080;

app.use(express.urlencoded({ extended: false }));
app.use(express.static("public"));
app.set("template engine", "ejs");
app.set("views", "views");
app.use(express.json());

app.get("/generate", async (req, res) => {
  const [tableCols, field] = await con.query(
    "select count(*) as count from article_text",
  );

  let rng = Math.floor(Math.random() * tableCols[0].count) + 1;

  let q = "select * from article_text where id=?";

  try {
    const [result, fields] = await con.query(q, [rng]);
    res.render("generate.ejs", { result: result[0] });
  } catch (err) {
    res.send(err);
  }
});

app.post("/suggestions", async (req, res) => {
  let name = req.body.name;
  let desc = req.body.description;
  let source = req.body.source;
  let color = req.body.color;
  let q =
    "insert into suggestions (name, description, source, colorHex) values(?, ?, ?, ?)";
  con.query(q, [name, desc, source, color], (err, result) => {
    if (err) res.send(err);
    res.redirect("/suggestions.html");
  });
});

async function auth(req, res, next) {
  const authHead = req.headers.authorization;
  if (!authHead) {
    const err = new Error("Unauthorized");
    res.setHeader("WWW-Authenticate", "Basic");
    err.status = 401;
    return next(err);
  }

  const q = "select * from users where username = ?";
  const auth = Buffer.from(authHead.split(" ")[1], "base64")
    .toString()
    .split(":");

  const [user, fields] = await con.query(q, [auth[0]]);

  if (user[0] && auth[1] === user[0].password) {
    next();
  } else {
    const err = new Error("Unauthorized");
    res.setHeader("WWW-Authenticate", "Basic");
    err.status = 401;
    return next(err);
  }
}

app.use(auth);

app.get("/articles", async (req, res) => {
  const q = "select * from article_text";
  const [result, fields] = await con.query(q);

  res.render("articles.ejs", { result: result });
});

app.get("/suggestionData", async (req, res) => {
  const q = "select * from suggestions";
  const [result, fields] = await con.query(q);

  res.render("suggestionData.ejs", { result: result });
});

app.get("/insert", async (req, res) => {
  res.render("insert.ejs");
});

app.post("/insert", (req, res) => {
  let title = req.body.textField;
  let detail = req.body.description;
  let q = "insert into article_text (title, detail) values(?, ?)";
  con.query(q, [title, detail], (err, result) => {
    if (err) res.send(err);
    res.send(result);
  });
});

app.get("/update/:id", async (req, res) => {
  const q = "select * from article_text where id=?";
  const id = req.params.id;

  const [result, fields] = await con.query(q, [id]);

  res.render("update.ejs", { result: result[0] });
});

app.post("/update/:id", (req, res) => {
  let title = req.body.textField;
  let detail = req.body.description;
  let id = req.params.id;
  let q = "update article_text set title = ?, detail = ? where id = ?";
  con.query(q, [title, detail, id], (err, result) => {
    if (err) res.send(err);
    res.send(result);
  });
});

app.get("/articles/delete/:id", (req, res) => {
  let id = req.params.id;
  const q = "delete from article_text where id=?";
  con.query(q, [id], (err, result) => {
    if (err) res.send(err);
    else {
      res.send(result);
    }
  });

  con.query("alter table article_text auto_increment = 0");
});

app.get("/suggestionData/delete/:id", (req, res) => {
  let id = req.params.id;
  const q = "delete from suggestions where id=?";
  con.query(q, [id], (err, result) => {
    if (err) res.send(err);
    else {
      res.send(result);
    }
  });

  con.query("alter table suggestions auto_increment = 0");
});

app.listen(port, (err) => {
  if (err) throw err;
  console.log("Server is listening at port " + port);
});
