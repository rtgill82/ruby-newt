# frozen_string_literal: true

require 'minitest/autorun'
require 'test_helper'
require 'newt'

class TestScale < Minitest::Test
  def setup
    Newt.init
    @s = Newt::Scale.new(1, 1, 2, 100)
  end

  def teardown
    Newt.finish
  end

  def test_invalid_argument_count
    assert_raises(ArgumentError) do
      Newt::Scale.new(1, 1)
    end

    assert_raises(ArgumentError) do
      Newt::Scale.new(1, 1, 2, 100, 0, 0, 0, 0)
    end
  end

  def test_new
    Newt::Scale.new(1, 1, 2, 100)
  end

  def test_set
    @s.set(50)
  end

  def test_set_colors
    @s.set_colors(Newt::COLORSET_EMPTYSCALE, Newt::COLORSET_FULLSCALE)
  end
end

class TestScaleUninitialized < Minitest::Test
  def setup
    Newt.init
    @s = Newt::Scale.new(1, 1, 2, 100)
    Newt.finish
  end

  def test_new
    assert_init_exception do
      Newt::Scale.new(1, 1, 2, 100)
    end
  end

  def test_set
    assert_init_exception do
      @s.set(50)
    end
  end

  def test_set_colors
    assert_init_exception do
      @s.set_colors(Newt::COLORSET_EMPTYSCALE, Newt::COLORSET_FULLSCALE)
    end
  end
end
