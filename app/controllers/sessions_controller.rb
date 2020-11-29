class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:login][:email].downcase)
    respond_to do |format|
      if @user && @user.authenticate(params[:login][:password])
        # Log the user in and redirect to the user's show page.
        session[:user_id] = @user.id.to_s
        format.html { redirect_to buildings_path, notice: "Successfully Logged in"}
      else
        # Create an error message.
        format.html { render 'new' }
      end
    end
  end

  def destroy
    session[;user_id] = nil
    respond_to do |format|
      format.html { redirect_to buildings_url, notice: 'Building was successfully destroyed.' }
    end
  end
end
