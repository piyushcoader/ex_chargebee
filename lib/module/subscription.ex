defmodule ChargeBee.Module.Subscription do
alias ChargeBee.Endpoint

  def fetch_all() do
    url_suffix = "/subscriptions"
    Endpoint.request(:get, url_suffix, [])
  end

  def create(params) when is_map(params) do
    url_suffix = "/subscriptions"
    params = ChargeBee.Utils.string_map_to_atom(params)
    
    Endpoint.request(:post, url_suffix, params)
  end

  def create(_), do: {:error, %{reason: "Invalid Parameter"}}


end
