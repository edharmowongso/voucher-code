require_relative 'voucher_code/version'
require_relative 'voucher_code/config'

# Generate voucher code
module VoucherCode
  class << self
    def generate(config = {})
      configuration = Config.new(config)
      configuration.generate
    end
  end
end
