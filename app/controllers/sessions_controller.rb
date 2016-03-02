class SessionsController < ApplicationController

  def index
    @session = Session.new
  end

  def create
    @lender = Lender.find_by_email(params[:lender][:email])
      if @lender && @lender.authenticate(params[:lender][:password])
        session[:lender_id] = @lender.id
        redirect_to @lender
      else
        flash[:error] = "Invalid email or password"
        redirect_to '/users'
      end
  end

  def create_borrower
    @borrower = Borrower.find_by_email(params[:borrower][:email])
      if @borrower && @borrower.authenticate(params[:borrower][:password])
        session[:borrower_id] = @borrower.id
        redirect_to @borrower
      else
        flash[:error] = "Invalid email or password"
        redirect_to '/users'
      end
  end

  def destroy
    reset_session
    redirect_to '/users'
  end

end
