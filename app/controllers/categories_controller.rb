class CategoriesController < ApplicationController
  #before_action : later

  def index
    @categories = Category.all
    Lesson.where(user_id: current_user.id, )
  end
end
