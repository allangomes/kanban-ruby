require 'rails_helper'

describe Board, type: :model do

  context 'validations' do
    it { should validate_presence_of :title }
  end

end
