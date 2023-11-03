import {Sequelize} from 'sequelize'

const sequelize = new Sequelize("app_food", "root", "1234", {
    port: "3307",
    dialect: "mysql",
    host: "localhost"
})

export default sequelize