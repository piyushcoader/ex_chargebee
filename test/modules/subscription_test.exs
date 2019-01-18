defmodule ChargeBee.SubscriptionTest do
  use ExUnit.Case
  doctest ChargeBee

  alias ChargeBee.Module.Subscription
  describe "subscription" do
    test "fetches subscription data if api_key is correct" do
      assert {:ok, subscription}  = Subscription.fetch_all()
      assert  is_map(subscription)
      assert subscription["http_status_code"] == 200
    end
  end
end
