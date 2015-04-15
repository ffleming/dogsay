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
        expect(linebreaks.wrap 5).to eq "Woof.\nArf?\nArroooooo!"
      end
    end
  end # wrap

  describe '#boxed' do
    context 'with a string of appropriate length' do
      it 'should default to width 40' do
        result = "+--------------------------------------+\n" <<
                 "|     Woof arf bark ruff rowf won      |\n" <<
                 "+--------------------------------------+"
        expect(string.boxed).to eq result
      end
      context 'and width 20' do
        it 'should box appropriately' do
          result = "+------------------+\n" <<
          "|      Woof.       |\n" <<
          "|       Arf?       |\n" <<
          "|    Arroooooo!    |\n" <<
          "+------------------+"
          expect(linebreaks.boxed 20).to eq result
        end
      end
      context 'and width 5' do
        it 'should box appriately' do
          expect('!'.boxed 5).to eq "+---+\n| ! |\n+---+"
        end
      end
    end

    context 'with a string that is too short' do
      it 'should raise an exception' do
        expect{string.boxed 4}.to raise_error
      end
    end
  end #boxed
end
