defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t  
  def numerals(number) do
   number
   |> to_string
   |> String.graphemes
   |> Enum.reverse
   |> Enum.with_index
   |> Enum.map(fn {n,i} -> numeral_at_index(i, String.to_integer(n) ) end)
   |> Enum.reverse
   |> Enum.join
  end

  defp numeral_at_index(_, 0), do: ""
  defp numeral_at_index(0, n), do: construct_numeral("IVX", n)
  defp numeral_at_index(1, n), do: construct_numeral("XLC", n)
  defp numeral_at_index(2, n), do: construct_numeral("CDM", n)
  defp numeral_at_index(3, n), do: rep("M", n)

  defp construct_numeral(s, n) do
    cond do
      n < 4   -> format(s, [{0,n}])
      n === 4 -> String.slice(s, 0, 2)
      n < 9   -> format(s, [{1,1}, {0, abs(5 - n)}])
      n === 9 -> format(s, [{0,1}, {2,1}])
    end
  end

  defp format(chars, fmt) do
    fmt
    |> Enum.map(fn {i,n} -> chars |> String.at(i) |> rep(n) end)
    |> Enum.join
  end

  defp rep(s, n) do
    Stream.repeatedly(fn -> s end)
    |> Stream.take(abs(n))
    |> Enum.join
  end
end
