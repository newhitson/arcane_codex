Elasticsearch::Model.client = Elasticsearch::Client.new(
  host: 'http://localhost:9200',
  transport_options: {
    headers: { 'Content-Type' => 'application/json' }
  },
  # Suppresses the product verification warning for local dev
  request_timeout: 5
)