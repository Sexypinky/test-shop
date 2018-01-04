
class Admin::BanksController < Admin::AdminController
  before_action :check_admin
  def welcome
    if chel_signed_in?
    @checkbank=Checkbank.all
    @check=Checkbank.find_by chelid: current_chel.id
 if not @check.blank?
   redirect_to banks_score_path
 end
    else
      redirect_to chels_sign_in_path, notice:'Войдите, либо зарегистрируйтесь прежде чем сделать покупку'
    end
    end

  def new
    @bank=Bank.new
  end

  def create
    @check=nil
    @bank=Bank.new(bank_params)
    @check=Bank.find_by(nomer: @bank.nomer)
    if @check.blank?
    @bank.save
      redirect_to banks_path, notice: 'Cчет успешно создан'
    else
      if not @check.blank?
        flash.now[:danger]='Ошибка создания счета, данный счет уже существует'
        render :new
        else
      flash.now[:danger]='Ошибка создания счета, номер счета должен быть четерхзначным'
      render :new
        end
      end

  end

def find_bank
  @bank=Bank.all
  @bank.each do |bank|
    @nomer=bank.nomer
    @password=bank.password
    @check=Bank.find_by nomer: @nomer , password: @password
  end

end
  def show
    @bank=Bank.all
  end

  def destroy
    @bank=Bank.find(params[:format])
    if @bank.present?
      @bank.destroy
      redirect_to  banks_path, notice:'Счет успешно удален'
    end
  end

  def destroyadm
    @bank=Bank.find(params[:format])
    if @bank.present?
      @bank.destroy
      redirect_to  banks_show_path, notice:'Счет успешно удален'
    end
  end

  def edit
    @bank=Bank.find(params[:format])
  end

  def update
    @bank=Bank.find(params[:format])
    if @bank.update(:password => @bank.password)
      redirect_to banks_score_path, notice:'Пароль успешно изменен'
    else
      render :edit
    end
  end

def addmoney
  @bank=Bank.find(params[:format])
  @money=1000+@bank.dengi
  if @bank.update(:dengi => @money)
    redirect_to banks_score_path
  end
end
  def zero
    @bank=Bank.find(params[:format])
    @money=0
    if @bank.update(:dengi => @money)
      redirect_to banks_score_path
    end
  end

  def score
    if chel_signed_in?
    @check=Checkbank.find_by chelid: current_chel.id
    else
      redirect_to new_chel_session_path, notice:'Войдите, либо зарегистрируйтесь, прежде чем воспользоваться банковским счетом'
      end
    if @check.blank?
      redirect_to banks_path
    else
    @checkB=Bank.find_by nomer: @check.nomer, password: @check.password
    end
    end

  def mytransactions
    @transaction=Transaction.all
    @bank=Bank.find(params[:format])
    @nomer=@bank.nomer

  end
  def bank_params
    params[:bank].permit(:password, :nomer, :dengi)
  end
  end

