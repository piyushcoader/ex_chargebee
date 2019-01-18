defmodule ChargeBee.Module.Subscription do
  alias ChargeBee.Endpoint
  alias ChargeBee.Utils
  @url_suffix "/subscriptions"
  
  def fetch_all(), do: Endpoint.request([], @url_suffix, :get)

  def create(params) when is_map(params) do
    ChargeBee.Utils.string_map_to_atom(params)
    |> Endpoint.request(@url_suffix, :post)

  end

  def create(_), do: {:error, %{reason: "Invalid Parameter"}}


end
