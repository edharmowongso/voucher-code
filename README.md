# Coupon/Voucher Code Generator

Generate unique, random, and hard to guess coupon/voucher codes. Use cases: promo codes, loyalty coupons, gift vouchers, in-app purchases, referral links

This project was inspired from https://github.com/rspective/voucher-code-generator-js

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'voucher_code'
```

And then execute:

```sh
$ bundle install
```

## API Reference

### Generate voucher code

Add this snippet to your base code

```ruby
VoucherCode.generate
```

If you would like to use custom configuration, there are several attributes you have to understand first.

**Count**
It used for returning {:count} generated voucher codes
By default, it sets to 1

**Length**
It used for returning generated voucher codes based on length configuration
By default, it sets to 8

**Charset**
It used for generating voucher code
Use this three options:
config.charset = '0123456789'
config.charset = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
config.charset = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
You can also use your own custom charset
By default, if sets to '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'

**Prefix**
It used for append prefix before generated voucher code
For example:
config.prefix = '2020-'
It generates 2020-${voucher_code}
By default, it sets to empty string/''

**Postfix**
It used for append postfix after generated voucher code
For example:
config.postfix = '-2020'
It generates ${voucher_code}-2020
By default, it sets to empty string/''

**Pattern**
It used for generate voucher code based on your customize pattern
For example:
config.pattern = '####-####'
It generates 'ABHs-12Lo'
By default, it sets to '########' where it depends on config.length

```ruby
configuration = {
  count: 1,
  length: 8,
  charset: '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ',
  prefix: 'abcd-',
  postfix: '-2020',
  pattern: '########'
}

VoucherCode.generate(configuration)
```
