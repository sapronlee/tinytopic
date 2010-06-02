# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tinytopic_session',
  :secret      => 'c9d83b9350450aa894466129684b314e33b5eafddeae0b3abe00ff7542e7475d61f7de3220ec19027e3899b036111fa2ca7d7178f69df38ad24a70d012f7ee4f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
