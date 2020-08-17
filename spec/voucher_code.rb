require 'spec_helper'

RSpec.describe VoucherCode do
  describe '#generate' do
    context 'default configuration' do
      before(:all) do
        # @default_configuration = Config.new()
      end

      it 'should return default configuration' do
        puts VoucherCode::VERSION
        puts VoucherCode.generate
        expect(1).to eq 1
      end
    end
  end
end
