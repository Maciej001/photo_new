class SessionsController < ApplicationController

	def new 

	end

	# def create
	# 	user = User.find_by(email: params[:session][:email].downcase)
	# 	if user && user.authenticate(params[:session][:password])
	# 		# service success and redirect to user's profile page
	# 	else
	# 		flash.now[:error] = 'Invalid email/password cobination'
	# 		render 'new'
	# 		# error message + render login page
	# 	end			
	# end

	def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user

      # function implemented in sessions helper
      # to redirect user to stored earlier page
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

	def destroy
		sign_out
		redirect_to root_url
	end
	
end
