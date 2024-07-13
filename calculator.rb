class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = ','

    if numbers.start_with?('//')
      parts = numbers.split("\n", 2)
      delimiter = parts[0][2..-1]
      numbers = parts[1]
    end

    number_list = numbers.split(delimiter)

    numbers.gsub!("\n", delimiter)
    number_list.map(&:to_i).reduce(0, :+)
  end
end
