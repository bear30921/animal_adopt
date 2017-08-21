class CatsController < ApplicationController





  def index
    @cats = Cat.all
  end


  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cats_path, notice: "動物資料建立完成"
    else
      render :new
    end

    

  end


  private

  def cat_params
    params.require(:cat).permit(:image, :name, :type, :sex, :age, :city, :is_neuter, :is_vaccine, :description)
  end







  
end
