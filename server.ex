defmodule QT.Server do
  use GenServer

  def start_link(qt_pid) do
    {:ok, pid} = GenServer.start_link(__MODULE__, qt_pid, name: __MODULE__)
  end

  def pb(data) do
    GenServer.cast(__MODULE__, {:pub, data})
  end

  def init(qt_pid) do
    {:ok, {qt_pid}}
  end

  def handle_cast({:pub, data}, {qt_pid}) do
    QT.Main.pb(qt_pid, data)
    {:noreply, {qt_pid}}

  end
end
