# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Movies::Application.config.secret_key_base = '31ea5100dde7ae89d776aec7f48ee03870086ec6d2772476962c555ad67e3208a5b455591dff9249c52c80fac0dd73c51d96e40753528392a9b270c8beef17c7'
