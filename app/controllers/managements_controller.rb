class ManagementsController < ApplicationController
  before_action :set_management, only: [:show, :edit, :update, :destroy]
  # before_action :total, only: [:index]

  require 'date'

  def index
    @managements = Management.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @management = Management.new
    return nil if params[:keyword] == ""
    @foods = Food.where(['name LIKE ?', "%#{params[:keyword]}%"])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def edit
  end

  def create
    @management = Management.new(management_params)
    if @management.save
      redirect_to managements_path, notice: '登録しました'
    else
      render :new
    end
  end

  def update
    if @management.update(management_params)
      redirect_to managements_path, notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    @management.destroy
    redirect_to managements_path, notice: '削除しました' 
  end

  private
    def set_management
      @management = Management.find(params[:id])
    end

    # def total
    #   @today_managements = Management.where(day: Date.current).where(user_id: current_user.id).includes(:foods)
    #   @total_calorie = 0
    #   @total_carbohydrate = 0
    #   @total_protein = 0
    #   @total_fat = 0
    #   @total_salt_equivalent = 0
    #   @total_dietary_fiber = 0
    #   @today_managements.each do |today|
    #     today.foods.each do |food|
    #       @total_calorie += food.calorie
    #       @total_carbohydrate += food.carbohydrate
    #       @total_protein += food.protein
    #       @total_fat += food.fat
    #       @total_salt_equivalent += food.salt_equivalent
    #       @total_dietary_fiber += food.dietary_fiber
    #     end
    #   end
    # end

    def management_params
      params.require(:management).permit(:title, :day, food_ids: []).merge(user_id: current_user.id)
    end
end
