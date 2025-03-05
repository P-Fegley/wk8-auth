# to encrypt a secret, use BCrypt::Password.create(secret)
# to test a secret, use BCrypt::Password.new(encrypted) == secret
# run this file using rails runner scripts/encryption.rb

# TODO:
# 1. encrypt a secret and puts encrypted string
password = "puppies"
encrypted_password = BCrypt::Password.create(password)
# puts encrypted_password

# 2. prepare encrypted string for testing


# 3. test secret against prepared encrypted string
BCrypt::Password.new(encrypted_password) == password