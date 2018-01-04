class StaticPagesController < ApplicationController
  def welcome
  end
  def about_us
    @title='Немного о нас'
  end
end
