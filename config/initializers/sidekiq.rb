Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://172.17.0.3:6379/0' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://172.17.0.3:6379/0' }
end
