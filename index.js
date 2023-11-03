import express from 'express'
import rootRoutes from './src/routes/rootRoutes.js';
import cors from 'cors'

const app = express();

// define middleware:  chuyển đổi từ string sang json (khi POST)
app.use(express.json())

app.use(cors())

app.use("/api", rootRoutes)

app.listen(8080);

