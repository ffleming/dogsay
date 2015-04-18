RSpec.describe Dogsay::Dog do
  before :all do
    $stderr = File.open('/dev/null', 'w')
  end

  describe '#initialize' do
    context 'using defaults' do
      let(:bad_dog) { Dogsay::Dog.new }
      it 'should abort with an unspecifed dog' do
        expect{bad_dog.animal}.to raise_error(KeyError)
      end
    end

    context 'dog of :default' do
      let(:sitting_dog) { Dogsay::Dog.new(pose: :default, animal: :dog) }
      it 'should set :dog to :default' do
        expect(sitting_dog.pose).to eq :default
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
      expect(Dogsay::Dog.all).to include 'gsd'
      expect(Dogsay::Dog.all).to include 'running'
      expect(Dogsay::Dog.all).to include 'sit'
      expect(Dogsay::Dog.all).to include 'small'
      expect(Dogsay::Dog.all).to include 'default'
    end
  end

  describe '::all_animals' do
    it 'should list all animals' do
      expect(Dogsay::Dog.all_animals).to include 'dino'
      expect(Dogsay::Dog.all_animals).to include 'dog'
    end
  end
end
