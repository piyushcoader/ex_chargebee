defmodule ChargeBee.Endpoint do
  @options %{ protocol: "https", host_suffix: ".chargebee.com", api_path: "/api/v2", timeout: 40_000, version: 'v2.4.7', port: 443}

  @api_key "test_oLK902oNcdXErG2PjFW66TQVIY6VMPcu34"
  @site "elixir-test"


  def request( method \\ :post , url_suffix , params \\ []) do

    url = "#{@options.protocol}://#{@site}#{@options.host_suffix}#{@options.api_path}#{url_suffix}"
    token = :base64.encode("#{@api_key}:")
    headers = [
      {"Authorization" ,  "Basic #{token}"},
      {"Accept",  "application/json"},
      {"Content-Type" , "application/x-www-form-urlencoded; charset=utf-8"}
    ]

    case HTTPoison.request(method, url, params , headers, []) do
      {:ok, response} ->
        IO.inspect response

      {:error, reason} ->
        IO.inspect reason
    end
  end

end
