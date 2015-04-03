class Dogsay::TextBox
  include Dogsay::AsciiArt
  attr_reader :text_width, :separator, :raw
  def initialize(text, opts={})
    @text_width = opts.fetch(:text_width, 40)
    @separator = opts.fetch(:strip, false) ? ' ' : / /
    @raw = text
    @ascii = text.space_at(text_width - 4, on: separator).wrap(text_width - 4).boxed(text_width)
  end
end
