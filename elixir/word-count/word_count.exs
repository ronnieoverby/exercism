defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
  	 sentence
  	 |> String.downcase
  	 |> String.split(~r/[^[:alnum:]-]/u, trim: true)
  	 |> _count
  end

  defp _count(words) do
  	Enum.reduce words, %{}, fn(word, map) -> update_counts(word, map) end
  end

  defp update_counts(word, map), do:
  	Map.update(map, word, 1, &(&1 + 1))

end
