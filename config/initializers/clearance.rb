Clearance.configure do |config|
  config.mailer_sender = "donotreply@linksaver.app"
  config.rotate_csrf_on_sign_in = true
  config.redirect_url = "/links"
end
