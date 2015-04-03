require 'yaml'
module Dogsay
  
end
class Dogsay::Dog
  def initialize(dog=:sit)
    filename = File.join( File.dirname(__FILE__), 'dogs', "#{dog}.dog2")
    hsh = YAML.load_file filename
    @dog = dog_from(hsh)
    @text_position = text_position_from(hsh)
  end

  private

  def dog_from(hash)
    dog_lines = hash[:dog].split("\n")
    max_length = dog_lines.map(&:length).max
    dog_lines.map { |l| l.ljust(max_length) }.join("\n")
  end

  def text_position_from(hash)
    abort hash[:text_position].class.to_s
    
    hash[:text_position]
  end
end
