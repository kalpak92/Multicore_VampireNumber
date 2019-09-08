defmodule Proj1.Supervisor do
  use Supervisor

  def start_link(opts) do
     Supervisor.start_link(__MODULE__, :ok, opts)
  end


  def init(:ok) do
    children = [
      {Proj1.Staging, name: Proj1.Staging}
    ]

    Supervisor.init(children, strategy: :one_for_all)     # passed the children and the supervision strategy
  end
end
