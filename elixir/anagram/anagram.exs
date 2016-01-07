defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """

  import String

  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
  	
  	up_base = upcase(base)  	

  	for candidate <- candidates,
  		up_cand = upcase(candidate),		
  		up_base !== up_cand,
  		sort(up_base) === sort(up_cand),
  		do: candidate
  end

  defp sort(s), do: s |> graphemes |> Enum.sort
  
end