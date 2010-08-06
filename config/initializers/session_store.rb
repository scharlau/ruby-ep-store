# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ruby-ep-store_session',
  :secret      => 'c94e2cebf464143eb9132e479750dedaee4deb66ef31df6f0f44ed8b38e4f77e7c7fb1aafe6c286e0ea47b17b6c6f2aa3f1279107443e6aaf69d70c6a432217a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
