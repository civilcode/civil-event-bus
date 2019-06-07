if Code.ensure_loaded?(EventStore) do
  defmodule CivilBus.EventStore do
    @moduledoc """
    EventStore implementation for the CivilBus.
    """

    @behaviour CivilBus.Behaviour

    @impl true
    def start_link(_opts \\ []) do
      {:ok, :event_store}
    end

    @impl true
    def subscribe(module, channel) do
      EventStore.subscribe_to_stream(to_string(channel), to_string(module), self())
    end

    @impl true
    def publish(channel, event) do
      events = [
        %EventStore.EventData{
          event_type: to_string(event.__struct__),
          data: event
        }
      ]

      :ok = EventStore.append_to_stream(to_string(channel), :any_version, events)
    end

    @impl true
    def ack(subscription, event) do
      EventStore.ack(subscription, event)
    end
  end
end
