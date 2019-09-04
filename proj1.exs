# Tasking Command line arguments and converting them as integers
[n1, n2] = System.argv |> Enum.map(&String.to_integer/1)

{:ok, staging} = Proj1.Staging.start_link([])

{:ok, manager} = Proj1.Manager.start_link([])
Proj1.Manager.spawn_children(manager, n1..n2, staging)

:sys.get_state(manager, :infinity) # waiting for boss to DIE .

#Check stage's state to retrieve the final result
# IO.inspect :sys.get_state(staging)
for n <- :sys.get_state(staging), do: IO.inspect n
