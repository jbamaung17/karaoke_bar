require('minitest/autorun')
require('minitest/rg')
require("pry")

require_relative('../guest.rb')
require_relative('../songs.rb')
require_relative('../rooms.rb')

class RoomsTest < MiniTest::Test

  def setup

    @room = Room.new("Blue Banana", "Cheesy Tunes", 5)

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






end
