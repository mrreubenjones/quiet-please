CarrierWave.configure do |config|
  config.fog_directory = 'fog/aws'
  config.fog_credentials = {
    provider:               'AWS',
    aws_access_key_id:      ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key:  ENV['AWS_SECRET_ACCESS_KEY'],
    region:                 'eu-west-2',
    endpoint:               'https://quietly-production.s3-us-west-2.amazonaws.com'
  }
  config.fog_directory  = ENV['AWS_BUCKET']
  config.fog_public     = false
end