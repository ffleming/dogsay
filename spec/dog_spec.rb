RSpec.describe Dogsay::Dog do
  before :all do
    $stderr = File.open('/dev/null', 'w')
  end

  describe '#initialize' do
    context 'using defaults' do
      let(:bad_dog) { Dogsay::Dog.new }
      it 'should abort with an unspecifed dog' do
        expect{bad_dog.animal}.to raise_error(SystemExit)
      end
    end

    context 'dog of :sit' do
      let(:sitting_dog) { Dogsay::Dog.new(dog: :sit) }
      it 'should set :dog to :sit' do
        expect(sitting_dog.name).to eq :sit
      end

      it 'should set :animal to :dog' do
        expect(sitting_dog.animal).to eq :dog
      end

      it 'should set :ascii correctly' do
        sitting = File.open(File.join 'spec', 'fixtures', 'sit_to_s').read
        expect(sitting_dog.to_s).to eq sitting
      end
    end
  end

  describe '::all' do
    it 'should list all dogs' do
      expect(Dogsay::Dog.all).to eq 'gsd, running, sit, small_sit, terrier'
    end
  end

  describe '::all_animals' do
    it 'should list all animals' do
      expect(Dogsay::Dog.all_animals).to eq 'dog, dino'
    end
  end
end
