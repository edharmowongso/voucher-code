require_relative 'voucher_code/version'
require_relative 'voucher_code/config'

# Generate voucher code
module VoucherCode
  class << self
    def generate(config = {})
      config = @defaults if @defaults

      configuration = Config.new(config)
      configuration.generate
    end

    # Set global defaults for generating voucher code.
    # @example
    #   VoucherCode.defaults do |config|
    #     config.count = 1
    #     ...
    #   end
    def defaults(&block)
      @defaults = block if block_given?
      @defaults
    end
  end
end
