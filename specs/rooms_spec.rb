require('minitest/autorun')
require('minitest/rg')
require("pry")

require_relative('../guest.rb')
require_relative('../songs.rb')
require_relative('../rooms.rb')

class RoomsTest < MiniTest::Test

  def setup

    @room = Room.new("Blue Banana", "Cheesy Tunes", 5)
    @guest1 = Guest.new("Jean", "Africa by Toto")
    @guest2 = Guest.new("Kevin Bacon", "Footloose by Kenny Loggins")

  end

  def test_room_has_name
    assert_equal("Blue Banana", @room.name)
  end

  def test_room_has_maximum_capacity
    assert_equal(5, @room.maximum_capacity)
  end

  def test_room_has_playlist
    assert_equal("Cheesy Tunes", @room.playlist)
  end

  def test_room_has_guests
    assert_equal(0, @room.room_guests.count)
  end

  def test_guest_check_in
    @room.guest_check_in(@guest1)
    assert_equal(1, @room.room_guests.count)
    assert_equal("Jean", @room.room_guests[0].name)
  end

  def test_guest_check_out
    @room.guest_check_in(@guest1)
    @room.guest_check_in(@guest2)
    @room.guest_check_out(@guest1)
    assert_equal(1, @room.room_guests.count)
  end






end
