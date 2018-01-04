class TransactionsController < ApplicationController
  def new
    @transaction=Transaction.new
  end

  def create
    @transaction=Transaction.new(transaction_params)
    @check1=Bank.find_by(nomer: @transaction.nomerto)
    @check2=Checkbank.find_by(chelid: current_chel.id)
    if not @check2.blank?
      @check3=Bank.find_by(nomer: @check2.nomer)
    if @check1.blank?
      redirect_to new_transactions_path, notice: 'Введены неверные данные'
    else
      @dengi2=@transaction.summa+@check1.dengi
      @dengi3=@check3.dengi-@transaction.summa
      if @check1.update(:dengi => @dengi2) and @check3.update(:dengi => @dengi3)
      redirect_to banks_score_path, notice: 'Транзакция успешно осуществлена'
        else
          redirect_to new_transactions_path, notice:'Введена неккоректная сумма'
        end
    end
    end
  end

  def transaction_params
    params[:transaction].permit(:nomerto, :summa)
  end
end
