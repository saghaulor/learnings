def fizzbuzz
  a = (1..100)
  a.each do |x|
    if x % 15 == 0
      puts "#{x} is a fizzbuzz"
    elsif x % 3 == 0
      puts "#{x} is a fizz"
    elsif x % 5 == 0
      puts "#{x} is a buzz"
    end
  end
end
