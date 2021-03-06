RSpec.describe Dogsay do
  before :all do
    $stderr = File.open('/dev/null', 'w')
  end

  describe '#say' do
    let(:defaults) do
      {
        animal: :dog,
        pose: :default,
        raw: false,
        text_width: 40,
        strip: false
      }
    end

    dir = './spec/fixtures/fortunes'
    (1..100).each do |n|
      it "should pass Fixture Test #{n}" do
        fortune = File.read("#{dir}/#{n}.fortune")
        expected = File.read("#{dir}/#{n}.output")
        output = Dogsay.say(fortune, defaults)
        expect(output).to eq expected
      end
    end

    it 'shoud bark' do
      woof = File.open(File.join 'spec', 'fixtures', 'say_woof').read
      expect(Dogsay.say('woof', defaults)).to eq woof
    end

    it 'should know poetry' do
      sappho = File.open(File.join 'spec', 'fixtures', 'say_sappho').read
      poem = "We know this much\nDeath is an evil;\nwe have the gods'\n" <<
             "word for it; they too\nwould die if death\nwere a good thing"
      expect(Dogsay.say(poem, defaults)).to eq sappho
    end

    context 'without a configuration file' do
      it 'should not raise errors' do
        allow(YAML).to receive(:load_file) do |arg|
          raise Errno::ENOENT if arg == "#{ENV['HOME']}/.dogsay"
          { dog: "\nDOG\n", text_position: :top }
        end
        expect {Dogsay.say 'woof'}.to_not raise_error
      end
    end

    context 'when missing dogfiles' do
      it 'should try pose of :default first' do
        opts = defaults.merge(pose: :gsd, animal: :dino)
        expect { Dogsay.say('woof', opts) }.to_not raise_error
      end

      it 'should raise an error' do
        allow(YAML).to receive(:load_file) { raise Errno::ENOENT }
        expect { Dogsay.say 'woof' }.to raise_error
      end
    end

    it 'should be able to position text on the top' do
      allow(YAML).to receive(:load_file) do |arg|
        raise Errno::ENOENT if arg == "#{ENV['HOME']}/.dogsay"
        { dog: "\nDOG\n", text_position: :top }
      end
      expect(Dogsay.say 'Woof', raw: true).to eq "+------+\n| Woof |\n+------+\n   \nDOG"
    end

    it 'should be able to position text on the bottom' do
      allow(YAML).to receive(:load_file) do |arg|
        raise Errno::ENOENT if arg == "#{ENV['HOME']}/.dogsay"
        { dog: "\nDOG\n", text_position: :bottom }
      end
      expect(Dogsay.say 'Woof', raw: true).to eq "   \nDOG\n+------+\n| Woof |\n+------+"
    end

    it 'should be able to position text on the left' do
      allow(YAML).to receive(:load_file) do |arg|
        raise Errno::ENOENT if arg == "#{ENV['HOME']}/.dogsay"
        { dog: "\nDOG\n", text_position: :left }
      end
      expect(Dogsay.say 'Woof', raw: true).to eq "+------+   \n| Woof |DOG\n+------+   "
    end

    it 'should be able to position text on the right' do
      allow(YAML).to receive(:load_file) do |arg|
        raise Errno::ENOENT if arg == "#{ENV['HOME']}/.dogsay"
        { dog: "\nDOG\n", text_position: :right }
      end
      expect(Dogsay.say 'Woof', raw: true).to eq "   +------+\nDOG| Woof |\n   +------+"
    end
  end
end
