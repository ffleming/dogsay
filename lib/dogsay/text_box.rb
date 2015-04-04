class Dogsay::TextBox
  include Dogsay::AsciiArt
  attr_reader :text_width, :separator, :justify, :raw
  def initialize(text, opts={})
    @text_width = opts.fetch(:text_width, 40)
    @separator = opts.fetch(:strip, false) ? ' ' : / /
    @justify = opts.fetch(:justify, :center)
    max_width = text.split("\n").map(&:length).max
    @raw = text.boxed(max_width + 4, justify: :ljust)
    @ascii = text.space_at(text_width - 4, on: separator).wrap(text_width - 4).boxed(text_width, justify: justify)
  end
end
