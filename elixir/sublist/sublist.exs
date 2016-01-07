defmodule Sublist do

  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b -> :equal
      a |> contains(b) -> :superlist
      b |> contains(a) -> :sublist
      true -> :unequal        
    end
  end

  defp contains([], _), do: false
  defp contains(_, []), do: true
  defp contains([hh|ht], [nh|nt] = needle) do

    if hh === nh and matches(ht, nt) do
      true
    else
      contains(ht, needle)
    end

  end
  
  defp matches([], _), do: false
  defp matches([hh|_], [nh|[]]), do: hh === nh
  defp matches([hh|ht], [nh|nt]) do
    if hh === nh do
      matches(ht, nt)
    else
      false
    end
  end

end