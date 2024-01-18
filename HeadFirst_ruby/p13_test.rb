# practice 13: passing test

require "minitest/autorun"
require "./p10_mixin2"

class WordSplitterTest < Minitest::Test
  def test_true_assertion
    target1 = true
    assert(target1 == true)
  end

  def test_false_assertion
    target2 = false
    assert(target2 == false)
  end

  def test_word_split
    word1 = "Nice to meet you"
    wp = WordSplitter.new
    wp.string = word1
    assert(word1.split(" ") == wp.each { |w| })
  end
end

class ListWithCommas
  attr_accessor :items
  def join
    if items.length == 1
      return items[0]
    end
    last_item = "and #{items.last}"
    other_items = items.slice(0, items.length - 1).join(", ")
    "#{other_items}#{"," if items.length > 2} #{last_item}"
  end
end

class TestListWithCommas < Minitest::Test
  def setup
    @lst = ListWithCommas.new
  end

  def teardown
    # do something before test finished
  end

  def test_it_joins_one_word
    @lst.items = ["apple"]
    assert_equal(@lst.join, "apple")
    assert_raises(StandardError) do
      raise "Opps"
    end
    assert_instance_of(Hash, {})
  end

  def test_it_joins_two_words_with_and
    @lst.items = ["apple", "orange"]
    assert_equal(@lst.join, "apple and orange")
  end

  def test_it_joins_three_words_with_commas
    @lst.items = ["apple", "orange", "pear"]
    assert_equal(@lst.join, "apple, orange, and pear")
  end
end
