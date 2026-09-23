const express = require("express");

const app = express();
const PORT = 3000;

app.get("/", (req, res) => {
  res.json({
    message: "Node.js API is running"
  });
});

app.get("/api/health", (req, res) => {
  res.json({
    status: "healthy"
  });
});

app.listen(PORT, () => {
  console.log(`Node.js API running on port ${PORT}`);
});
