require 'rails_helper'

describe Answer do
  context 'associations' do
    it 'should belong to an author (class name User)' do
      should belong_to(:author).class_name('User')
    end
    it 'should belong to a question' do
      should belong_to :question
    end
    it 'should have many comments' do
      should have_many :comments
    end
    it 'should have many votes' do
      should have_many :votes
    end
  end
end


