class User < ActiveRecord::Base
  attr_accessible :address, :address2, :city, :country, :crypted_password, :date_of_birth, :date_of_registration, 
    :email, :email_verify, :first_name, :landmark, :last_name, :middle_name, :password_salt, 
    :persistence_token, :spam_user, :state, :terms_acceptance, :user_type, :username,
    :password, :password_confirmation
  
  acts_as_authentic do |c|
    c.login_field = 'email'
  end
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end  
end
