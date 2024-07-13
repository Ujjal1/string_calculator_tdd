class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = ','
    number_list = numbers.split(delimiter)

    number_list.map(&:to_i).reduce(0, :+)
  end
end
