module VoucherCode
  module Helpers
    class Randomize
      class << self
        def random_int(min, max)
          (rand * (max - min + 1)).floor + min
        end

        def random_element(array)
          array[random_int(0, array.length - 1)]
        end
      end
    end
  end
end
