# Enable mailgun mail service
service = Rails.configuration.email['mailgun']

Rails.application.config.action_mailer.delivery_method = :smtp
Rails.application.config.action_mailer.smtp_settings = {
    authentication: service['authentication'],
    address: service['address'],
    port: service['port'],
    domain: service['domain'],
    user_name: service['user_name'],
    password: service['password'],
    enable_starttls_auto: service['service'],
}
