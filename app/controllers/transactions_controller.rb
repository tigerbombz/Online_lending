class TransactionsController < ApplicationController
  def create
    @transaction = Transaction.new(amount: params[:amount],lender: Lender.find(session[:lender_id]), borrower: Borrower.find(params[:borrower_id]))
    if @transaction.save
    else
      flash[:error] = "Cannot Lend Money"
    end
    @lender = Lender.find(session[:lender_id])
    redirect_to @lender
  end
end
