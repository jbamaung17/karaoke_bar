require('minitest/autorun')
require('minitest/rg')
require("pry")

require_relative('../guest.rb')
require_relative('../songs.rb')
require_relative('../rooms.rb')

class GuestsTest < MiniTest::Test

  def setup

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

end
