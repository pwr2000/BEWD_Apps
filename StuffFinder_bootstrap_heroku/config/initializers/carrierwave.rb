CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',               
    :aws_access_key_id      => 'fill in with yours',
    :aws_secret_access_key  => 'fill in with yours'
  }
  if Rails.env.development?
    config.fog_directory = 'stuff_finder-dev'
  else
    config.fog_directory = 'stuff_finder'
  end
end
