defmodule Proj1.Manager do
	use GenServer

	def start_link(_state) do
	  GenServer.start_link(__MODULE__, [])
	end

	def spawn_children(pid, range, staging) do
	  GenServer.cast(pid, {:spawn_children, range, staging})
	end

	@impl true
	def init(state) do
	  {:ok, state}
	end

	@impl true
	def handle_cast({:spawn_children, range, staging},state) do
	  # Manager spawn workers, each having equal number of inputs
	  workers = 50

		subproblem_size = (Enum.count(range) / workers) |> Float.ceil() |> :erlang.trunc()

	  subproblems = Enum.chunk_every(range, subproblem_size)

		workers = Enum.map(subproblems, fn subproblem -> {:ok, pid} = Proj1.Worker.start_link([])
																				Proj1.Worker.run(pid, subproblem, staging)
	  																		pid
	  																end)

	  Enum.map(workers, fn worker -> :sys.get_state(worker, :infinity) end)

	  {:noreply, state}
	end
end
