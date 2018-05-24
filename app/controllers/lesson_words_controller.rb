class LessonWordsController < ApplicationController
  def show
    @category = Category.find(params[:category_id])
    @lesson_word = LessonWord.find(params[:id])
    @word = @lesson_word.word
    @answers = @word.answers

    @lesson = Lesson.find(params[:lesson_id])
    @lesson_words = @lesson.lesson_words
    @i = @lesson_words.index @lesson_word
  end

  def update
    @lesson_word = LessonWord.find(params[:id])
    @lesson_word.update_attributes(word_answer_id: params[:word_answer_id])
    @lesson = Lesson.find(params[:lesson_id])
    @lesson_words = @lesson.lesson_words

    i = @lesson_words.index @lesson_word
    unless @lesson_word == @lesson_words.last
      redirect_to category_lesson_lesson_word_path(id: @lesson_words[i+1].id)
    else
      redirect_to category_lesson_path(@lesson.id)
    end
  end

end