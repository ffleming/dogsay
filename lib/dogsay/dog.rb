class Dogsay::Dog
  include Dogsay::AsciiArt
  attr_reader :text_position
  def initialize(dog=:sit)
    filename = File.join( File.dirname(__FILE__), 'dogs', "#{dog}.dog")
    begin
      hsh = YAML.load_file filename
      @ascii = ascii_from(hsh)
      @text_position = hsh[:text_position]
    rescue Errno::ENOENT
      abort "Dog '#{dog}' not found"
    end
  end

  def to_s
    @ascii
  end

  def self.all
    find_str = File.join( File.dirname(__FILE__), 'dogs', "*.dog")
    Dir[find_str].map do |f|
      File.basename(f, File.extname(f))
    end.join ' '
  end

  private

  def ascii_from(hash)
    dog_lines = hash[:dog].split("\n")
    max_length = dog_lines.map(&:length).max
    dog_lines.map { |l| l.ljust(max_length) }.join("\n")
  end
end
