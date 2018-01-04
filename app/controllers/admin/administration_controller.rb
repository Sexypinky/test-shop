class  Admin::AdministrationController < Admin::AdminController
  before_action :check_admin
  def panel
  end
def newaddmoney
  @addm=Bank.new
end
  def addmoney
    @addm=Bank.new(bank_params)
    @check=Bank.find_by(nomer: @addm.nomer)
    if not @check.blank?
      @newm=@check.dengi+@addm.dengi
      @check.update(:dengi => @newm)
      redirect_to cabinet_administration_path, notice:'Счет успешно пополнен'
    else
      redirect_to admin_newaddmoney_path, notice:'Введены неверные данные'
    end
  end
  def newbanksedit
    @bank=Bank.new
  end

  def newadmin
    @chel=Chel.new
  end

  def giveadmin
    @check=nil
    @chel=Chel.new(chel_params)
    @check=Chel.find_by(email: @chel.email)
    if not @check.blank?
    @check.update(admin: true)
      redirect_to cabinet_administration_path, notice:'Права успещно выданы'
   else
     redirect_to newadmin, notice:'Такого пользователя не существует'
    end
  end

  def unadmin
    @check=Chel.find(params[:format])
    @check.update(admin: false)
    redirect_to admin_alladmins_path, notice:'Администратор удален'
  end

def alladmins
  @all=Chel.all
end

  def banksedit
    @check=Bank.find_by(nomer: @bank.nomer)
    if @check.blank?
      render :new, notice:'Ошибка ввода данных'
    else
      @check.update(:dengi => @bank.dengi)
      redirect_to cabinet_administration_path, notice:'Данные успешно изменены'
    end
  end
  def chel_params
    params[:chel].permit(:email)
  end
  def bank_params
    params[:bank].permit(:nomer, :dengi)
  end
end
