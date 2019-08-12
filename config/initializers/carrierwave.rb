

#require 'carrierwave/storage/abstract'
#require 'carrierwave/storage/file'
#require 'carrierwave/storage/fog'


if Rails.env.production?
  CarrierWave.configure do |config|
    config.strage= :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AKIAX7C2D3UF5SDU7G7M'],
      aws_secret_access_key: ENV['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'],
      region: ENV['ap-northeast-1'],
    }
    config.fog_directory= ENV['mikagamit777']
    config.fog_public= false
    config.fog_attributes= {cache_control: "public, max-age=#{365.days.to_i}" }
  end
else
  CarrierWave.configure do |config|
    config.storage = :file
  end
end
