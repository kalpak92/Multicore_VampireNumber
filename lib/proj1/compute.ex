defmodule Compute do
	def com(list, staging) do
	  results = Enum.filter(list, fn starting_point -> is_vampire?(starting_point) end)
	  Enum.each(results, fn result -> Proj1.Staging.push(staging, result) end)

	end
	defp is_vampire?(n) do
	   rem(n,2) == 0
	end
end


