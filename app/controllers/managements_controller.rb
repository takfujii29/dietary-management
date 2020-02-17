class ManagementsController < ApplicationController
  before_action :set_management, only: [:show, :edit, :update, :destroy]

  require 'date'

  def index
    # binding.pry
    @managements = Management.where(user_id: current_user.id)
    @today_managements = Management.where(day: Date.current).where(user_id: current_user.id)
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

    def management_params
      params.require(:management).permit(:title, :day, food_ids: []).merge(user_id: current_user.id)
    end
end
