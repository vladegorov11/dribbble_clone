require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.test? || Rails.env.development?
    config.storage = :file
    config.enable_processing = false
  end

  if Rails.env.production?
    config.storage = :fog
    config.fog_credentials = {
      provider: 'aws',
      aws_access_key_id: ENV['S3_KEY'],
      aws_secret_access_key: ENV['S3_SECRET'],
      region: 'us-east-1'
    }
    config.cache_dir = "#{Rails.root}/tmp/uploads"   
    config.s3_access_policy = :public_read
    config.fog_directory = ENV['S3_BUCKET_NAME']
  end
end


