require 'rails_helper'

describe Question do
	context 'associations' do
		it 'should have many answers' do
			should have_many :answers
		end
		it 'should have one best_answer (class name Answer)' do
			should have_one(:best_answer).class_name('Answer')
		end
		it 'should have many comments' do
			should have_many :comments
		end
		it 'should belong to author (class name User)' do
			should belong_to(:author).class_name('User')
		end
		it 'should have many votes' do
			should have_many :votes
		end
	end
end
