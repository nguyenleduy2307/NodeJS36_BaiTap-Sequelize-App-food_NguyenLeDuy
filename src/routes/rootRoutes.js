import restaurantRoutes from  "./restaurantRoutes.js"

import express from 'express'

const rootRoutes = express.Router();

rootRoutes.use("/res", restaurantRoutes)

export default rootRoutes;