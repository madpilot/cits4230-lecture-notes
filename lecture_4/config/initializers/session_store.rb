# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_lecture_4_session',
  :secret      => '888d1e9bfa349747ad44fffef519fd2365a796198b964de60b7283633e9bad7872e35666afdb73f77c01ee44a84bc6cd239df84bfe3e2fc492162de3691a62e7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
