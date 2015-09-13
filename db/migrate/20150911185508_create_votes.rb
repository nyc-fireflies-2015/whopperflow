class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :up_or_down
      t.references :votable, polymorphic: true, index: true
      t.references :voter

      t.timestamps null: false
    end
  end
end
