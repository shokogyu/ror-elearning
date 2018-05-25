class CreateLessonWords < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_words do |t|
      t.references :lesson, foreign_key: {on_delete: :cascade}
      t.references :word, foreign_key: {on_delete: :cascade}
      t.references :word_answer, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
