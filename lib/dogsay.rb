require 'core_extensions/array/padding'
require 'core_extensions/string/box'
require 'dogsay/version'
require 'dogsay/errors'
require 'dogsay/ascii_art'
require 'dogsay/dog'
require 'dogsay/text_box'
require 'yaml'
Array.include CoreExtensions::Array::Padding
String.include CoreExtensions::String::Box

module Dogsay
  class << self
    def say(string, opts={})
      options = config.merge opts
      dog     = Dogsay::Dog.new(options)
      text    = Dogsay::TextBox.new(string, options)
      boxed   = opts[:raw] ? text.raw : text.ascii
      dog.add_art(boxed, on_the: dog.text_position)
    end

    private

    def config
      begin
        defaults.merge(YAML.load_file "#{ENV['HOME']}/.dogsay")
      rescue Errno::ENOENT
        defaults
      end
    end

    def defaults
      {
        animal: :dog,
        pose:   :default
      }
    end
  end
end
