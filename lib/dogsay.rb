require "dogsay/version"
require "dogsay/helpers"
require "dogsay/ascii_art"
require 'active_support/all'
require 'io/console'
require 'yaml'
module Dogsay
  class << self
    def say(string, opts={})
      puts dog_with_box(string)
    end

    private

    def dog(file=:sit)
      filename = File.join( File.dirname(__FILE__), 'dogsay', 'dogs', "#{file}.dog")
      line_arr = File.open(filename).read.split("\n")
      max_length = line_arr.map(&:length).max
      line_arr.map { |l| l.ljust(max_length) }.join("\n")
    end

    def dog_with_box(string, opts={})
      text_width = opts.fetch(:text_width, 40)
      text = string.space_at(text_width - 4).wrap(text_width - 4).boxed(text_width)
      Dogsay::AsciiArt.join(art: dog, text: text)
    end
  end
end
