import express from 'express'
import { addLikeRes, addRateRes, disLikeRes, getLikeListByRes, getLikeListByUser, getRateListByRes, getRateListByUser, orderFood } from '../controllers/restaurantController.js';

const restaurantRoutes = express.Router();


/** =============================================================
 * ==== API 1: Thêm like ====
 * Test: POST: http://localhost:8080/api/res/addLikeRes
 * Body: 
 * {
    "user_id": 1,
    "res_id": 1,
    "date_like": "10-10-23"
    }
 */

restaurantRoutes.post("/addLikeRes", addLikeRes);


/** =============================================================
 * ==== API 2: Dislike ====
 * Test: DELETE: http://localhost:8080/api/res/disLikeRes
 * Body: 
 * {
    "like_id": 2
    }
 */

restaurantRoutes.delete("/disLikeRes", disLikeRes);


/** =============================================================
 * ==== API 3: Lấy danh sách like theo Nhà Hàng ====
 * Test: GET: http://localhost:8080/api/res/getLikeListByRes/1
 */

restaurantRoutes.get("/getLikeListByRes/:resId", getLikeListByRes);


/** =============================================================
 * ==== API 4: Lấy danh sách like theo User ====
 * Test: GET: http://localhost:8080/api/res/getLikeListByUser/6
 */

restaurantRoutes.get("/getLikeListByUser/:userId", getLikeListByUser);


/** =============================================================
 * ==== API 5: Thêm đánh giá cho nhà hàng ====
 * Test: POST: http://localhost:8080/api/res/addRateRes
 * Body: 
 * {
    "user_id": 1,
    "res_id": 3,
    "amount": 10,
    "date_rate": "10-10-23"
    }
 */

restaurantRoutes.post("/addRateRes", addRateRes);


/** =============================================================
 * ==== API 6: Lấy danh sách đánh giá theo nhà hàng ====
 * Test: GET: http://localhost:8080/api/res//getRateListByRes/6
 */

restaurantRoutes.get("/getRateListByRes/:resId", getRateListByRes);


/** =============================================================
 * ==== API 7: Lấy danh sách đánh giá theo User ====
 * Test: GET: http://localhost:8080/api/res/getRateListByUser/1
 */

restaurantRoutes.get("/getRateListByUser/:userId", getRateListByUser);


/** =============================================================
 * ==== API 8: Order đặt món ====
 * Test: POST: http://localhost:8080/api/res/orderFood
 * Body: 
 * {
    "user_id": 1,
    "food_id": 1,
    "amount": 10,
    "code": "ADDCODE1",
    "arr_sub_id": "ADDSUB1"
    }
 */

restaurantRoutes.post("/orderFood", orderFood);


export default restaurantRoutes