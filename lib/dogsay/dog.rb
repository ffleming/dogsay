class Dogsay::Dog
  include Dogsay::AsciiArt
  attr_reader :text_position, :animal, :name
  def initialize(opts={})
    @animal, @name = animal_and_name_from(opts)
    load_yaml rescue Errno::ENOENT abort "'#{name}.#{animal}' not found"
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
    File.join( File.dirname(__FILE__), 'dogs', "#{name}.#{animal}")
  end

  def animal_and_name_from(opts)
    begin
      generic  = opts.fetch(:animal, :dog)
      specific = opts.fetch(generic)
    rescue KeyError
      abort "Animal :#{generic} specified, but key :#{specific} not provided"
    end
    [generic, specific]
  end

  def ascii_from(hash)
    dog_lines = hash[:dog].split("\n")
    max_length = dog_lines.map(&:length).max
    dog_lines.map { |l| l.ljust(max_length) }.join("\n")
  end

  def load_yaml
    yaml_hash = YAML.load_file filename
    @ascii = ascii_from(yaml_hash)
    @text_position = yaml_hash[:text_position]
  end
end
