# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_lecture_3_session',
  :secret      => '6e49fda030de2725766924d284f56bce8a7ad8081f5b3bb34cb158ac49572a0a49394164f60c2dc77245fe51d7b19c9321a6abf1177a43b14fb055ebb3724401'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
