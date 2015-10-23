class SignupMailer < ApplicationMailer
  default from: ENV['MAIL_FROM']
end
