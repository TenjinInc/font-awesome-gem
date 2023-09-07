# frozen_string_literal: true

RSpec.describe FontAwesome::Free do
   it 'has a version number' do
      expect(FontAwesome::Free::VERSION).not_to be nil
   end

   describe 'ROOT' do
      it 'should define the local path of the FontAwesome files' do
         expect(FontAwesome::Free::ROOT.absolute?).to eq true

         files = FontAwesome::Free::ROOT.glob('*').collect { |file| file.basename.to_s }
         expect(files).to include 'css'
         expect(files).to include 'js'
         expect(files).to include 'less'
         expect(files).to include 'scss'
         expect(files).to include 'sprites'
         expect(files).to include 'svgs'
         expect(files).to include 'webfonts'
      end
   end

   describe '[]' do
      FontAwesome::Free::TYPES.each do |type|
         it "should fetch the #{ type } technology type path" do
            path = FontAwesome::Free[type]

            expect(path).to be_a String
            expect(path).to end_with "/#{ type }"
            expect(path).to include 'js-packages'
         end

         it "should fetch an absolute #{ type } technology type path" do
            path = FontAwesome::Free[type]

            expect(Pathname.new(path)).to be_absolute
         end
      end

      it 'should raise an error when the type is unknown' do
         expect do
            FontAwesome::Free[:tacos]
         end.to raise_error FontAwesome::Free::UnknownTechTypeError
      end
   end
end
