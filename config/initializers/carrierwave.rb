# config/initializers/carrierwave.rb
# This file is not created by default so you might have to create it yourself.

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
    config.fog_directory = ENV['S3_BUCKET_NAME']
  end
end

# AWSAccessKeyId=AKIAINVRJMAYW7XJ4SQA
# AWSSecretKey=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

#heroku config:add  S3_BUCKET_NAME=dribbbleclone

#ENV['S3_KEY']
#ENV['S3_SECRET']ENV['S3_BUCKET_NAME']
