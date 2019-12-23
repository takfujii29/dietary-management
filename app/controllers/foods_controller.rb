class FoodsController < ApplicationController

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

  def edit
  end

  def update
  end
  
  private
  def food_params
    params.require(:food).permit(:name, :calorie, :carbohydrate, :protein, :fat)#.merge(user_id: current_user.id)
  end
end
