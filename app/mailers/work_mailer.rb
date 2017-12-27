# frozen_string_literal: true

class WorkMailer < ApplicationMailer
  default from: 'zawgorodskiy.2012@gmail.com'

  def invite_email(user, password)
    @user = user
    @password = password
    mail(to: @user.email, subject: 'Invite Email')
  end
end
