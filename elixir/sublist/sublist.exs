defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do

    sorted = [{a, :superlist}, {b, :sublist}]
    |> Enum.sort_by(fn {l,_} -> Enum.count(l) end )

    [{smaller, _}, {larger, result}] = sorted

  	cond do
  	  a === b                     -> :equal
      larger |> contains(smaller) -> result
  	  true                        -> :unequal
  	end
  end

  defp contains(_, []), do: true
  defp contains([], _), do: false
  defp contains(a, b) do

    if hd(a) === hd(b) do
      match(a, b)
    else
      contains(a, tl(b))
    end

    # needle 
    # |> zip(haystack)
    # |> Enum.all?(fn {a,b} -> a === b end)

    # or contains(tl(haystack), needle)
  end

  defp match(a,b) do
    check_list = Enum.slice(b, 0, length(a))
    if check_list === a do
      true
    else
      contains(a, tl(b))
    end
  end

  # @uniq_default :"314ddabb730b43bc848c168dfa74154d"
  # defp zip(l1, l2) do
  #   l1
  #   |> Stream.with_index
  #   |> Enum.map(fn {x,i} -> {x, Enum.at(l2, i, @uniq_default)} end)
  # end

end
