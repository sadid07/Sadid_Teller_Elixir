# Sadid Bin Hasan Teller.io API Integration

This project demonstrates the integration of the Teller.io API using Elixir. It includes modules for making API requests, handling HTTP server routes, and starting the server. The code is organized as follows:

All files inside Lib Folder:

## Main Module (main.ex)
The `Main` module contains methods for interacting with the Teller.io API. It provides functions for enrolling users, fetching accounts, retrieving account details, retrieving account balances, fetching transactions, and managing user tokens.

## Server Module (server.ex)
The `Server` module handles the HTTP server and defines the routes for the API endpoints. It uses the Plug framework for request parsing and dispatching. The module includes routes for user enrollment, fetching accounts, retrieving account details, fetching transactions, and retrieving account balances.

## Index Module (index.ex)
The `Index` module is responsible for starting the HTTP server. It specifies the port on which the server should listen and initializes the server using the Cowboy adapter.

## Dependencies
The project relies on the following dependencies:
- Axios: Used for making HTTP requests to the Teller.io API.
- Poison: Used for encoding and decoding JSON data.

## Getting Started
To use this project, follow these steps:
1. Install the required dependencies (Axios and Poison).
2. Customize the code to meet your specific requirements, such as adjusting the base URL and token.
3. Run the `Index.start` function to start the server on the desired port.

Make sure to handle the `TOKEN_FILE` constant and adjust it according to your needs.

## Further Exploration
To learn more about the available features and options for building HTTP servers and handling JSON data in Elixir, refer to the Elixir documentation and explore additional libraries and frameworks.

