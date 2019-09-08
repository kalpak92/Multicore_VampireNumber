defmodule Proj1 do
  @moduledoc """
  Documentation for Proj1.
  """
  use Application
  def start(_type, _args) do
	  Proj1.Supervisor.start_link(name: Proj1.Supervisor)    # Supervisor will now start Proj1.Supervisor by calling Proj1.Supervisor.start_link
  end
end
