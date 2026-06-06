# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # Replace the '*' with the specific origin(s) of your front-end application
    # For example: origins 'http://localhost:3000' or 'https://www.your-app.com'
    origins '*'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
