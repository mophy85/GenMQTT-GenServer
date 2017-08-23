defmodule QT.Main do
  use GenMQTT

  def start_link do
    GenMQTT.start_link(__MODULE__, {}, opt)
  end

  def pb(pid, data) do
    GenMQTT.publish(pid, "JP_JACK", data, 1)
  end

  def opt do
    [host: "broker.hivemq.com", port: 1883]
  end
end
