# frozen_string_literal: true

# Generate the file.

class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
