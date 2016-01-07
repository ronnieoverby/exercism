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
  		base_list = sort(up_base),
  		cand_list = sort(up_cand),
  		base_list === cand_list,
  		do: candidate
  end

  defp sort(s), do: s |> graphemes |> Enum.sort
  
end