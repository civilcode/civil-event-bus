defmodule CivilEventBus.Behaviour do
  @moduledoc """
  Defines the behaviour for CivilEventBus implementations.
  """

  @type channel :: atom
  @type subscriber :: pid
  @type event :: term

  @callback start_link(Keyword.t()) :: {:ok, pid()} | {:error, term}
  @callback subscribe(channel) :: :ok
  @callback publish(channel, event) :: :ok
end
