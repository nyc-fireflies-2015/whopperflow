class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.string :content, null: false
      t.references :author
      t.integer :best_answer

      t.timestamps null: false
    end
  end
end
