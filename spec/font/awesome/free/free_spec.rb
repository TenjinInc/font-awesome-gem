# frozen_string_literal: true

RSpec.describe FontAwesome::Free do
   it 'has a version number' do
      expect(FontAwesome::Free::VERSION).not_to be nil
   end

   it 'should fetch the technology group path' do
      expect(FontAwesome::Free[:css]).to be_a String
   end
end
