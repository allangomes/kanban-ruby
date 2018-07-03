require 'rails_helper'

describe Card, type: :model do

  before(:all) do
    @angra = create :angra
    @pink_floyd = create :pink_floyd
    @interestellar = create :interestellar
  end

  context 'validations' do
    it { should validate_presence_of :title }
  end

  context 'associations' do
    it { should belong_to :board }
    it { should belong_to :list }
  end

  context 'position cheking' do

    after(:each) do
      @angra.reload
      @pink_floyd.reload
      @interestellar.reload
    end

    it 'check list id' do
      expect(@angra.list.id).to eq(1)
      expect(@pink_floyd.list.id).to eq(1)
      expect(@interestellar.list.id).to eq(2)
    end

    it 'check position' do
      expect(@angra.position).to eq(1)
      expect(@pink_floyd.position).to eq(2)
      expect(@interestellar.position).to eq(1)
    end

    it 'update position' do
      @pink_floyd.update!(position: 1)
    end

    it 'positions after position changed' do
      expect(@pink_floyd.position).to eq(1)
      expect(@angra.position).to eq(2)
      expect(@interestellar.position).to eq(1)
    end

    it 'change list to last' do
      @pink_floyd.update!(list_id: 2, position: nil)
    end

    it 'positions after list change' do
      expect(@angra.list.id).not_to eq(@pink_floyd.list.id)
      expect(@interestellar.list.id).to eq(@pink_floyd.list.id)
      
      expect(@angra.position).to eq(1)
      expect(@interestellar.position).to eq(1)
      expect(@pink_floyd.position).to eq(2)
    end

    it 'change list to position' do
      @angra.update!(list_id: 2, position: 2)
    end

    it 'positions after list change to postion' do
      expect(@interestellar.position).to eq(1)
      expect(@angra.position).to eq(2)
      expect(@pink_floyd.position).to eq(3)
    end
  end
end
