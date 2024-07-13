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
    negatives = number_list.select { |num| num.to_i < 0 }

    raise "negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?

    numbers.gsub!("\n", delimiter)
    number_list.map(&:to_i).reduce(0, :+)
  end
end
