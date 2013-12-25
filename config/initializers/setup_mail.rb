ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "rahulpatil.scs@gmail.com",
  :password             => "password000",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
#Mail.reg-ister_interceptor(DevelopmentMailInterceptor) if Rails.env.development?