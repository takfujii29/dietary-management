class ManagementsController < ApplicationController

  def index
    @foods = Food.all
  end

end