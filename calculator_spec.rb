require 'rspec'
require_relative 'string_calculator'

RSpec.describe StringCalculator do
  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.add('')).to eq(0)
    end

    it 'returns the number for a single number' do
      expect(StringCalculator.add('1')).to eq(1)
      expect(StringCalculator.add('5')).to eq(5)
    end

    it 'returns the sum of two numbers' do
      expect(StringCalculator.add('1,5')).to eq(6)
    end

    it 'returns the sum of multiple numbers' do
      expect(StringCalculator.add('1,2,3,4')).to eq(10)
    end

    it 'handles new lines between numbers' do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it 'supports different delimiters' do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
      expect(StringCalculator.add("//|\n1|2|3")).to eq(6)
    end

    it 'raises an exception for negative numbers' do
      expect { StringCalculator.add('1,-2,3') }.to raise_error('negative numbers not allowed: -2')
    end

    it 'shows all negative numbers in the exception message' do
      expect { StringCalculator.add('-1,-2,3') }.to raise_error('negative numbers not allowed: -1, -2')
    end
  end
end
