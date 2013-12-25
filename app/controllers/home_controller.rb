class HomeController < ApplicationController
  def index
  end

  def about_us
  end

  def contact_us
  end

  def sign_in
  end

  def sign_up
    @user = User.new
  end

  def forget_password
  end

  def news_letter_subscription
  end
end
