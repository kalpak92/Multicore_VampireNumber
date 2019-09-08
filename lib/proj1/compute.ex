defmodule Compute do
  @moduledoc """
  This modules takes a calls for a check if a number is Vampire.
  If so, it fetches the fangs of the same.
  """
	def com(list,staging) do
	  results = for x <- list, do: Vampire.vampire_factors(x)
	  accepted_results = List.flatten(Enum.reject(results, fn x -> is_valid(x) end))
	  Enum.each(accepted_results, fn result -> Proj1.Staging.push(staging, result) end)

	end
	defp is_valid(n) do
	   Enum.empty?(n)
	end
end
