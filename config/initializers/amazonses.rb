ActionMailer::Base.add_delivery_method(
  :ses,
  AWS::SES::Base,
  access_key_id: Rails.application.credentials.aws[:AWS_SES_ACCESS_KEY_ID],
  secret_access_key: Rails.application.credentials.aws[:AWS_SES_SECRET_ACCESS_KEY],
  server: "email.us-east-1.amazonaws.com"
)
