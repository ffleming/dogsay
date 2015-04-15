module CoreExtensions
  module String
    module Box
      def space_at(width, opts={})
        separator = opts.fetch(:on, / /)
        self.split(separator).map do |word|
          word.scan(/.{1,#{width}}/m)
        end.flatten.join(' ')
      end

      def wrap(width)
        self.split("\n").map! do |line|
          line.length > width ? line.gsub(/(.{1,#{width}})(\s+|$)/, "\\1\n").strip : line.strip
        end.join("\n")
      end

      def boxed(width=40, opts={})
        justify = opts.fetch(:justify, :center)
        raise ArgumentError.new, "Width must be >= 5" unless width >= 5
        raise ArgumentError.new, ":justify must be :ljust, :rjust, or :center" unless %i(ljust rjust center).include? justify
        arr = self.split("\n").map do |l|
          "| #{l.send(justify, width - 4)} |"
        end
        header_line =  "+#{'-' * (width - 2)}+"
        [header_line, *arr, header_line].join("\n")
      end
    end
  end
end
