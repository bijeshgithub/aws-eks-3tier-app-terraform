const express = require("express");
const cors = require("cors");
const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());            // Allow requests from frontend
app.use(express.json());    // Parse JSON request bodies

// Example route
app.get("/api/hello", (req, res) => {
  res.json({ message: "Hello from backend 🚀" });
});

// Example route in routes folder (optional)
// const apiRouter = require("./routes/api");
// app.use("/api", apiRouter);

// Start server
app.listen(PORT, () => {
  console.log(`Backend server running on http://localhost:${PORT}`);
});
