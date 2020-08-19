require 'rails/generators'

class VoucherCodeGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  source_root File.expand_path('templates', __dir__)
  desc 'Preparing required file for voucher code integration'

  def copy_initializer
    template 'initializer.rb', 'config/initializers/voucher_code.rb'
  end
end
