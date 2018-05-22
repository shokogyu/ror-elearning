class Admin::WordsController < ApplicationController
  before_action :admin_user

  def index
  end

  def new
    @category = Category.find(params[:category_id])
    @word = @category.words.build
    # @answer = @word.answers.build
    @answer = 3.times { @word.answers.build }
  end

  def create
    @category = Category.find(params[:category_id])
    # @word = Word.new(word_params)
    @word = @category.words.build(word_params)

    if @word.save
      flash[:success] = "New word created!"
      redirect_to admin_category_path(@category)
    else
      render 'new'
    end
  end


  private

  def word_params
    params.require(:word).permit(:id, :content, answers_attributes: [:content, :correct])
  end

end
