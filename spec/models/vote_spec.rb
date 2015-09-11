require 'rails_helper'

describe Vote do
  context 'associations' do
    it 'should belong to votable (polymorphic)' do
      should belong_to :votable
    end
  end
end
