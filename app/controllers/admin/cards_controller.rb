class Admin::CardsController < Admin::AdminController
before_action :check_admin
  def new
    @card=Card.new
  end

  def create
    @card=Card.new(card_params)
    if @card.save
      redirect_to admin_cards_path, notice: 'Карта успешно добавлена'
    else
      flash.now[:danger]='Ошибка добавления карты'
      render :new
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

  def show
    @card=Card.all
  end

  def destroy
    @card=Card.find(params[:format])
    if @card.present?
      @card.destroy
      redirect_to  admin_cards_path
    else
      flash.now[:danger]='Ошибка удаления CC'
      redirect_to  admin_cards_path
    end
  end


  def card_params
    params[:card].permit(:cc,:country,:price, :buyer_id, :full_cc, :not_full, :with_vbv, :without_vbv)
  end
end
