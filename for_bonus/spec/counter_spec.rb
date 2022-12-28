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

  context 'given initial value: 7' do
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

  context 'given negative initial value: -7' do
    context 'and the first method is called' do
      it 'returns -7 (inital value)' do
        expect(Counter.counter(-7)[0].call).to eq(-7)
      end
    end

    context 'and the second method is called' do
      it 'returns -6 (inital value plus one)' do
        expect(Counter.counter(-7)[1].call).to eq(-6)
      end
    end
  end
  
  context 'given non-number' do
    context 'given a string' do
      it 'returns nil' do
        expect(Counter.counter('10')).to eq(nil)
      end
    end

    context 'given an array' do
      it 'returns nil' do
        expect(Counter.counter(['a','b','c'])).to eq(nil)
      end
    end
  end

  context 'given infinite variable' do
    context 'given positive infinity' do
      it 'returns positive infinity' do
        expect(Counter.counter(Float::INFINITY)[0].call).to eq(Float::INFINITY)
      end
    end

    context 'given negative infinity' do
      it 'returns negative' do
        expect(Counter.counter(-Float::INFINITY)[0].call).to eq(-Float::INFINITY)
      end
    end
  end

  context 'called three times with different positive initial values: 5, 10 and 15' do
    context 'and the first method is called' do
      it 'returns 5, 10, 15 (the independent counter inital values)' do
        expect(Counter.counter(5)[0].call).to eq(5)
        expect(Counter.counter(10)[0].call).to eq(10)
        expect(Counter.counter(15)[0].call).to eq(15)
      end
    end

    context 'and the second method is called' do
      it 'returns 6 and 11 (the different counter initial values plus one)' do
        expect(Counter.counter(5)[1].call).to eq(6)
        expect(Counter.counter(10)[1].call).to eq(11)
        expect(Counter.counter(15)[1].call).to eq(16)
      end
    end
  end

  context 'called three times with different negative initial values: -5, -10 and -15' do
    context 'and the first method is called' do
      it 'returns -5, -10, -15 (the independent counter inital values)' do
        expect(Counter.counter(-5)[0].call).to eq(-5)
        expect(Counter.counter(-10)[0].call).to eq(-10)
        expect(Counter.counter(-15)[0].call).to eq(-15)
      end
    end

    context 'and the second method is called' do
      it 'returns -4, -9, -14 (the independent counter inital values plus one)' do
        expect(Counter.counter(-5)[1].call).to eq(-4)
        expect(Counter.counter(-10)[1].call).to eq(-9)
        expect(Counter.counter(-15)[1].call).to eq(-14)
      end
    end
  end
end
