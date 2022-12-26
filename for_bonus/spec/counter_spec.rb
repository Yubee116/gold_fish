require 'simplecov'
SimpleCov.start
require 'counter'

describe Counter do
  context 'given no initial value' do
    context 'and the first method is called' do
      it 'returns 0' do
        expect((Counter.counter())[0].call).to eq(0)
      end
    end

    context 'and the second method is called' do
      it 'returns 1' do
        expect(Counter.counter()[1].call).to eq(1)
      end
    end
  end

  context 'given initial value - 7' do
    context 'and the first method is called' do
      it 'returns 7 (inital value)' do
        expect(Counter.counter(7)[0].call).to eq(7)
      end
    end

    context 'and the second method is called' do
      it 'returns 8 (inital value plus one)' do
        expect(Counter.counter(7)[1].call).to eq(8)
      end
    end
  end
  
  context 'given non-number' do
    it 'returns nil' do
      expect(Counter.counter('10')).to eq(nil)
    end
  end
end
