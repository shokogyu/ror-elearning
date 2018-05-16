class CategoriesController < ApplicationController
  #before_action : later

  def index
    @categories = Category.all
  end
end
