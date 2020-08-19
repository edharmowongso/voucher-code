require_relative 'resources/charset'
require_relative 'helpers/randomize'

module VoucherCode
  # Voucher code configuration
  class Config
    attr_reader :config,
                :count,
                :length,
                :charset,
                :prefix,
                :postfix,
                :pattern

    def initialize(config = {})
      @config = config || {}
      @count = config[:count] || 1
      @length = config[:length] || 8
      @charset = config[:charset] || select_charset('alphanumeric')
      @prefix = config[:prefix] || ''
      @postfix = config[:postfix] || ''

      @pattern = if config[:pattern].nil? || config[:pattern].empty?
                  looping('#', @length)
                else
                  config[:pattern]
                end
    end

    def generate
      raise 'Not possible to generate some requested codes.' unless feasible?

      codes = {}
      while @count.positive?
        code = generate_single_data

        unless codes[code]
          codes[code] = true
          @count -= 1
        end
      end

      codes.keys
    end

    private

    def looping(str, length)
      result = ''

      i = 0
      until i > length - 1
        result += str
        i += 1
      end

      result
    end

    def select_charset(name)
      selected_charset = Resources::CHARSET[name.to_sym]

      raise 'Invalid charset' unless selected_charset

      selected_charset
    end

    def generate_single_data
      code = @pattern.split('').map { |char|
        char == '#' ?
          Helpers::Randomize.random_element(@charset) :
          char
      }.join('')

      "#{@prefix}#{code}#{@postfix}"
    end

    def feasible?
      (@length ** (@pattern.match(/#/) || []).length) >= @count
    end
  end
end
