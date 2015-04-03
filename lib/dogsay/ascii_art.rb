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
      l_arr, r_arr = normalized_arrays_from(l_str, r_str)
      (0..l_arr.length - 1).map do |i|
        "#{l_arr[i]}#{r_arr[i]}"
      end.join("\n")
    end

    def normalized_arrays_from(l_str, r_str)
      l_arr, r_arr = l_str.split("\n"), r_str.split("\n")
      max_arr_length = [l_arr.length, r_arr.length].max
      [l_arr, r_arr].map do |array|
        max_str_length = array.map(&:length).max
        array.pad_to(max_arr_length, with: ' ' * max_str_length)
      end
    end
  end
end
