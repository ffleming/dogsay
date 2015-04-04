class Dogsay::Dog
  include Dogsay::AsciiArt
  attr_reader :text_position
  def initialize(opts={})
    raise ArgumentError.new, 'Must provide :dog' unless opts.has_key? :dog
    filename = File.join( File.dirname(__FILE__), 'dogs', "#{opts[:dog]}.dog")
    begin
      hsh = YAML.load_file filename
      @ascii = ascii_from(hsh)
      @text_position = hsh[:text_position]
    rescue Errno::ENOENT
      abort "Dog '#{opts[:dog]}' not found"
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
