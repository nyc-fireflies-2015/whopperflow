require 'spec_helper'

describe User do
  context 'associations' do
    it 'should have many comments' do
      should have_many :comments
    end
    it 'should have many answers' do
      should have_many :answers
    end
    it 'should have many questions' do
      should have_many :questions
    end
  end
end