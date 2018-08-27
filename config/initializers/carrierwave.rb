CarrierWave.configure do |config|
  config.fog_credentials = {
  provider: 'AWS',
  aws_access_key_id: Rails.application.credentials.aws[:AWS_ACCESS_KEY_ID],
  aws_secret_access_key: Rails.application.credentials.aws[:AWS_SECRET_ACCESS_KEY],
  region: Rails.application.credentials.aws[:AWS_REGION],
  path_style: true
}
  config.fog_public = true
  config.fog_attributes = { 'Cache-Control' => 'public, max-age=86400' }

  config.remove_previously_stored_files_after_update = false

  config.fog_directory = Rails.application.credentials.aws[:AWS_S3_BUCKET]
  config.asset_host = Rails.application.credentials.aws[:AWS_S3_URL]
end
# 日本語の文字化けを防ぐ
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
