# spec./enumerables.rb
require './enumerables'

describe Enumerable do
  let(:array) { [1, 2, 3, 4, 5, 6, 7, 8, 9] }

  describe '#my_each' do
    it 'goes trought a whole array and apply a proc to each of the items' do
      expect(array.my_each { |item| }).to eq(array)
    end

    it 'goes trought a whole array and apply a proc to each of the items' do
      total = 0
      array.my_each { |item| total += item }
      expect(total).to eql(45)
    end
  end

  describe '#my_each_with_index' do
    it 'it returns the whole array' do
      result = 0
      expect(array.my_each_with_index { |item, index| result = index if item == 1 }).to eql(array)
    end

    it 'it goes througth a array and get the index of each item' do
      result = 0
      array.my_each_with_index { |item, index| result = index if item == 1 }
      expect(result).to eql(0)
    end
  end

  describe '#my_select' do
    it 'returns the items that base on the proc on a new array' do
      expect(array.my_select { |item| item < 5 }).to eql([1, 2, 3, 4])
    end
  end

  describe '#my_all?' do
    it 'returns true if all of the items on the array are true' do
      expect(array.my_all?).to eql(true)
    end

    it 'returns true if all of the items on the array are true with a block' do
      expect(array.my_all? { |item| item < 10 }).to eql(true)
    end

    it 'returns false if all of the items on the array arent true with a block' do
      expect(array.my_all? { |item| item < 8 }).to eql(false)
    end

    it 'returns false if all of the items on the array arent true with a parameter' do
      array = %w[jose david sam brook]
      expect(array.my_all?(/d/)).to eql(false)
    end

    it 'returns true if all of the items on the array are true with a parameter' do
      array = %w[josed david deacon Good]
      expect(array.my_all?(/d/)).to eql(true)
    end

    it 'returns true if an array is empty' do
      expect([].my_all?).to eql(true)
    end
  end

  describe '#my_any' do
    it 'returns true if at least one of the items on the array is true' do
      expect(array.my_any? { |item| item < 2 }).to eql(true)
    end

    it 'returns true if at least one of the items on the array is true' do
      array = [nil, false, 3]
      expect(array.my_any?).to eql(true)
    end

    it 'returns false if at none of all of the items are false' do
      expect(array.my_any? { |item| item > 10 }).to eql(false)
    end

    it 'returns false if the array is empty' do
      expect([].my_any?).to eql(false)
    end
  end

  describe '#my_none' do
    it 'returns true if none of the items are true on the array' do
      expect(array.my_none? { |item| item > 10 }).to eql(true)
    end

    it 'returns false if one of the items are true on the array' do
      expect(array.my_none? { |item| item > 8 }).to eql(false)
    end

    it 'returns true if the array is empty' do
      expect([].my_none?).to eql(true)
    end

    it 'returns true if all of the items are false' do
      expect([nil, false].my_none?).to eql(true)
    end
  end

  describe '#my_count' do
    it 'returns the amount of item on a array' do
      expect(array.my_count).to eql(9)
    end

    it 'returns the amount of item on a array that are true' do
      expect(array.my_count(5)).to eql(1)
    end

    it 'returns the amount of item on a array that are true' do
      expect(array.my_count { |item| item > 6 }).to eql(3)
    end
  end

  describe '#my_map' do
    it 'modify the items inside the array' do
      expect(array.my_map { |item| item * 2 }).to eql([2, 4, 6, 8, 10, 12, 14, 16, 18])
    end
  end

  describe '#my_inject' do
    it 'return a result base on the parameter' do
      expect(array.my_inject(:+)).to eql(45)
    end

    it 'return a result base on the block' do
      expect(array.my_inject { |sum, n| sum + n }).to eql(45)
    end

    it 'return a result base on the block' do
      expect(array.my_inject { |sum, n| sum * n }).to eql(362_880)
    end
  end

  describe '#multiply_els' do
    it 'return the result of the multiplication of all the items on a array' do
      expect(array.multiply_els).to eql(362_880)
    end
  end
end
