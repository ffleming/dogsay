class Dogsay::TextBox
  include Dogsay::AsciiArt
  attr_reader :text_width, :separator, :justify, :raw
  def initialize(text, opts={})
    config      = defaults.merge(opts)
    @text_width = config[:text_width]
    @separator  = config[:strip] ? ' ' : / /
    @justify    = config[:justify]
    @raw        = raw_from(text)
    @ascii      = ascii_from(text)
  end

  private

  def ascii_from(text)
    text.space_at(text_width - 4, on: separator)
      .wrap(text_width - 4)
      .boxed(text_width, justify: justify)
  end

  def raw_from(text)
    max_width = text.split("\n").map(&:length).max
    text.boxed(max_width + 4, justify: :ljust)
  end

  def defaults
    {
      text_width: 40,
      strip:      false,
      justify:    :center
    }
  end
end
