Clearance.configure do |config|
  config.mailer_sender = "link-savr@passwordreset.com"
  config.rotate_csrf_on_sign_in = true
  config.redirect_url = "/links"
end
