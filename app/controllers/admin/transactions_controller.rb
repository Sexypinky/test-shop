class Admin::TransactionsController < Admin::AdminController
  before_action :check_admin
def show
  @transaction=Transaction.all
end

  def destroy
    @transaction=Transaction.find(params[:format])
    if @transaction.present?
      @transaction.destroy
      redirect_to  transactions_path
    end
  end

  def transaction_params
    params[:transaction].permit(:nomerfrom, :nomerto, :summa)
  end
end
