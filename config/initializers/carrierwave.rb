
require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'


if Rails.env.production?
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      :provider              => 'AWS',
      :aws_access_key_id     => 'AKIAX7C2D3UF5SDU7G7M',
      :aws_secret_access_key => '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',
      :region                => 'ap-northeast-1',
    }
    config.fog_directory = 'mikagamit777'
    config.fog_public = true
  end
end
