defmodule Proj1 do
  @moduledoc """
  Documentation for Proj1.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Proj1.hello()
      :world

  """
  use Application
  def start(_type, _args) do
	Proj1.Supervisor.start_link(name: Proj1.Supervisor)
  end
end
