Recaptcha.configure do |config|
  config.public_key  = ENV['captcha_site_key']
  config.private_key = ENV['captcha_secret_key']
end
