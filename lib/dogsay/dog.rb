require 'yaml'
module Dogsay
  
end
class Dogsay::Dog
  def initialize(dog=:sit)
    filename = File.join( File.dirname(__FILE__), 'dogs', "#{dog}.dog")
    dog_hash = YAML.load_file filename
    abort dog_hash.to_s
    line_arr = File.open(filename).read.split("\n")
    max_length = line_arr.map(&:length).max
    line_arr.map { |l| l.ljust(max_length) }.join("\n")
  end
end
