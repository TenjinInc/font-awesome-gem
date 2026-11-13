# frozen_string_literal: true

RSpec.describe FontAwesome::Free do
   it 'has a version number' do
      expect(FontAwesome::Free::VERSION).to_not be_nil
   end

   describe 'ROOT' do
      it 'defines the local path of the FontAwesome files parent as absolute' do
         expect(FontAwesome::Free::ROOT.absolute?).to be true
      end

      it 'defines the local path of the FontAwesome files' do
         files = FontAwesome::Free::ROOT.glob('*').collect { |file| file.basename.to_s }
         expect(files).to include('css').and(include('js'))
                                        .and(include('scss'))
                                        .and(include('sprites'))
                                        .and(include('svgs'))
                                        .and(include('webfonts'))
      end
   end

   describe '[]' do
      FontAwesome::Free::TYPES.each do |type|
         it "fetches the #{ type } technology type path" do
            path = described_class[type]

            expect(path).to be_a(String).and end_with("/#{ type }").and include 'js-packages'
         end

         it "fetches an absolute #{ type } technology type path" do
            path = described_class[type]

            expect(Pathname.new(path)).to be_absolute
         end
      end

      it 'raises an error when the type is unknown' do
         expect do
            described_class[:tacos]
         end.to raise_error FontAwesome::Free::UnknownTechTypeError
      end
   end
end
