class Admin::PagesController < Admin::AdminController

  def new
    @page=Page.new
  end

  def create
    @page=Page.new(page_params)
    if @page.save
      redirect_to admin_pages_path, notice: 'Страница успешно создана'
    else
      flash.now[:danger]='Ошибка создания страницы'
      render :new
    end
  end

  def edit
    @page=Page.find(params[:format])
  end

  def update
    @page=Page.find(params[:format])
    if @page.update(page_params)
      redirect_to pages_path
    else
      render :edit
    end
  end

  def destroy
    @page=Page.find(params[:format])
    if @page.present?
      @page.destroy
      redirect_to  pages_path
    else
      flash.now[:danger]='Ошибка удаления страницы'
      redirect_to pages_path
    end
  end

  def page_params
    params[:page].permit(:name, :description, :image, :all_tags)
  end
end
