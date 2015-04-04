require 'core_extensions/array/padding'
require 'core_extensions/string/box'
require 'dogsay/version'
require 'dogsay/ascii_art'
require 'dogsay/dog'
require 'dogsay/text_box'
require 'io/console'
require 'yaml'
String.include CoreExtensions::String::Box
Array.include CoreExtensions::Array::Padding

module Dogsay
  class << self
    def say(string, opts={})
      dog  = Dogsay::Dog.new(opts.fetch(:dog, :sit))
      text = Dogsay::TextBox.new(string, opts)
      dog.add_art(text.ascii, on_the: dog.text_position)
    end
  end
end
