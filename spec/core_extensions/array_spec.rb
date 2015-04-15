RSpec.describe Array do
  let(:arr) { ['a', 'dog', 'barks'] }
  describe '#pad_to' do
    context 'no object specified' do
      it 'should default to nil' do
        expect(arr.pad_to(5)).to eq ['a', 'dog', 'barks', nil, nil]
        expect(arr).to eq ['a', 'dog', 'barks']
      end
    end

    context 'an object specified' do
      it 'should pad with that object' do
        expect(arr.pad_to(5, with: 'woof')).to eq ['a', 'dog', 'barks', 'woof', 'woof']
        expect(arr).to eq ['a', 'dog', 'barks']
      end
    end
  end

  describe '#pad_to!' do
    context 'no object specified' do
      it 'should default to nil' do
        array = arr.dup
        array.pad_to!(5)
        expect(array).to eq ['a', 'dog', 'barks', nil, nil]
      end
    end

    context 'an object specified' do
      it 'should pad with that object' do
        array = arr.dup
        array.pad_to!(5, with: 'woof')
        expect(array).to eq ['a', 'dog', 'barks', 'woof', 'woof']
      end
    end
  end

end
