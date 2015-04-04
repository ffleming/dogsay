RSpec.describe String do
  let(:string) { 'Woof arf bark ruff rowf won' }
  let(:long_string) { 'Arrrrooooooo' }
  let(:linebreaks) { "Woof.\n Arf?\n Arroooooo!" }
  describe '#space_at' do
    context 'with / / as separator' do
      context 'with short strings' do
        it 'should not modify the string' do
          expect(string.space_at 5, on: / /).to eq string
        end
      end
      context 'with a long string' do
        it 'should insert spaces appropriately' do
          expect(long_string.space_at(5, on: / /)).to eq 'Arrrr ooooo oo'
        end
      end
      context 'with a string with linebreaks' do
        it 'should insert spaces appropriately' do
          expect(linebreaks.space_at(5, on: / /)).to eq "Woof. \n Arf?\n Arroo oooo!"
        end
      end
    end # / / as separator

    context 'with \' \' as a separator' do
      context 'with short strings' do
        it 'should not modify the string' do
          expect(string.space_at 5, on: / /).to eq string
        end
      end
      context 'with a long string' do
        it 'should insert spaces appropriately' do
          expect(long_string.space_at(5, on: / /)).to eq 'Arrrr ooooo oo'
        end
      end
      context 'with a string with linebreaks' do
        it 'should insert spaces appropriately' do
          expect(linebreaks.space_at(5, on: / /)).to eq "Woof. \n Arf?\n Arroo oooo!"
        end
      end
    end # ' ' as separator
  end # space_at

  describe '#wrap' do
    context 'with short strings' do
      it 'should wrap appropriately' do
        expect(string.wrap 5).to eq "Woof\narf\nbark\nruff\nrowf\nwon"
      end
    end
    context 'with a long string' do
      it 'should wrap appropriately' do
        expect(long_string.wrap 5).to eq 'Arrrrooooooo'
      end
    end
    context 'with a string with linebreaks' do
      it 'should remove the spaces' do
        expect(linebreaks.wrap 5).to eq "Woof.\n Arf?\nArroooooo!"
      end
    end
  end # wrap

end
