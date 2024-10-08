const express = require('express');
const bodyParser = require('body-parser');
const helmet = require('helmet');
const morgan = require('morgan');
const cors = require('cors');
const mongoose = require('mongoose');

const app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(helmet());
app.use(morgan('dev'));
app.use(cors());


mongoose.connect("mongodb+srv://priyanka63:priyanka123@cluster0.bvewdor.mongodb.net/ecommerce?retryWrites=true&w=majority&appName=Cluster0")
    .then(() => console.log("Connected to MongoDB"))
    .catch((err) => console.log("Failed to connect to MongoDB", err));

 const UserRoutes = require('./routes/user_routes');
 app.use("/api/user", UserRoutes);

 const CategoryRoutes = require('./routes/category_routes');
app.use("/api/category", CategoryRoutes);

const ProductRoutes = require('./routes/product_routes');
app.use("/api/product", ProductRoutes);

const CartRoutes = require('./routes/cart_routes');
app.use("/api/cart", CartRoutes);

const OrderRoutes = require('./routes/order_routes');
app.use("/api/order", OrderRoutes);

const SearchRoutes = require('./routes/search_routes');
app.use("/api/search", SearchRoutes);

const FavoriteRoutes = require('./routes/favorite_routes');
app.use("/api/favorite", FavoriteRoutes);

const PORT = 5000;
app.listen(PORT, () => console.log(`Server started at PORT: ${PORT}`));