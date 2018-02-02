require('minitest/autorun')
require('minitest/rg')
require("pry")

require_relative('../guest.rb')
require_relative('../songs.rb')
require_relative('../rooms.rb')

class RoomsTest < MiniTest::Test

  def setup
    @song = Song.new("Africa", "Toto")
    @room = Room.new("Blue Banana", 5)
    @guest1 = Guest.new("Jean", "Africa by Toto")
    @guest2 = Guest.new("Kevin Bacon", "Footloose by Kenny Loggins")
    @guest3 = Guest.new("Jeff Bridges", "Lion King by Disney")
    @guest4 = Guest.new("Terry Crews", "D'ya think I'm sexy by Rod Stewart")
    @guest5 = Guest.new("Tina Fey", "I want it all by Queen")
    @guest6 = Guest.new("Tom Cruise", "Friday by Rebecca Black")

  end

  def test_room_has_name
    assert_equal("Blue Banana", @room.name)
  end

  def test_room_has_maximum_capacity
    assert_equal(5, @room.maximum_capacity)
  end

  def test_room_has_guests
    assert_equal(0, @room.room_guests.count)
  end

  def test_guest_check_in__empty
    @room.guest_check_in(@guest1)
    assert_equal(1, @room.room_guests.count)
    assert_equal("Jean", @room.room_guests[0].name)
  end

  def test_guest_check_in__full
    @room.guest_check_in(@guest1)
    @room.guest_check_in(@guest2)
    @room.guest_check_in(@guest3)
    @room.guest_check_in(@guest4)
    @room.guest_check_in(@guest5)
    @room.guest_check_in(@guest6)
    assert_equal("Sorry, this room is full", @room.guest_check_in(@guest6))

  end

  def test_guest_check_out
    @room.guest_check_in(@guest1)
    @room.guest_check_in(@guest2)
    @room.guest_check_out(@guest1)
    assert_equal(1, @room.room_guests.count)
  end

  def test_add_song_to_playlist
    @room.add_song_to_playlist(@song)
    assert_equal(1, @room.playlist.count)
    assert_equal("Africa", @room.playlist[0].title)
  end





end
