

CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAX7C2D3UF5SDU7G7M',
    aws_secret_access_key: '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',
    region: 'ap-northeast-1',
    #path_style: true
  }
  config.fog_public = true
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}
  config.cache_storage = :fog
  config.fog_directory = 'mikagamit777'
  config.asset_host = 'mikagamit777'

end
# 日本語の文字化けを防ぐ
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
