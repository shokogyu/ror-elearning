class Admin::WordsController < ApplicationController
  before_action :admin_user

  def index
  end

  def new
    @category = Category.find(params[:category_id])
    @word = @category.words.build
    @answer = 3.times { @word.answers.build }
  end

  def create
    @category = Category.find(params[:category_id])
    @word = @category.words.build(word_params)

    if @word.save
      flash[:success] = "New word created!"
      redirect_to admin_category_path(@category)
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find_by(params[:category_id])
    @word = Word.find_by(id: params[:id])
  end

  def update
    @category = Category.find_by(params[:category_id])
    @word = Word.find_by(id: params[:id])
    if @word.update_attributes(word_params)
      flash[:success] = "Word updated!"
      #redirect_to admin_category_path(@category)
      redirect_to root
    else
      render 'edit'
    end
  end

  def destroy
    
  end


  private

  def word_params
    params.require(:word).permit(:id, :content, answers_attributes: [:content, :correct])
  end

end
