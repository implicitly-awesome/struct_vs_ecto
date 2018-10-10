defmodule Struct do
  defstruct [:a, :b, :c]

  def new(params) do
    with params when is_map(params) <- atomify_keys(params),
         params when is_map(params) <- validate(params) do
      struct(__MODULE__, params)
    end
  end

  defp validate(params) do
    with params when is_map(params) <- validate_presence(params),
         params when is_map(params) <- validate_types(params) do
      params
    end
  end

  defp reduce_keys(map, fun) when is_map(map) and is_function(fun) do
    Enum.reduce(map, %{}, fn {k, v}, new_map ->
      key = fun.(k)

      if is_map(v) do
        Map.put(new_map, key, reduce_keys(v, fun))
      else
        Map.put(new_map, key, v)
      end
    end)
  end

  defp reduce_keys(map, _), do: map

  defp atomify_keys(map) when is_map(map) do
    reduce_keys(map, fn k ->
      if is_binary(k), do: String.to_existing_atom(k), else: k
    end)
  end

  defp atomify_keys(map), do: map

  defp validate_presence(%{a: _, b: _, c: _} = params), do: params
  defp validate_presence(%{b: _, c: _}), do: {:error, :a_not_given}
  defp validate_presence(%{a: _, c: _}), do: {:error, :b_not_given}
  defp validate_presence(%{a: _, b: _}), do: {:error, :c_not_given}
  defp validate_presence(%{}), do: {:error, :params_not_given}

  defp validate_types(%{a: a, b: b, c: c} = params)
       when is_integer(a) and is_integer(b) and is_integer(c),
       do: params

  defp validate_types(%{a: a}) when not is_integer(a), do: {:error, :a_not_integer}
  defp validate_types(%{b: b}) when not is_integer(b), do: {:error, :b_not_integer}
  defp validate_types(%{c: c}) when not is_integer(c), do: {:error, :c_not_integer}
end
