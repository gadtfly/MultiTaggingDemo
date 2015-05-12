require 'rails_helper'

describe Thing do
  describe 'tagging' do
    let!(:cheeseburger) { Thing.create!(name: 'Cheeseburger', tag_list: 'cheese, beef') }
    let!(:steak) { Thing.create!(name: 'Steak', tag_list: 'beef') }
    let!(:lasagna) { Thing.create!(name: 'Lasagna', tag_list: 'beef, cheese, pasta') }

    describe '#tagged_with' do
      it "doesn't return things without the specified tag" do
        expect(Thing.tagged_with(:cheese)).to_not include(steak)
      end

      it 'returns all things with the specified tag' do
        expect(Thing.tagged_with(:cheese)).to include(cheeseburger, lasagna)
      end
    end

    describe '#tagged_with_any' do
      it "doesn't return things without any of the specified tags" do
        expect(Thing.tagged_with_any([:cheese])).to_not include(steak)
      end

      it 'returns things with any of the specified tags' do
        expect(Thing.tagged_with_any([:cheese, :beef])).to include(cheeseburger, steak, lasagna)
      end
    end
  end
end
