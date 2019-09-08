params = System.argv    # Take command line arguments
count_args = length(params)

if count_args === 2 do
  [arg1 | tail] = params
  [arg2 | []] = tail

  {n1, ""} = Integer.parse(arg1)
  {n2, ""} = Integer.parse(arg2)

  # Checking the argument counts
  if n1 < 0 || n2 < 0 do
    IO.puts "Please provide positive numbers as arguments."
  else
    {:ok, staging} = Proj1.Staging.start_link([])

    {:ok, manager} = Proj1.Manager.start_link([])
    Proj1.Manager.spawn_children(manager, n1..n2, staging)

    :sys.get_state(manager, :infinity) # waiting for boss to DIE .
    # get the output and print it in the required format.
    :sys.get_state(staging)
      |> Enum.group_by(fn {a, b} -> a * b end)
      |> Enum.each( fn {prod, values} -> IO.puts(["#{prod} "| Enum.map(values, fn {a,b} -> "#{a} #{b} " end)]) end)
  end
else
  IO.puts "Please enter two arguments."
end
