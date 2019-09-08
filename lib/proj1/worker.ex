defmodule Proj1.Worker do
	use GenServer

	def start_link(_state) do
	  GenServer.start_link(__MODULE__, [])
	end

	def run(pid, range, staging) do
	  GenServer.cast(pid, {:run, range, staging})
	end

	@impl true
	def init(state) do
	  {:ok, state}
	end

	@impl true
	def handle_cast({:run, range, staging}, state) do
	  # Each worker call compute function for determining the vampire numbers it is working with
	  Compute.com(Enum.to_list(range),staging)
	  {:noreply, state}
	end
end
