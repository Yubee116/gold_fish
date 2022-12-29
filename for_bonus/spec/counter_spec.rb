require 'simplecov'
SimpleCov.start
require 'counter'

describe counter do
  context 'given no initial value' do
    context 'and the first method is called' do
      it 'returns 0' do
        expect((counter())[0].call).to eq(0)
      end
    end

    context 'and the second method is called' do
      it 'returns 1' do
        expect(counter()[1].call).to eq(1)
      end
    end
  end

  context 'given positive initial value: 7' do
    context 'and the first method is called' do
      it 'returns 7 (inital value)' do
        expect(counter(7)[0].call).to eq(7)
      end
    end

    context 'and the second method is called' do
      it 'returns 8 (inital value plus one)' do
        expect(counter(7)[1].call).to eq(8)
      end
    end
  end

  context 'given negative initial value: -7' do
    context 'and the first method is called' do
      it 'returns -7 (inital value)' do
        expect(counter(-7)[0].call).to eq(-7)
      end
    end

    context 'and the second method is called' do
      it 'returns -6 (inital value plus one)' do
        expect(counter(-7)[1].call).to eq(-6)
      end
    end
  end
  
  context 'given non-number' do
    context 'given a string' do
      it 'returns nil' do
        expect(counter('10')).to eq(nil)
      end
    end

    context 'given an array' do
      it 'returns nil' do
        expect(counter(['a','b','c'])).to eq(nil)
      end
    end
  end

  context 'given positve infinity' do
    context 'and first method is called' do
      it 'returns positive infinity' do
        expect(counter(Float::INFINITY)[0].call).to eq(Float::INFINITY)
      end
    end

    context 'and second method is called' do
      it 'returns positive infinity' do
        expect(counter(Float::INFINITY)[1].call).to eq(Float::INFINITY)
      end
    end
  end

  context 'given negative infinity' do
    context 'and first method is called' do
      it 'returns negative infinity' do
        expect(counter(-Float::INFINITY)[0].call).to eq(-Float::INFINITY)
      end
    end

    context 'and second method is called' do
      it 'returns negative infinity' do
        expect(counter(-Float::INFINITY)[1].call).to eq(-Float::INFINITY)
      end
    end
  end
  
  context 'called three times with different positive initial values: 5, 10 and 15' do
    context 'and the first method is called' do
      it 'returns 5, 10, 15 (the independent counter inital values)' do
        expect(counter(5)[0].call).to eq(5)
        expect(counter(10)[0].call).to eq(10)
        expect(counter(15)[0].call).to eq(15)
      end
    end

    context 'and the second method is called' do
      it 'returns 6, 11 and 16 (the different counter initial values plus one)' do
        expect(counter(5)[1].call).to eq(6)
        expect(counter(10)[1].call).to eq(11)
        expect(counter(15)[1].call).to eq(16)
      end
    end
  end

  context 'called three times with different negative initial values: -5, -10 and -15' do
    context 'and the first method is called' do
      it 'returns -5, -10, -15 (the independent counter inital values)' do
        expect(counter(-5)[0].call).to eq(-5)
        expect(counter(-10)[0].call).to eq(-10)
        expect(counter(-15)[0].call).to eq(-15)
      end
    end

    context 'and the second method is called' do
      it 'returns -4, -9, -14 (the independent counter inital values plus one)' do
        expect(counter(-5)[1].call).to eq(-4)
        expect(counter(-10)[1].call).to eq(-9)
        expect(counter(-15)[1].call).to eq(-14)
      end
    end
  end
end
