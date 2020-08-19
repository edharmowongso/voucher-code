require 'spec_helper'
require 'voucher_code'

RSpec.describe VoucherCode::Config do
  describe '#initialize' do
    context 'default configuration' do
      it 'returns default configuration if no params specified' do
        default_configuration = VoucherCode::Config.new

        expect(default_configuration.count).to eq 1
        expect(default_configuration.length).to eq 8
        expect(default_configuration.charset).to eq VoucherCode::Resources::CHARSET[:alphanumeric]
        expect(default_configuration.prefix).to eq ''
        expect(default_configuration.postfix).to eq ''
        expect(default_configuration.pattern).to eq '########'
      end
    end

    context 'customized configuration' do
      it 'returns custom configuration if params specified' do
        default_configuration = VoucherCode::Config.new({
          count: 3,
          length: 6,
          prefix: 'exhibition-',
          postfix: '-2020'
        })

        expect(default_configuration.count).to eq 3
        expect(default_configuration.length).to eq 6
        expect(default_configuration.charset).to eq VoucherCode::Resources::CHARSET[:alphanumeric]
        expect(default_configuration.prefix).to eq 'exhibition-'
        expect(default_configuration.postfix).to eq '-2020'
        expect(default_configuration.pattern).to eq '######'
      end
    end
  end

  describe '#generate' do
    context 'using default configuration' do
      before(:all) do
        @generated_code = VoucherCode.generate
      end

      it 'generates 1 voucher code with default length of 8' do
        expect(@generated_code.length).to eq 1
        expect(@generated_code.first.length).to eq 8
      end
    end

    context 'using custom configuration' do
      it 'generates 3 voucher codes' do
        code = VoucherCode.generate({ count: 3 })
        expect(code.length).to eq 3
      end

      it 'generates a voucher code with length of 6' do
        code = VoucherCode.generate({ length: 6 })
        expect(code[0].length).to eq 6
      end

      it 'generates a voucher code with defined prefix' do
        code = VoucherCode.generate({ prefix: 'party-' })
        expect(/^party\-([0-9a-zA-Z]){8}$/).to match(code[0])
      end

      it 'generates a voucher code based on defined charset' do
        code = VoucherCode.generate({ charset: 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ' })
        expect(/^([a-zA-Z]){8}$/).to match(code[0])
      end

      it 'generates a voucher code with defined postfix' do
        code = VoucherCode.generate({ postfix: '-2020' })
        expect(/^([0-9a-zA-Z]){8}\-2020$/).to match(code[0])
      end

      it 'generates a voucher code with defined prefix & postfix' do
        code = VoucherCode.generate({ prefix: 'party-', postfix: '-2020' })
        expect(/^party\-([0-9a-zA-Z]){8}\-2020$/).to match(code[0])
      end

      it 'generates a voucher code based on defined pattern' do
        code = VoucherCode.generate({ pattern: '####-####' })
        expect(/^([0-9a-zA-Z]){4}-([0-9a-zA-Z]){4}$/).to match(code[0])
      end

      it 'generates a voucher code based on defined pattern' do
        code = VoucherCode.generate({ pattern: '####-####' })
        expect(/^([0-9a-zA-Z]){4}-([0-9a-zA-Z]){4}$/).to match(code[0])
      end

      it 'generates default pattern if pattern used empty string' do
        code = VoucherCode.generate({ pattern: '' })
        expect(/^([0-9a-zA-Z]){8}$/).to match(code[0])
      end
    end

    context 'error response' do
      xit 'detects infeasible config' do
        config = {
          count: 1000,
          charset: 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ',
          length: 5
        }

        begin
          VoucherCode.generate(config)
        rescue => exception
          expect(raise exception).to raise_error(RuntimeError)
          # expect(exception).to eq ' Not possible to generate some requested codes.'
        end
      end
    end
  end
end
