# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "donotreply@linksaver.app"
  layout "mailer"
end
