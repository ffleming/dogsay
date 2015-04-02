module Dogsay::AsciiArt
  class << self
    def join(opts={})
      raise ArgumentError.new, 'Must provide :art and :text' unless %i(art text).all? {|k| opts.key? k}
      case opts.fetch(:text_position, :right)
      when :right then join_h opts[:art], opts[:text]
      when :left then join_h opts[:text], opts[:art]
      when :bottom then join_v opts[:art], opts[:text]
      when :top then join_v opts[:text], opts[:art]
      end
    end

    private

    def join_v(str1, str2)
      (str1.split("\n") + str2.split("\n")).join("\n")
    end

    def join_h(l_str, r_str)
      l_arr, r_arr = l_str.split("\n"), r_str.split("\n")
      lines = [l_arr.length, r_arr.length].max
      l_padded, r_padded = l_arr.pad_to(lines, with: ''), r_arr.pad_to(lines, with: '')
      (0..lines).map do |i|
        "#{l_padded[i]}#{r_padded[i]}"
      end.join("\n")
    end
  end
end
