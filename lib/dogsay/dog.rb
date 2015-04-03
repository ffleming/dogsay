require 'yaml'
class Dogsay::Dog
  include Dogsay::AsciiArt
  attr_reader :text_position
  def initialize(dog=:sit)
    filename = File.join( File.dirname(__FILE__), 'dogs', "#{dog}.dog2")
    hsh = YAML.load_file filename
    @ascii = ascii_from(hsh)
    @text_position = hsh[:text_position]
  end

  def to_s
    @ascii
  end

  private

  def ascii_from(hash)
    dog_lines = hash[:dog].split("\n")
    max_length = dog_lines.map(&:length).max
    dog_lines.map { |l| l.ljust(max_length) }.join("\n")
  end
end
