class PagesController < ApplicationController
def cabinet

end
def create
  @page=Page.new(page_params)
  if @page.save
    redirect_to pages_path, notice: 'Страница успешно создана'
  else
    flash.now[:danger]='Ошибка создания страницы'
    render :new
  end
end
  def find_page
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
def delete
  @page=Page.find(params[:format])
  if @page.present?
    @page.destroy
    redirect_to  pages_path
  else
    flash.now[:danger]='Ошибка удаления страницы'
    redirect_to pages_path
  end
end

  def show
    @page=Page.paginate(page: params[:page], per_page: 5)
  end

  def show_page
    @page=Page.find(params[:format])
  end

  def page_params
    params[:page].permit(:name, :description, :image, :all_tags)
  end
end
