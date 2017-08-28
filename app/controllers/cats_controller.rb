class CatsController < ApplicationController

  before_action :authenticate_user! , only: [:new]


  def index
    
    if params[:keyword]
      @cats = Cat.paginate(:page => params[:page], :per_page => 4).order('id DESC').where("name like ?", "%#{params[:keyword]}%")
    else
      @cats = Cat.paginate(:page => params[:page], :per_page => 4).order('id DESC')
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

  


  private

  def cat_params
    params.require(:cat).permit(:image, :name, :type, :sex, :age, :city, :is_neuter, :is_vaccine, :description, :avatar)
  end









  
end
