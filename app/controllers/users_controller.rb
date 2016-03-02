class UsersController < ApplicationController

  def index
    @lender = Lender.new
    @borrower = Borrower.new
  end

  def new
    @user = User.new
    @lender = Lender.new
    @borrower = Borrower.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/users/new'
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to '/users'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
