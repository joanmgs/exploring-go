# Vue API (Go Backend)

This project is a simple RESTful API backend written in Go, designed to work with a Vue.js frontend. It demonstrates basic authentication handling, JSON request/response processing, and structured logging.

## Features

- Handles user login via a `/login` endpoint.
- Parses and validates JSON requests with size limits for security.
- Returns structured JSON responses for both success and error cases.
- Uses Go's standard `log` package for info and error logging.
- Clean separation of concerns with handlers, helpers, and routing.

## Project Structure

```
cmd/api/
  handlers.go   // HTTP handler functions (e.g., Login)
  helpers.go    // Utility functions for JSON and error handling
  main.go       // Application entry point and server setup
  routes.go     // Route definitions (not shown here)
go.mod          // Go module definition
go.sum          // Go module checksums
README.md       // This file
```

## How It Works

- The server listens on port `8081` by default.
- Incoming requests are routed to handler functions.
- The `Login` handler expects a JSON payload with `email` and `password` fields.
- JSON request bodies are limited to 1MB to prevent abuse.
- Responses are always in JSON format, with clear error messages on failure.

## Example Request

```
POST /login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "yourpassword"
}
```

## Example Response

Success:

```json
{
  "error": false,
  "message": "Signed in"
}
```

Error (invalid JSON):

```json
{
  "error": true,
  "message": "Invalid JSON supplied or JSON missing entirely"
}
```

## Running the Server

1. Make sure you have Go installed (version 1.18+ recommended).
2. Clone the repository and navigate to the project directory.
3. Run the server:

   ```sh
   go run cmd/api/main.go
   ```

4. The API will be available at `http://localhost:8081`.

## License

This project is for educational purposes.
