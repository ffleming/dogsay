#!/usr/bin/env ruby
class Array
  def pad_to!(elements, opts={})
    pad_obj = opts.fetch(:with, nil)
    if self.length < elements
      (elements - self.length).times { self << pad_obj }
      self
    end
  end

  def pad_to(elements, opts={})
    ret = self.dup
    ret.pad_to!(elements, opts)
    ret
  end
end

class String
  def space_at(width)
    self.split(' ').map { |word| word.scan(/.{1,#{width}}/) }.flatten.join(' ')
  end

  def wrap(width)
    self.space_at(width).split("\n").map! do |line|
      line.length > width ? line.gsub(/(.{1,#{width}})(\s+|$)/, "\\1\n").strip : line
    end * "\n"
  end

  def boxed(width, opts={})
    justify = opts.fetch(:justify, :center)
    raise ArgumentError.new, "Width must be >= 5" unless width >= 5
    raise ArgumentError.new, ":justify must be :ljust, :rjust, or :center" unless %i(ljust rjust center).include? justify
    arr = self.wrap(width - 4).split("\n").map { |l| "| #{l.send(justify, width - 4)} |" }
    header_line =  "+#{'-' * (width - 2)}+"
    [header_line, *arr, header_line].join "\n"
  end
end
