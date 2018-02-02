require('minitest/autorun')
require('minitest/rg')

require_relative('../drink.rb')

class DrinkTest < MiniTest::Test

  def setup

    @drink1 = Drink.new("Jameson", 5, 2)

  end

  def test_drink_has_name
    assert_equal("Jameson", @drink1.name)
  end

  def test_drink_has_price
    assert_equal(5, @drink1.price)
  end

  def test_drink_has_alcohol_level
    assert_equal(2, @drink1.alcohol_level)
  end

end
