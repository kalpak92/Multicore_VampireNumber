# Tasking Command line arguments and converting them as integers
[n1, n2] = System.argv |> Enum.map(&String.to_integer/1)

{:ok, staging} = Proj1.Staging.start_link([])

{:ok, manager} = Proj1.Manager.start_link([])
Proj1.Manager.spawn_children(manager, n1..n2, staging)

:sys.get_state(manager, :infinity) # waiting for boss to DIE .

#Check stage's state to retrieve the final result
#Enum.each(:sys.get_state(staging), fn n -> 
#case n do
#[{x,y}] ->IO.puts "#{x*y} #{x} #{y}"
#end
#end)

:sys.get_state(staging) |> Enum.group_by(fn {a, b} -> a * b end) |> Enum.each( fn {prod, values} -> IO.puts(["#{prod} "| Enum.map(values, fn {a,b} -> "#{a} #{b} " end)]) end)

