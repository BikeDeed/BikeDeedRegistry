#domain = Rails.env.production? ? 'bikedeed.io' : 'localhost'
domain = Rails.env.production? ? 'bikedeed.io' : 'staging.bikedeed.io'

Bikeindex::Application.config.session_store :cookie_store, key: '_bikeindex_session', domain: domain
