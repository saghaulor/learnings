def fuzzbizz
  n = 0
  while n < 101
    n += 1
    if n % 15 == 0
      puts "#{n}  is a fizzbuzz"
    elsif n % 3 == 0
      puts "#{n} is a fizz"
    elsif n % 5 == 0
      puts "#{n} is a buzz"
    end
  end
end

fuzzbizz