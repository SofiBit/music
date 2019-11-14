# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'music-connects@music.com'
  layout 'mailer'
end
