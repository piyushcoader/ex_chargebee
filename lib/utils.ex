defmodule ChargeBee.Utils do
  def string_map_to_atom(string_key_map) do
    for {key, val} <- string_key_map, into: %{} do
      cond do
        is_atom(key) ->
          value = if is_map(val), do: string_map_to_atom(val), else: val
          {key, value}

        true ->
          value = if is_map(val), do: string_map_to_atom(val), else: val
          {String.to_atom(key), value}
      end
    end
  end
end
