defmodule Proj1.Staging do
	use GenServer

	def start_link(_state) do
		GenServer.start_link(__MODULE__, [], name: Proj1.Staging)
	end

	def push(pid, result) do
	 GenServer.cast(pid, {:push, result})
	end

	@impl true
	def init(state) do
	 {:ok, state}
	end

	@impl true
	def handle_cast({:push, result}, state) do
	# Stores individual worker's result as tuples
	 {:noreply, [result | state]}
	end
end
