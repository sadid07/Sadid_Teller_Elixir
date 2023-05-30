defmodule Server do
  use Plug.Router

  plug Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Poison

  plug :match
  plug :dispatch

  alias Main

  # Login
  post "/enroll" do
    body = Plug.Conn.read_body(conn)
    case Poison.decode(body) do
      {:ok, %{"username" => username, "password" => password}} ->
        case Main.enroll_user(username, password) do
          {:ok, response} ->
            send_resp(conn, 200, Poison.encode!(response))
          {:error, error_message} ->
            send_resp(conn, 400, Poison.encode!(%{"error" => error_message}))
        end
      _ ->
        send_resp(conn, 400, Poison.encode!(%{"error" => "Username and password required."}))
    end
  end

  # GET All Accounts
  get "/accounts" do
    case Main.list_accounts() do
      {:ok, response} ->
        send_resp(conn, 200, Poison.encode!(response))
      {:error, error_message} ->
        send_resp(conn, 401, Poison.encode!(%{"error" => error_message}))
    end
  end

  # GET Details of a specific account
  get "/accounts/:account_id" do
    account_id = conn.params["account_id"]
    case Main.get_account_details(account_id) do
      {:ok, response} ->
        send_resp(conn, 200, Poison.encode!(response))
      {:error, error_message} ->
        send_resp(conn, 401, Poison.encode!(%{"error" => error_message}))
    end
  end

  # GET Transactions of a specific account
  get "/accounts/:account_id/transactions" do
    account_id = conn.params["account_id"]
    case Main.get_transactions(account_id) do
      {:ok, response} ->
        send_resp(conn, 200, Poison.encode!(response))
      {:error, error_message} ->
        send_resp(conn, 401, Poison.encode!(%{"error" => error_message}))
    end
  end

  # GET Account balances of a specific account
  get "/accounts/:account_id/balances" do
    account_id = conn.params["account_id"]
    case Main.get_account_balances(account_id) do
      {:ok, response} ->
        send_resp(conn, 200, Poison.encode!(response))
      {:error, error_message} ->
        send_resp(conn, 401, Poison.encode!(%{"error" => error_message}))
    end
  end
end
