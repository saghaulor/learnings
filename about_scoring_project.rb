require File.expand_path(File.dirname(__FILE__) + '/edgecase')

# Greed is a dice game where you roll up to five dice to accumulate
# points.  The following "score" function will be used calculate the
# score of a single roll of the dice.
#
# A greed roll is scored as follows:
#
# * A set of three ones is 1000 points
#
# * A set of three numbers (other than ones) is worth 100 times the
#   number. (e.g. three fives is 500 points).
#
# * A one (that is not part of a set of three) is worth 100 points.
#
# * A five (that is not part of a set of three) is worth 50 points.
#
# * Everything else is worth 0 points.
#
#
# Examples:
#
# score([1,1,1,5,1]) => 1150 points
# score([2,3,4,6,2]) => 0 points
# score([3,4,5,3,3]) => 350 points
# score([1,5,1,2,4]) => 250 points
#
# More scoring examples are given in the tests below:
#
# Your goal is to write the score method.

def score(dice)
  score = 0
  # n refers to an array which members are non-special die faces except when occurring three times in a roll of three or more.
  n = [2,3,4,6]
  # Creates an empty hash referred to as scorer with default value of zero
  scorer = Hash.new(0)
  # Iterates through the dice roll and creates a key/value pair in scorer
  # where the key is the die face and the value is increased by one for every occurrence of that die face
  dice.each do |die| scorer[die] += 1
  end
  # Iterates through the hash scorer, looking for the key 1 with a value equal to or greater than 3.
  if scorer[1] >= 3
  # 1000 is added to score for 3 occurrences of die face 1, and 100 is added for each additional occurrence.
    score += 1000+(100*(scorer[1]-3))
  # If the value of the key 1 is less than 3 it adds 100 to score for every occurrence of the die face 1.
  elsif scorer[1] < 3
    score += scorer[1]*100
  end
  # Iterates through the hash scorer, looking for the key 5 with a value equal to or greater than 3.
  if scorer[5] >= 3
  # 500 is added to score for 3 occurrences of die face 5, and 50 is added for each additional occurrence.
    score += 500+(50*(scorer[5]-3))
  # If the value of the key 5 is less than 3 it adds 50 to score for every occurrence of the die face 5.
  elsif scorer[5] < 3
    score += scorer[5]*50
  end
# Iterates through array referred to as n.
  n.each do |x|
    if scorer[x] == 3
      score += x * 100
    end
  end
  # Returns the value of score after all the die values have been summed.
  score
end


class AboutScoringProject < EdgeCase::Koan
  def test_score_of_an_empty_list_is_zero
    #assert_equal 100, score([2,2,2])
    assert_equal 0, score([])
  end

  def test_score_of_a_single_roll_of_5_is_50
    assert_equal 50, score([5])
  end

  def test_score_of_a_single_roll_of_1_is_100
    assert_equal 100, score([1])
  end

  def test_score_of_multiple_1s_and_5s_is_the_sum_of_individual_scores
    assert_equal 300, score([1,5,5,1])
  end

  def test_score_of_single_2s_3s_4s_and_6s_are_zero
    assert_equal 0, score([2,3,4,6])
  end

  def test_score_of_a_triple_1_is_1000
    assert_equal 1000, score([1,1,1])
  end

  def test_score_of_other_triples_is_100x
    assert_equal 200, score([2,2,2])
    assert_equal 300, score([3,3,3])
    assert_equal 400, score([4,4,4])
    assert_equal 500, score([5,5,5])
    assert_equal 600, score([6,6,6])
  end

  def test_score_of_mixed_is_sum
    assert_equal 250, score([2,5,2,2,3])
    assert_equal 550, score([5,5,5,5])
  end

end
