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
      print n2 + "is neither a fizz nor a buzz nor a fizzbuzz."
    end
  end
end

fuzzbizz