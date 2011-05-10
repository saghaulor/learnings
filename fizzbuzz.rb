def fuzzbizz
  n = 0
  n2 = n.to_s
  while n < 101
    n += 1
    if n % 15 == 0
      puts n2 + " is a fizzbuzz"
    elsif n % 3 == 0
      puts n2 + " is a fizz"
    elsif n % 5 == 0
      puts n2 + " is a buzz"
    else
      n += 1
      print n
    end
  end
end
