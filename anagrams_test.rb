require "test/unit"
require_relative "anagrams"

class TestAnagrams < Test::Unit::TestCase

  def setup
    @anagrams = Anagrams.new
  end

  def teardown
    @anagrams = nil
  end

  def test_first_run
    assert_equal(@anagrams.find_anagrams('open'), [])
  end

  def test_finding_nope
    assert_equal(@anagrams.find_anagrams('open'), [])
    assert_equal(@anagrams.find_anagrams('nope'), ['open'])
  end

  def test_not_returning_duplicates
    assert_equal(@anagrams.find_anagrams('open'), [])
    assert_equal(@anagrams.find_anagrams('open'), ['open'])
    assert_equal(@anagrams.find_anagrams('open'), ['open'])
    assert_equal(@anagrams.find_anagrams('nope'), ['open'])
  end


  def test_finding_words_with_zero_length
    assert_equal(@anagrams.find_anagrams(''), [])
    assert_equal(@anagrams.find_anagrams(''), [])
  end

  def test_finding_words_with_one_char_length
    assert_equal(@anagrams.find_anagrams('a'), [])
    assert_equal(@anagrams.find_anagrams('a'), ['a'])
  end

  def test_not_returning_words_with_different_lenght
    assert_equal(@anagrams.find_anagrams('a'), [])
    assert_equal(@anagrams.find_anagrams('aa'), [])
    assert_equal(@anagrams.find_anagrams('a'), ['a'])
  end

  def test_different_character_cases
    assert_equal(@anagrams.find_anagrams('open'), [])
    assert_equal(@anagrams.find_anagrams('Nope'), ['open'])
  end
end
