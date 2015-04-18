class Dogsay::Dog
  include Dogsay::AsciiArt
  attr_reader :text_position, :animal, :pose
  def initialize(opts={})
    @animal  = opts.fetch :animal
    @pose    = opts.fetch :pose
    load_yaml
  end

  def to_s
    @ascii
  end

  def self.all(animal=:dog)
    find_str = File.join( File.dirname(__FILE__), 'dogs', "*.#{animal}")
    Dir[find_str].map do |f|
      File.basename(f, File.extname(f))
    end.join ', '
  end

  def self.all_animals
    find_str = File.join( File.dirname(__FILE__), 'dogs', '*')
    Dir[find_str].map do |f|
      File.extname(f)[1..-1]
    end.uniq.join ', '
  end

  private

  def filename
    File.join( File.dirname(__FILE__), 'dogs', "#{pose}.#{animal}")
  end

  def load_yaml
    begin
      yaml_hash = YAML.load_file filename
    rescue Errno::ENOENT
      raise Dogsay::InvalidDogError.new("Invalid dog file #{filename}")
    end
    @ascii = ascii_from(yaml_hash)
    @text_position = yaml_hash[:text_position]
  end

  def ascii_from(hash)
    dog_lines = hash[:dog].split("\n")
    max_length = dog_lines.map(&:length).max
    dog_lines.map { |l| l.ljust(max_length) }.join("\n")
  end
end
