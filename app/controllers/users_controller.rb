
class UsersController < ApplicationController
    def servertest
        render json: { message: 'Server is running fine!' }, status: :ok
    end

    def create
        @user = User.new(user_params)
        if @user.save
          render json: { user: @user, message: 'User created successfully' }, status: :created
        else
          render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      def authenticate
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
          render json: { user: @user, message: 'Logged in successfully' }, status: :ok
        else
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
      end
    
      private
    
      def user_params
        params.permit(:email, :password, :password_confirmation)
      end
end