class UserMailer < ActionMailer::Base
  #default from: "rahul@mailinator.com"
  
  def validate_sender(sender_email)
    @sender_email = 'rahul@mailinator.com'
    @sender_email = sender_email if sender_email.present?
  end
  
  def provide_email_subject_link(sender_email, user, subject, link)
    validate_sender(sender_email)
    @user = user
    @sent_to = @user.email
    @subject = subject
    @link = link
    mail(:to => @sent_to, :subject => @subject, :from => @sender_email )
  end
  
  def activation_link(sender_email, user, subject, activation_link)
    subject = "Activation Link"
    provide_email_subject_link(sender_email, user, subject, activation_link)    
  end
  
  def registration_confirmation(sender_email, user, subject, link)
    subject = "Registration success"
    provide_email_subject_link(sender_email, user, subject, link)
  end

  def forgot_password_link(sender_email, user, subject, link)
    subject = "Reset Password link"
    provide_email_subject_link(sender_email, user, subject, link)
  end
  
  def welcome_kit(sender_email, user, subject, link)
    subject = "Welcome Kit"
    provide_email_subject_link(sender_email, user, subject, link)
  end
  
  def account_blocked(sender_email, user, subject, link)
    subject = "Account Blocked Temperorly"
    provide_email_subject_link(sender_email, user, subject, link)
  end
  
  def subscription_success(sender_email, user, subject, link)
    subject = "Subscription success"
    provide_email_subject_link(sender_email, user, subject, link)
  end 
  
  def announcement_email
    
  end
  
  def press_release
    
  end
  
end
