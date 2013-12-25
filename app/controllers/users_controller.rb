class UsersController < ApplicationController
  
  #before_filter :require_user, :except => [:create]

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def new
    @user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    first_name = params[:user][:first_name]
    email = params[:user][:email]    
    selected_password = params[:user][:password]
    
    @user = User.new
    @user.first_name = first_name
    @user.email = email
    @user.password = selected_password
    @user.password_confirmation = selected_password
    #respond_to do |format|
      if @user.save
        UserMailer.registration_confirmation( nil, @user, nil, nil ).deliver
        #UserMailer.activation_link( nil, @user, nil, nil ).deliver
        
        redirect_to "/Index", :notice => "Registration successful! Please sign in."
        #format.html { redirect_to @user, notice: 'User was successfully created.' }
        #format.json { render json: @user, status: :created, location: @user }
      else
        redirect_to "/Index", :notice => "Registration failure. Please try again."
#        format.html { render action: "new" }
#        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    #end
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end