class ManagementsController < ApplicationController

  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  private
  def food_params
    params.require(:food).permit(:name, :calorie, :carbohydrate, :protein, :fat)#.merge(user_id: current_user.id)
  end

end