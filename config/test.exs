use Mix.Config

config :logger, backends: []

config :eventstore, EventStore.Storage,
  serializer: EventStore.TermSerializer,
  username: "postgres",
  password: "postgres",
  database: "eventstore_test",
  hostname: "db",
  pool_size: 10,
  pool_overflow: 5