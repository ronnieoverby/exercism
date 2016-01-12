defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
  	  string
  	  |> String.replace(~r/\D/, "")
  	  |> String.graphemes
  	  |> Enum.map(&String.to_integer/1)
  	  |> Enum.reverse
  	  |> Enum.with_index
  	  |> Enum.map(fn {n,i} -> :math.pow(2,i) * n end)
  	  |> Enum.sum
  end
end
