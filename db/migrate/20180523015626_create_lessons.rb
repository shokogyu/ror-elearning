class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.references :user, foreign_key: {on_delete: :cascade}
      t.references :category, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
