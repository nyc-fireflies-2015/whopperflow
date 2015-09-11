require 'rails_helper'

describe Comment do
	context 'associations' do
		it 'should belong to commentable (polymorphic)' do
			should belong_to :commentable
		end
		it 'should belong to an author (class name User)' do
			should belong_to(:author).class_name('User')
		end
	end
end
