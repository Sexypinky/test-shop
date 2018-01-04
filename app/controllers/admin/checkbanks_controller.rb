class Admin::CheckbanksController < Admin::AdminController
  before_action :check_admin
  def show
    @checkbank=Checkbank.all
  end

  def destroyadm
    @checkbank=Checkbank.find(params[:format])
    if @checkbank.present?
      @checkbank.destroy
      redirect_to  admin_checkbanks_path
    end
    end

  def bank_params
    params[:checkbank].permit(:password, :nomer, :chelid)
  end
  end
