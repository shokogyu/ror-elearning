class CreateWordAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :word_answers do |t|
      t.references :word, foreign_key: {on_delete: :cascade}
      t.string :content
      t.boolean :correct

      t.timestamps
    end
  end
end
