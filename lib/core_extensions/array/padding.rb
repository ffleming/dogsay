module CoreExtensions
  module Array
    module Padding
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
  end
end
