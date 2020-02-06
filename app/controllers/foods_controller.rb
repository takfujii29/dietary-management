class FoodsController < ApplicationController

  def index
    @foods = Food.all.order('name ASC')
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to root_path, notice: '登録に成功しました'
    else
      render :new
    end
  end

  def show
    @food = Food.find(params[:id])
  end

  def destroy
    food = Food.find(params[:id])
    food.destroy
    redirect_to root_path
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    food = Food.find(params[:id])
    food.update(food_params)
    redirect_to root_path
  end
  
  private
  def food_params
    params.require(:food).permit(:id, :name, :calorie, :carbohydrate, :protein, :fat, :salt_equivalent, :dietary_fiber)#.merge(user_id: current_user.id)
  end
end
