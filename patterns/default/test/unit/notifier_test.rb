require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  
  should "send welcome email" do
    user = User.generate!
    Notifier.deliver_welcome_email(user)
    assert_sent_email do |email|
      email.subject = "Welcome to #{current_app_name}!"
      email.from.include?('#{notifier_email_from}')
      email.to.include?(user.email)
      email.body =~ Regexp.new(user.login)
    end
  end

  should "send password reset instructions" do
    user = User.generate!
    Notifier.deliver_password_reset_instructions(user)
    assert_sent_email do |email|
      email.subject = "Password Reset Instructions"
      email.from.include?('#{notifier_email_from}')
      email.to.include?(user.email)
      email.body =~ Regexp.new(user.perishable_token)
    end
  end

#{extra_notifier_test}  
end
