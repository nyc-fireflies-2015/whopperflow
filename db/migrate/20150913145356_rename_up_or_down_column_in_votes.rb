class RenameUpOrDownColumnInVotes < ActiveRecord::Migration
  def change
    rename_column :votes, :up_or_down, :up
  end
end
