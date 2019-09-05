defmodule Compute do
	def com(list,staging) do
	  results = for x <- list, do: Vampire.vampire_factors(x)
	  accepted_results = List.flatten(Enum.reject(results, fn x -> is_valid(x) end))
	  Enum.each(accepted_results, fn result -> Proj1.Staging.push(staging, result) end)

	end
	defp is_valid(n) do
	   Enum.empty?(n)
	end
end

defmodule Vampire do
  def factor_pairs(n) do
    first = trunc(n / :math.pow(10, div(char_len(n), 2)))
    last  = :math.sqrt(n) |> round
    for i <- first .. last, rem(n, i) == 0, do: {i, div(n, i)}
  end

  def vampire_factors(n) do
    if rem(char_len(n), 2) == 1 do
      []
    else
      half = div(length(to_charlist(n)), 2)
      sorted = Enum.sort(String.codepoints("#{n}"))
      Enum.filter(factor_pairs(n), fn {a, b} ->
        char_len(a) == half && char_len(b) == half &&
        Enum.count([a, b], fn x -> rem(x, 10) == 0 end) != 2 &&
        Enum.sort(String.codepoints("#{a}#{b}")) == sorted
      end)
    end
  end

  defp  char_len(n), do: length(to_charlist(n))

end



