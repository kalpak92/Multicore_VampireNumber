defmodule Compute do
	def com(list, staging) do
	  results = for x <- list, do: Vampire.vampire_factors(x)
	  accepted_results = Enum.reject(results, fn x -> is_valid(x) end)
	  Enum.each(accepted_results, fn result -> Proj1.Staging.push(staging, result) end)

	end
	defp is_valid(n) do
	   Enum.empty?(n)
	end
end


