# VoucherCode Global Configuration

VoucherCode.defaults do |config|
  # ## Count
  #
  # It used for returning {:count} generated voucher codes
  # By default, it sets to 1
  #
  # config.count = 1

  # ## Length
  #
  # It used for returning generated voucher codes based on length configuration
  # By default, it sets to 8
  #
  # config.length = 8

  # ## Charset
  #
  # It used for generating voucher code
  # Use this three options:
  # config.charset = '0123456789'
  # config.charset = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
  # config.charset = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
  # You can also use your own custom charset
  # By default, if sets to '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
  #
  # config.charset = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'

  # ## Prefix
  #
  # It used for append prefix before generated voucher code
  # For example:
  # config.prefix = '2020-'
  # It generates 2020-${voucher_code}
  # By default, it sets to empty string/''
  #
  # config.prefix = ''

  # ## Postfix
  #
  # It used for append postfix after generated voucher code
  # For example:
  # config.postfix = '-2020'
  # It generates ${voucher_code}-2020
  # By default, it sets to empty string/''
  #
  # config.postfix = ''

  # ## Pattern
  #
  # It used for generate voucher code based on your customize pattern
  # For example:
  # config.pattern = '####-####'
  # It generates 'ABHs-12Lo'
  # By default, it sets to '########' where it depends on config.length
  #
  # config.pattern = ''
end
