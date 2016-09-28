require 'minitest/autorun'

def find_peaks(nums)
  fail 'All elements must be an integer' unless nums.all? { |x| x.is_a?(Integer) }

  nums.select.with_index do |x, i|
    i == 0 ||
      i == nums.length - 1 ||
      x > nums[i - 1] && x > nums[i + 1]
  end
end


class FindPeaksTest < Minitest::Test
  def test_include_a_digit_that_is_larger_than_both_its_neighbors
    assert_equal [1, 5, 1], find_peaks([1, 2, 3, 4, 5, 4, 3, 2, 1])
  end

  def test_include_multiple_peaks
    assert_equal [1, 3, 5, 3, 1], find_peaks([1, 2, 3, 2, 5, 2, 3, 2, 1])
  end

  def test_return_an_empty_array_if_no_digits_passed
    assert_equal [], find_peaks([])
  end

  def test_return_the_array_if_a_single_digit_is_passed
    assert_equal [1], find_peaks([1])
  end

  def test_return_the_array_if_only_two_digits_are_passed
    assert_equal [1, 2], find_peaks([1, 2])
  end

  def test_not_count_three_of_the_same_digits_as_a_peak
    refute find_peaks([1, 2, 3, 3, 3, 2, 1]).include?(3)
  end

  def test_include_the_first_and_last_element_even_when_there_are_no_peaks
    assert_equal [1, 6], find_peaks([1, 2, 3, 4, 5, 6])
  end

  def test_raises_error_if_not_all_integers
    assert_raises { find_peaks([1, 'pancackes', 3]) }
  end
end
