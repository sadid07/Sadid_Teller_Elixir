defmodule Main do
  @base_url "https://api.teller.io"
  @token "test_token_7t6hygz4vh3s4"

  def get_options do
    auth_header = "Basic " <> Base.encode64("#{@token}:")
    headers = [{"Authorization", auth_header}]
    %{headers: headers}
  end

  def enroll_user(username, password) do
    url = "#{@base_url}"
    case Axios.get(url, get_options()) do
      {:ok, response} ->
        {:ok, response.data}
      {:error, %{response: %{status: 401}}} ->
        {:error, "Failed to enroll user. Invalid credentials."}
      _ ->
        {:error, "Failed to enroll user. Please try again later."}
    end
  end

  def list_accounts do
    url = "#{@base_url}/accounts"
    case Axios.get(url, get_options()) do
      {:ok, response} ->
        {:ok, response.data}
      {:error, %{response: %{status: 401}}} ->
        {:error, "Unauthorized. Please re-authenticate."}
      _ ->
        {:error, "Failed to fetch accounts. Please try again later."}
    end
  end

  def get_account_details(account_id) do
    url = "#{@base_url}/accounts/#{account_id}"
    case Axios.get(url, get_options()) do
      {:ok, response} ->
        {:ok, response.data}
      {:error, %{response: %{status: 401}}} ->
        {:error, "Unauthorized. Please re-authenticate."}
      _ ->
        {:error, "Failed to fetch account details. Please try again later."}
    end
  end

  def get_account_balances(account_id) do
    url = "#{@base_url}/accounts/#{account_id}/balances"
    case Axios.get(url, get_options()) do
      {:ok, response} ->
        {:ok, response.data}
      {:error, %{response: %{status: 401}}} ->
        {:error, "Unauthorized. Please re-authenticate."}
      _ ->
        {:error, "Failed to fetch account balances. Please try again later."}
    end
  end

  def get_transactions(account_id) do
    url = "#{@base_url}/accounts/#{account_id}/transactions"
    case Axios.get(url, get_options()) do
      {:ok, response} ->
        {:ok, response.data}
      {:error, %{response: %{status: 401}}} ->
        {:error, "Unauthorized. Please re-authenticate."}
      _ ->
        {:error, "Failed to fetch transactions. Please try again later."}
    end
  end

  def get_user_token do
    case File.read(TOKEN_FILE) do
      {:ok, token} ->
        String.trim(token)
      _ ->
        {:error, "User token not found. Please enroll first."}
    end
  end

  def save_user_token(token) do
    case File.write(TOKEN_FILE, token) do
      :ok ->
        :ok
      _ ->
        {:error, "Failed to save user token."}
    end
  end
end
