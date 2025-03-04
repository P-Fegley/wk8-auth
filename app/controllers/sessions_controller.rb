class SessionsController < ApplicationController
  def new
    # render login form in sessions/new.html.erb
  end

  def create
    # authenticate the user
    # 1. try to find the user by their unique identifier
    @user = User.find_by({"email" => params["email"]})

    # 2. if the user exists -> check if they know their password
    if @user.present?  # .present? is same as asking != nil

      # 3. if they know their password -> login is successful
      if @user["password"] == params["password"]
        flash["notice"] = "Welcome."
        redirect_to "/companies"

      # 4. if the user doesn't know their password -> login fails
      else
        flash["notice"] = "Nope."
        redirect_to "/login"
      end

    # 4. if the user doesn't exist -> login fails
    else
      flash["notice"] = "Nope."
      redirect_to "/login"
    end
  end

  def destroy
    # logout the user
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
end
