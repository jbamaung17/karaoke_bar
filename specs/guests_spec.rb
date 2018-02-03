require('minitest/autorun')
require('minitest/rg')
require("pry")

require_relative('../guest.rb')
require_relative('../songs.rb')
require_relative('../rooms.rb')
require_relative('../drink.rb')

class GuestsTest < MiniTest::Test

  def setup
    @drink1 = Drink.new("Jameson", 5, 2)
    @guest1 = Guest.new("Jean", ["Africa", "Toto"], 50)
    @room = Room.new("Blue Banana", 5, 2)
  end

  def test_guest_name
    assert_equal("Jean", @guest1.name)
  end

  def test_guest_has_favourite_song
    assert_equal(["Africa", "Toto"], @guest1.favourite_song)
  end

  def test_guest_pay_entry_fee
    @guest1.guest_pay_entry_fee(@room)
    assert_equal(48, @guest1.money)
    assert_equal(2, @room.till)
  end

  def test_guest_take_drink
    @room.sell_drink(@drink1, @guest1)
    @guest1.guest_take_drink(@drink1)
    assert_equal(45, @guest1.money)
    assert_equal(2, @guest1.drunkenness)
  end

  def test_sing_song__drunk
    @guest1.guest_take_drink(@drink1)
    @guest1.guest_take_drink(@drink1)
    @guest1.guest_take_drink(@drink1)
    @guest1.guest_take_drink(@drink1)
    @guest1.guest_take_drink(@drink1)
    @guest1.sing_song
    assert_equal(10, @guest1.drunkenness)
    assert_equal("GIMME AFRICA BY TOTO!!!", @guest1.sing_song)
  end

  def test_sing_song__sober
    @guest1.sing_song
    assert_equal("I'm going to sing Africa by Toto", @guest1.sing_song)
  end


end
