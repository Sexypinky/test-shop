class CheckbanksController < ApplicationController
  def new
    @checkbank=Checkbank.new
  end

  def create
    @checkbank=Checkbank.new(bank_params)
    @check2=nil
    @check=nil
    @check2=Checkbank.find_by nomer: @checkbank.nomer , password: @checkbank.password
    if @checkbank.save
      @checkbank.update(:chelid => current_chel.id)
      @check=Bank.find_by nomer: @checkbank.nomer , password: @checkbank.password
      end
      if (not @check.blank?) and (not @check2.blank?)
        @checkbank.destroy
        redirect_to new_checkbanks_path, notice: 'Данная сессия уже существует'
      else
        if @check.blank?
        @checkbank.destroy
        redirect_to new_checkbanks_path, notice: 'Такого аккаунта не существует'
        else
          redirect_to banks_score_path
      end
end
    end


    def destroy
      @checkbank=Checkbank.find(params[:format])
      if @checkbank.present?
        @checkbank.destroy
        redirect_to  banks_path, notice: 'Вы закрыли сессию'
      end
    end

  def bank_params
    params[:checkbank].permit(:password, :nomer, :chelid)
  end
  end
