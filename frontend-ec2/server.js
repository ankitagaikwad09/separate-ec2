const express = require("express");
const axios = require("axios");
const app = express();

const BACKEND_URL = process.env.BACKEND_URL;

app.use(express.json());
app.use(express.static("public"));

app.post("/register", async (req, res) => {
  try {
    const response = await axios.post(
      `${BACKEND_URL}/api/register`,
      req.body
    );
    res.json(response.data);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ error: "Backend not reachable" });
  }
});

app.listen(3000, () => {
  console.log("Frontend running on port 3000");
});
