{:ok, staging} = Proj1.Staging.start_link([])
IO.puts :sys.get_state(staging)
