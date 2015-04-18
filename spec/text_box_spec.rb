RSpec.describe Dogsay::TextBox do
  before :all do
    $stderr = File.open('/dev/null', 'w')
  end

  describe '#initialize' do
    let(:default) { Dogsay::TextBox.new("Woof")}
    let(:specified) { Dogsay::TextBox.new("Woof", text_width: 20, justify: :ljust, strip: true, )}
    context 'using defaults' do
      it 'should set :text_width to 40' do
        expect(default.text_width).to eq 40
      end
      it 'should set :separator to / /' do
        expect(default.separator).to eq(/ /)
      end
      it 'should set :justify to :center' do
        expect(default.justify).to eq :center
      end
      it 'should set :raw to a minimal box' do
        expect(default.raw).to eq "+------+\n| Woof |\n+------+"
      end
      it 'should set :ascii to a spaced box' do
        expect(default.ascii).to eq "+--------------------------------------+\n" <<
                                    "|                 Woof                 |\n" <<
                                    "+--------------------------------------+"
      end
    end

    context 'using specified values' do
      it 'should set :text_width to 20' do
        expect(specified.text_width).to eq 20
      end
      it 'should set :separator to \' \'' do
        expect(specified.separator).to eq ' '
      end
      it 'should set :justify to :center' do
        expect(specified.justify).to eq :ljust
      end
      it 'should set :raw to a minimal box' do
        expect(specified.raw).to eq "+------+\n| Woof |\n+------+"
      end
      it 'should set :ascii to a spaced box' do
        expect(specified.ascii).to eq "+------------------+\n" <<
                                      "| Woof             |\n" <<
                                      "+------------------+"
      end
    end

  end
end
