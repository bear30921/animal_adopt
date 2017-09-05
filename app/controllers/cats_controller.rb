class CatsController < ApplicationController

  before_action :authenticate_user! , only: [:new, :favorite]


  def favorite_list
    @favorites = current_user.favorite_animal
  end

  def index
    
    if params[:keyword] || params[:region] || params[:animal]
      @cats = Cat.paginate(:page => params[:page], :per_page => 8).order('id DESC').where("city LIKE ? AND age LIKE ? AND animal_type LIKE ?", "%#{params[:region]}%", "%#{params[:keyword]}%", "%#{params[:animal]}%")
    else
      @cats = Cat.paginate(:page => params[:page], :per_page => 8).order('id DESC')
    end
  end


  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.is_adopt = "開放領養"
    # @cat.user_id = current_user.id
    @cat.user = current_user
    @cat.contact = current_user.facebook
    if @cat.save
      redirect_to cats_path, notice: "資料建立完成"
    else
      render :new
    end
  end

  def edit
    @cat = Cat.find_by(id: params[:id])
  end

  def update
    @cat = Cat.find_by(id: params[:id])

    if @cat.update(cat_params)
      redirect_to cats_path, notice: "資料更新完成"
    else
      render :edit
    end
  end

  def show
    @cat = Cat.find_by(id: params[:id])
  end

  def destroy
    @cat = Cat.find_by(id: params[:id])

    @cat.destroy if @cat

    redirect_to cats_path, notice: "資料刪除成功"
    
  end

  def favorite
    @cat = Cat.find_by(id: params[:id])
    type = params[:type]
    if type == "favorite"
      current_user.favorite_animal << @cat
      redirect_to cat_path, notice: "#{@cat.name}收藏成功"

    else type == "unfavorite"
      current_user.favorite_animal.delete(@cat)
      redirect_to cat_path, notice: "#{@cat.name}取消收藏"
    end
  end


  


  private

  def cat_params
    params.require(:cat).permit(:image, :name, :animal_type, :sex, :age, :city, :is_neuter, :is_vaccine, :description, :avatar)
  end









  
end
