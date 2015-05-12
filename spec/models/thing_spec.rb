require 'rails_helper'

describe Thing do
  describe 'tagging' do
    describe '#tagged_with' do
      let!(:cheeseburger) { Thing.create!(name: 'Cheeseburger', tag_list: 'cheese, beef') }
      let!(:steak) { Thing.create!(name: 'Steak', tag_list: 'beef') }
      
      it "doesn't return things without the specified tag" do
        expect(Thing.tagged_with(:cheese)).to_not include(steak)
      end

      it 'returns all things with the specified tag' do
        expect(Thing.tagged_with(:beef)).to include(steak, cheeseburger)
      end
    end
  end
end
