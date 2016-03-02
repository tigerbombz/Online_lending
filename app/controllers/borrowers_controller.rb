class BorrowersController < ApplicationController

  def show
    @borrower = Borrower.find(params[:id])
    @borrowers = Transaction.where(borrower: Borrower.find(params[:id]))
    @raised = Transaction.where(borrower: Borrower.find(params[:id])).sum(:amount)
  end

  def create
    @borrower = Borrower.new(borrower_params)
    if @borrower.save
      session[:borrower_id] = @borrower.id
      redirect_to '/users/new'
    else
      flash[:errors] = @borrower.errors.full_messages
      redirect_to '/users'
    end
  end

  def destroy
    reset_session
    redirect_to '/users'
  end

  def borrower_params
    params.require(:borrower).permit(:first_name, :last_name, :email, :password, :reason, :description, :amount)
  end
end
