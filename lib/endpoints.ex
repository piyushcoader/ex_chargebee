defmodule ChargeBee.Endpoint do
  @options %{ protocol: "https", host_suffix: ".chargebee.com", api_path: "api/v2", timeout: 40_000, version: 'v2.4.7', port: 443}

  def request(params \\ [] , url_suffix ,  method \\ :post) do

    url = "https://#{site()}.chargebee.com/#{@options.api_path}#{url_suffix}"
    token = :base64.encode("#{api_key()}:")
    body =  process_request_body(params)

    headers = [
      {"Authorization" ,  "Basic #{token}"},
      {"Accept",  "application/json"},
      {"Content-Type" , "application/x-www-form-urlencoded; charset=utf-8"}
    ]

    result =
      case HTTPoison.request(method, url, body , headers, []) do
        {:ok, %HTTPoison.Response{body: body, status_code: status_code}} ->
          {:ok, parsed_data} =  Jason.decode(body)
          Map.put(parsed_data, "http_status_code", status_code)

        {:error, reason} ->
          reason
      end

    if result["http_status_code"] != 200, do: {:error, result}, else: {:ok, result}
  end

  defp process_request_body(params) do
    body =
      params
      |> ChargeBee.Utils.to_string_map()
      |> Map.to_list()

    {:form, body}
  end

  defp api_key, do: Application.fetch_env!(:ex_chargebee, :api_key)

  defp site, do: Application.fetch_env!(:ex_chargebee, :site)

end
