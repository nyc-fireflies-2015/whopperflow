class AddColumnVotesCountToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :votes_count, :integer, default: 0
  end
end
