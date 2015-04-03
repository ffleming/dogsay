require "dogsay/version"
require "dogsay/helpers"
require "dogsay/ascii_art"
require "dogsay/dog"
require "dogsay/text_box"
require 'io/console'
require 'yaml'
require 'find'
module Dogsay
  class << self
    def say(string, opts={})
      dog  = Dogsay::Dog.new(opts.fetch(:dog, :sit))
      text = Dogsay::TextBox.new(string, opts)
      dog.add_art(text.ascii, on_the: dog.text_position)
    end

    def all_dogs
      raise NotImplementedError.new
    end
  end
end
