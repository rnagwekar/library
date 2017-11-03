class SessionsController < ApplicationController
  def new
  end

  def create
  	#session_params
   	username = params[:session][:username]
   	password = params[:session][:password]
    person = Person.find_by(name: username)
    if person && person.authenticate(password)
      # Log the user in and redirect to the user's show page.
      flash[:success] = "Welcome!"
      log_in person
      redirect_to :books
    else
      # Create an elserror message.
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
  	log_out
    redirect_to root_url
  end

  def session_params
    params.require(:session).permit(:session, :params, :username, :password)
  end
end
