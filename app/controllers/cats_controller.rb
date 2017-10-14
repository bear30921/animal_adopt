class CatsController < ApplicationController

  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy, :favorite_list, :favorite_remove, :favorite]


  


  def index
    if params[:age] || params[:region] || params[:animal]
      # letters = ["%#{(params[:region])}%"]


      @cats = Cat.paginate(:page => params[:page], :per_page => 8).order("id DESC").where("city::text LIKE ? AND animal_type::text LIKE ? AND age::text LIKE ?", "%#{params[:region]}", "%#{params[:animal]}%", "%#{params[:age]}%")


    else
      @cats = Cat.paginate(:page => params[:page], :per_page => 8).order("id DESC")
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


  def favorite_list
    @favorites = current_user.favorite_animal
  end


  def favorite_remove
    @cat = Cat.find_by(id: params[:id])
    current_user.favorites.find_by(cat_id: @cat.id).delete if @cat

    redirect_to lists_path, notice: "從收藏名單移除"
  end


  def favorite
    @cat = Cat.find_by(id: params[:id])
    type = params[:type]
    check_list = current_user.favorites.find_by(cat_id: @cat.id)
    if type == "favorite"
      if !check_list
        current_user.favorite_animal << @cat
        redirect_to cat_path, notice: "#{@cat.name}收藏成功"
      else
        redirect_to cat_path, notice: "已經在收藏名單內"
      end

    else type == "unfavorite"
        if  check_list
          current_user.favorite_animal.delete(@cat)
          redirect_to cat_path, notice: "#{@cat.name}取消收藏"
        else
          redirect_to cat_path, notice: "沒有在收藏名單內"
        end      
    end
  end


  


  private

  def cat_params
    params.require(:cat).permit(:image, :name, :animal_type, :sex, :age, :city, :is_neuter, :is_vaccine, :description, :avatar)
  end









  
end
