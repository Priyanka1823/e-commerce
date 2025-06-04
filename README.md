# ShopNest – eCommerce Flutter App

ShopNest is a fully functional, scalable eCommerce mobile application built using **Flutter** for the frontend and **Node.js + MongoDB Atlas** for the backend. It includes core eCommerce features such as user authentication, product browsing, cart management, and order processing.

## Features

- User Registration and Login (with Provider)
- Product Listing and Category Filtering
- Add to Cart, Remove from Cart
- Checkout and Order Placement
- Real-time Cart Updates using Cubit
- RESTful API integration with Node.js backend
- MongoDB Atlas for product and user data
- Responsive UI with clean code architecture

## Tech Stack

### Frontend:
- Flutter
- Provider (for authentication state)
- Cubit (for cart and product state)
- Dio / HTTP package (for API calls)
- Shared Preferences (for local storage)

### Backend:
- Node.js
- Express.js
- MongoDB Atlas
- JWT Authentication
- RESTful APIs

## Project Structure
lib/
├── models/
├── screens/
├── cubit/
├── providers/
├── services/
├── widgets/
└── main.dart


##  State Management

- **Provider**: Used for handling global user authentication state.
- **Cubit (flutter_bloc)**: Used for managing cart state, product listing, and UI responsiveness.

##  Authentication

- JWT-based authentication via REST APIs
- Login and registration screens
- Session management with secure token storage

## API Integration

- All user, cart, and product data is fetched via custom-built RESTful APIs.
- Real-time cart updates synced with the backend.

## Database

- MongoDB Atlas for storing:
  - User profiles
  - Product catalog
  - Cart data
  - Order details

## 📱 Screenshots


> Built with using Flutter and Node.js

