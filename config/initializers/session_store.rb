# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_yamaha_session',
  :secret      => '029a3bf9e02eaa484cb3d7dd84752884f9e8f3843aa1c032d0ab0cece0aa8f3e2503cb5045930d25b29fd676cdb7e8bfd8a054edde3fb605302ba9c7a71fe388'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
