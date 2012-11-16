class SessionsController < ApplicationController


	def login
	
		
	end
	
	def create_twitter
		user = User.from_omniauth (env["omniauth.auth"])
		session[:user_id] = user.id
		redirect_to index_url, notice: "Signed In!"
	end


	  def auth_hash
    request.env['omniauth.auth']
  		end



	def create_surfeit

	 user = User.find_by_email(params[:email])
    
   		 if user != nil && user.authenticate(params[:password])
   		   session[:user_id] = user.id
   		   redirect_to index_url, :notice => "Welcome back, #{user.name}!"
   		 else
   		   redirect_to fail_url, :notice => "Sorry, try again."
   		 end
	end



	def destroy
	
		session[:user_id] = nil
    	redirect_to index_url

	end


end

