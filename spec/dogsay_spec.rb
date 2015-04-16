RSpec.describe Dogsay do
  describe '#say' do
    it 'shoud bark' do
      woof = File.open(File.join 'spec', 'fixtures', 'say_woof').read
      expect(Dogsay.say('woof')).to eq woof
    end

    it 'should know poetry' do
      sappho = File.open(File.join 'spec', 'fixtures', 'say_sappho').read
      poem = "We know this much\nDeath is an evil;\nwe have the gods'\n" <<
             "word for it; they too\nwould die if death\nwere a good thing"
      expect(Dogsay.say(poem)).to eq sappho
    end
  end
end
