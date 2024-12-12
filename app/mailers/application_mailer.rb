class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@planradar.com"
  layout "mailer"
end
