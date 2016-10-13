Rails.application.config.action_mailer.delivery_method = :smtp
Rails.application.config.action_mailer.smtp_settings = {
    authentication: :plain,
    address: "smtp.mailgun.org",
    port: 587,
    domain: "mg.golovkin.cc",
    user_name: ENV["mailgun_user_name"],
    password: ENV["mailgun_password"]
}

