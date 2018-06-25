require 'rails_helper'

describe List, type: :model do

  context 'validations' do
    it { should validate_presence_of :title }
  end

  context 'associations' do
    it { should belong_to :board }
  end

end
