class CatsController < ApplicationController

  def index
    @cats = Cat.all
  end


  def new
    @cat = Cat.new
  end





  
end
