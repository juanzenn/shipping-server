import express from "express";

const app = express();
const PORT = 8080;

app
  .get("/", (req, res) => {
    res.send({
      message: "Hello, World!",
    });
  })
  .get("/random", (req, res) => {
    res.send({
      number: Math.floor(Math.random() * 100),
    });
  });

app.listen(PORT, () => {
  console.log("Server up and running!");
});
