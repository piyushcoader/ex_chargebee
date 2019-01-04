defmodule ChargeBee.Module.Subscription do
alias ChargeBee.Endpoint

  def fetch_all() do
    url_suffix = "/subscriptions"
    Endpoint.request(:get, url_suffix, [])
  end
end
