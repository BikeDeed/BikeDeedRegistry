#domain = Rails.env.production? ? 'bikeindex.org' : 'localhost'
domain = Rails.env.production? ? 'bikeindex.org' : 'staging.bikedeed.io'

Bikeindex::Application.config.session_store :cookie_store, key: '_bikeindex_session', domain: domain
