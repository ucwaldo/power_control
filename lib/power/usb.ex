defmodule PowerControl.USB do
  @moduledoc false
  require Logger

  @usb_device_path '/sys/bus/usb/devices/usb'

  @doc false
  def init do
    if Application.get_env(:power_control, :disable_usb) do
      disable_usb()
    end

    :ok
  end

  @doc false
  def disable_usb do
    :os.cmd('echo "1-1" >> ' ++ @usb_device_path ++ '/unbind')
  end
end
