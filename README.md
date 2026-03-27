# AstraStay — Hotel Booking Backend API

A full-featured hotel booking backend built with **Spring Boot 3**, **PostgreSQL**, **JWT Auth**, and **Stripe Payments**.

Built by **Shreya Upadhyay**

## 🛠 Tech Stack
- **Backend**: Spring Boot 3.4, Java 23
- **Database**: PostgreSQL (Neon)
- **Authentication**: JWT (JSON Web Tokens)
- **Payments**: Stripe API
- **Documentation**: Swagger/OpenAPI (SpringDoc)
- **Deployment**: Render (Docker)

## 🔗 Live API Docs
👉 [Swagger UI](https://astrastay.onrender.com/api/v1/swagger-ui/index.html)

## ✨ Features

### User Authentication
- `POST /auth/signup` — User signup
- `POST /auth/login` — User login
- `POST /auth/refresh` — Refresh access token

### Hotel Management (Admin)
- `POST /admin/hotels` — Create a hotel
- `GET /admin/hotels` — Get all admin hotels
- `PUT /admin/hotels/{hotelId}` — Update hotel details
- `DELETE /admin/hotels/{hotelId}` — Delete a hotel
- `PATCH /admin/hotels/{hotelId}/activate` — Activate a hotel

### Room Management (Admin)
- `POST /admin/hotels/{hotelId}/rooms` — Create a room
- `GET /admin/hotels/{hotelId}/rooms` — Get all rooms
- `PUT /admin/hotels/{hotelId}/rooms/{roomId}` — Update a room
- `DELETE /admin/hotels/{hotelId}/rooms/{roomId}` — Delete a room

### Inventory Management (Admin)
- `GET /admin/inventory/rooms/{roomId}` — Get room inventory
- `PATCH /admin/inventory/rooms/{roomId}` — Update inventory

### Hotel Browsing
- `GET /hotels/search` — Search for hotels
- `GET /hotels/{hotelId}/info` — Get hotel details

### Booking Flow
- `POST /bookings/init` — Create a booking
- `POST /bookings/{bookingId}/addGuests` — Add guests
- `POST /bookings/{bookingId}/payments` — Initiate payment
- `POST /bookings/{bookingId}/cancel` — Cancel booking
- `GET /bookings/{bookingId}/status` — Check status

### User Profile & Guests
- `GET /users/profile` — View profile
- `PATCH /users/profile` — Update profile
- `GET /users/myBookings` — View bookings
- `POST /users/guests` — Add a guest
- `PUT /users/guests/{guestId}` — Update guest
- `DELETE /users/guests/{guestId}` — Remove guest

### Webhook
- `POST /webhook/payment` — Stripe payment webhook

## 🚀 Run Locally

```bash
# Set environment variables
export DB_URL=jdbc:postgresql://localhost:5432/astrastay
export DB_USERNAME=postgres
export DB_PASSWORD=your_password
export JWT_SECRET=your_jwt_secret_key
export STRIPE_SECRET_KEY=sk_test_xxx
export STRIPE_WEBHOOK_SECRET=whsec_xxx
export FRONTEND_URL=http://localhost:3000

# Run
./mvnw spring-boot:run
```

## 📄 License
This project is for educational and portfolio purposes.
