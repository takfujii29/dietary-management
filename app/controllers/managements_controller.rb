class ManagementsController < ApplicationController
  def index
    @foods = Food.all.order('name ASC')
  end
end