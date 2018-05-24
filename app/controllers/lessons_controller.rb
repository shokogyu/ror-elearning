class LessonsController < ApplicationController
  #before_action correct_user

  def new
  end

  def create
    @category = Category.find(params[:category_id])
    @lesson = @category.lessons.build(user_id: current_user.id)
    if @lesson.save
      @category.words.each do |word|
        @lesson.lesson_words.create(word_id: word.id)
      end
      redirect_to category_lesson_lesson_word_path(@category.id, @lesson.id, @lesson.lesson_words.first)
    else
      flash[:danger] = "Error. Please do it again."
      redirect_to root_path
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
    @lesson_words = @lesson.lesson_words

    @count = 0
    @lesson_words.each do |l|
      @count += 1 unless l.word_answer.correct == false
    end
  end

end
