defmodule ChargeBee.Custumer do
  alias ChargeBee.Endpoint
  alias ChargeBee.Utils

  @url_suffix "/customers"

  def retrieve(customer_id) when is_binary(customer_id), do: Endpoint.request([], "#{@url_suffix}/#{customer_id}", :get)
  def retrieve(_), do: {:error, %{reason: "invalid plan_id"}}
end
