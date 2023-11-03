import initModels from '../models/init-models.js'
import sequelize from '../models/connect.js'
import { where } from 'sequelize'

const model = initModels(sequelize)


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

const addLikeRes = async (req, res) => {
    let { user_id, res_id, date_like } = req.body;
    let result = await model.like_res.create({ user_id, res_id, date_like })
    res.send("Like thành công")
}


/** =============================================================
 * ==== API 2: Dislike ====
 * Test: DELETE: http://localhost:8080/api/res/disLikeRes
 * Body: 
 * {
    "like_id": 2
    }
 */

const disLikeRes = async (req, res) => {
    let {like_id} = req.body;

    let result = await model.like_res.destroy({
        where: {
            id: like_id
        }
    })
    res.send("Dislike thành công")
}


/** =============================================================
 * ==== API 3: Lấy danh sách like theo nhà hàng ====
 * Test: GET: http://localhost:8080/api/res/getLikeListByRes/1
 */

const getLikeListByRes = async (req, res) => {
    let { resId } = req.params;
    let data = await model.like_res.findAll({
        include: ["user"],
        where: {
            res_id: resId
        }
    })
    res.send(data)
}


/** =============================================================
 * ==== API 4: Lấy danh sách like theo User ====
 * Test: GET: http://localhost:8080/api/res/getLikeListByUser/6
 */

const getLikeListByUser = async (req, res) => {
    let { userId } = req.params;
    let data = await model.like_res.findAll({
        where: {
            user_id: userId
        }
    })
    res.send(data)
}


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

const addRateRes = async (req, res) => {
    let { user_id, res_id, amount, date_rate } = req.body;
    let result = await model.rate_res.create({ user_id, res_id, amount, date_rate })
    res.send("Thêm đánh giá thành công")
}


/** =============================================================
 * ==== API 6: Lấy danh sách đánh giá theo nhà hàng ====
 * Test: GET: http://localhost:8080/api/res/getRateListByRes/6
 */

const getRateListByRes = async (req, res) => {
    let { resId } = req.params;
    let data = await model.rate_res.findAll({
        include: ["user"],
        where: {
            res_id: resId
        }
    })
    res.send(data)
}


/** =============================================================
 * ==== API 7: Lấy danh sách đánh giá theo User ====
 * Test: GET: http://localhost:8080/api/res//getRateListByUser/1
 */

const getRateListByUser = async (req, res) => {
    let { userId } = req.params;
    let data = await model.rate_res.findAll({
        where: {
            user_id: userId
        }
    })
    res.send(data)
}


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

const orderFood = async (req, res) => {
    let { user_id, food_id, amount, code, arr_sub_id } = req.body;
    let result = await model.orders.create({ user_id, food_id, amount, code, arr_sub_id })
    res.send("Order thành công")
}


export {
    addLikeRes,
    disLikeRes,
    getLikeListByRes,
    getLikeListByUser,
    addRateRes,
    getRateListByRes,
    getRateListByUser,
    orderFood
}