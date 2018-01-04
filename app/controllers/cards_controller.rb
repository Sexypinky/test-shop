class CardsController < ApplicationController
  def new
    @card=Card.new
  end

  def create
    @card=Card.new(card_params)
    if @card.save
      redirect_to admin_cards_path, notice: 'Карта успешно добавлена'
    else
      redirect_to new_admin_cards_path, notice:'Ошибка добавления карты'
    end
  end

  def edit
    @card=Card.find(params[:format])
  end

  def update
    @card=Card.find(params[:format])
    if @card.update
      redirect_to admin_cards_path, notice:'Пароль успешно изменен'
    else
      render :edit
    end
  end

  def search
  @card=Card.new
  end

  def result
    @card=Card.new(card_params)
    @check=@card.country
    if @check.blank?
      redirect_to cards_search_path, notice:'Поле СТРАНА обязательное'
    end
    @price=@card.price
      if @price.blank?
        @price=1000000
      end
  end

def allcc
  @card=Card.all
  end

  def buy
    if chel_signed_in?
    @check=nil
    @check2=nil
    @check3=nil
    @card=Card.find(params[:format])
    @check=Checkbank.find_by(chelid: current_chel.id)
    if not @check.blank?
      @check3=Bank.find_by(nomer: @check.nomer, password: @check.password)
      @check2=@check3.dengi > @card.price
    else redirect_to banks_path, notice:'Вы не вошли в банковский аккаунт, либо у Вас недостаточно средств на счету'
    end
      if @check2==true
        @newmoney=@check3.dengi-@card.price
        @check3.update(:dengi => @newmoney)
        @card.update(buyer_id: current_chel.id)
        redirect_to cards_mycc_path, notice:'Вы успешно приобрели СС'
      end
    else
      redirect_to new_chel_session_path, notice:'Войдите либо зарегистрируйтесь, прежде чем сделать покупку'
    end
  end

def mycc
  if not chel_signed_in?
  redirect_to new_chel_session_path, notice:'Войдите либо зарегистрируйтесь, прежде чем посмотреть свои СС'
end
end

  def card_params
    params[:card].permit(:cc,:country,:price, :buyer_id, :full_cc, :not_full, :with_vbv, :without_vbv)
  end
end
