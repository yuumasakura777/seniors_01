
require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'


if Rails.env.production?
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['S3_ACCESS_KEY_ID'],
      :aws_secret_access_key =>'R/v4Yz4jg0UBfk9+CykLlJRoGEIoD9Yql7b31yBF',
      :region                => ENV['S3_REGION'],
    }
    config.fog_directory = ENV['S3_BUCKET_NAME']
    config.fog_public = true
  end
end
