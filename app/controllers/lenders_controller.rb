class LendersController < ApplicationController

  def show
    @lender = Lender.find(params[:id])
    @borrowers = Borrower.all
    @transaction = Transaction.new
    @lent = Transaction.where(lender: params[:id])
  end

  def create
    @lender = Lender.new(lender_params)
    if @lender.save
      session[:lender_id] = @lender.id
      redirect_to '/users/new'
    else
      flash[:errors] = @lender.errors.full_messages
      redirect_to '/users'
    end
  end

  def destroy
    reset_session
    redirect_to '/users'
  end

  private
  def lender_params
    params.require(:lender).permit(:first_name, :last_name, :email, :password, :money)
  end
end
