Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['app_id'], ENV['app_secret'], scope: 'email', info_fields: 'email, name'
  on_failure { |env| AuthenticationsController.action(:failure).call(env) }
end
# config.omniauth :facebook, ENV['app_id'], ENV['app_secret'], scope: 'email', info_fields: 'email, name'
