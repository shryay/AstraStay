# AstraStay - Premium Property & Hotel Management API

Welcome to the backend repository of **AstraStay** (formerly AirBnb Backend), developed and maintained by **Shreya Upadhyay**.

This application provides a highly scalable, robust, and secure backend REST API for a complete hotel management system. It bridges the gap between guests looking for premium stays and administrators managing complex property inventories, bookings, and real-time availability.

## 🚀 Live Interactive API
The API is successfully deployed and live! You can interactively test the endpoints, explore the request models, and read descriptions via the Swagger UI:
👉 **[AstraStay Interactive API Docs](https://astrastay.onrender.com/api/v1/swagger-ui/index.html)**

---

## 🏗️ System Architecture & Layered Design

AstraStay is engineered using best-in-class architectural principles to ensure maintainability, testability, and enterprise-grade scalability.

### N-Tier (Multi-Layered) Architecture
The application strictly enforces separation of concerns through a layered architecture:

1. **Presentation Layer (Controllers)**: Handles HTTP requests, enforces payload validation, and manages API routing. It never leaks database models to the client, securely returning structured Data Transfer Objects (DTOs) instead.
2. **Business Logic Layer (Services)**: The core brain of AstraStay. All complex operations—such as preventing double-bookings, orchestrating Stripe webhooks, and locking inventory logic—live here, completely decoupled from HTTP concerns.
3. **Data Access Layer (Repositories)**: Utilizes Spring Data JPA (Hibernate) to interface seamlessly with the PostgreSQL database. It abstracts complex SQL queries and handles safe transaction management.
4. **Security Layer**: Intercepts requests to validate JWTs (JSON Web Tokens) and enforces strict Role-Based Access Control (RBAC) to ensure guests cannot access highly sensitive admin or inventory endpoints.

---

## 🧩 Key Design Patterns Implemented

- **DTO (Data Transfer Object) Pattern**: Prevents over-posting vulnerabilities and provides a clean contract for API consumers by isolating internal domain entities.
- **Dependency Injection (DI)**: Managed by the Spring IoC (Inversion of Control) container, ensuring components are loosely coupled and easily mockable for unit testing.
- **Facade Pattern**: Used to simplify complex booking flows. A unified controller talks to a single facade that orchestrates the User, Inventory, Payment, and Notification services behind the scenes.
- **Builder Pattern**: Extensively used to cleanly construct complex entities (like Booking records and custom API responses) in a thread-safe and immutable way.
- **Strategy Pattern**: The payment processing module is designed using strategy interfaces, preparing AstraStay to easily support PayPal or Razorpay alongside the existing Stripe integration.

---

## 🛠️ Technology Stack
- **Core Framework:** Java 23, Spring Boot 3.x
- **Database:** PostgreSQL (Hosted on Neon.tech)
- **Authentication:** Spring Security with JWT (JSON Web Tokens)
- **Payment Gateway:** Stripe API integration via secured Webhooks
- **ORM / Persistence:** Hibernate & Spring Data JPA
- **API Documentation:** OpenAPI 3.0 (Swagger UI)
- **Deployment & DevOps:** Docker, AWS Corretto, Render Cloud

---

## 📖 Complete API Reference

Below is a detailed breakdown of the features and routing built into AstraStay:

### User Authentication
- **POST** `/auth/signup` - Register a new user
- **POST** `/auth/login` - Authenticate and retrieve JWT
- **POST** `/auth/refresh` - Refresh an expired access token

### User Profile & Guests
- **GET** `/users/profile` - Retrieve authenticated user profile
- **PATCH** `/users/profile` - Update profile information
- **GET** `/users/myBookings` - Get historical and active bookings
- **POST** `/users/guests` - Add an accompanying guest
- **GET** `/users/guests` - Retrieve your registered guests
- **PUT** `/users/guests/{guestId}` - Update guest details
- **DELETE** `/users/guests/{guestId}` - Remove a guest

### Hotel Browsing & Search
- **GET** `/hotels/search` - Advanced search for available hotels
- **GET** `/hotels/{hotelId}/info` - Get public hotel details

### Booking Flow
- **POST** `/bookings/init` - Initialize a new booking hold
- **POST** `/bookings/{bookingId}/addGuests` - Attach guests to the booking
- **POST** `/bookings/{bookingId}/payments` - Initiate Stripe checkout
- **POST** `/bookings/{bookingId}/cancel` - Cancel a booking
- **GET** `/bookings/{bookingId}/status` - Check real-time payment/booking status

### Payment Webhooks
- **POST** `/webhook/payment` - Secure endpoint for Stripe to capture and finalize payments

### Administrator Configuration (Role: ADMIN)
#### Hotel Management
- **POST** `/admin/hotels` - Onboard a new hotel
- **GET** `/admin/hotels` - Retrieve all hotels
- **GET** `/admin/hotels/{hotelId}` - Get total admin details of a hotel
- **PUT** `/admin/hotels/{hotelId}` - Update hotel details
- **PATCH** `/admin/hotels/{hotelId}/activate` - Toggle hotel activation status
- **DELETE** `/admin/hotels/{hotelId}` - Remove a hotel
- **GET** `/admin/hotels/{hotelId}/reports` - Generate analytical booking reports
- **GET** `/admin/hotels/{hotelId}/bookings` - List all bookings for a property

#### Room & Inventory Management
- **POST** `/admin/hotels/{hotelId}/rooms` - Create a room category
- **GET** `/admin/hotels/{hotelId}/rooms` - Get all rooms
- **GET** `/admin/hotels/{hotelId}/rooms/{roomId}` - Get deep room details
- **PUT** `/admin/hotels/{hotelId}/rooms/{roomId}` - Update a room configuration
- **DELETE** `/admin/hotels/{hotelId}/rooms/{roomId}` - Remove a room
- **GET** `/admin/inventory/rooms/{roomId}` - Retrieve exact date-based inventory
- **PATCH** `/admin/inventory/rooms/{roomId}` - Adjust real-time block/availability
- **PUT** `/admin/hotels/{hotelId}/rooms/{roomId}` - Advanced room update

---

## 🗄️ Database Schema

The relational database is highly normalized to guarantee data integrity across users, bookings, payments, and dynamic hotel inventory.

![AstraStay Entity-Relationship Schema](https://github.com/user-attachments/assets/bc209296-e0f2-48f9-a7ae-65d084e4cb6c)

---

*Engineered with clean code practices and built for modern scalability.*
