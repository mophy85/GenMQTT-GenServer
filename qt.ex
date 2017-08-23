defmodule Qt do
  def start(_type,_nothing) do
  {:ok, qt_pid} = QT.Main.start_link
  QT.Server.start_link(qt_pid)
  end
end
