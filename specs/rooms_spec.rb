require('minitest/autorun')
require('minitest/rg')
require("pry")

require_relative('../guest.rb')
require_relative('../songs.rb')
require_relative('../rooms.rb')

class RoomsTest < MiniTest::Test

  def setup
    @song1 = Song.new("Africa", "Toto")
    @song2 = Song.new("Footloose", "Kenny Loggins")
    @song3 = Song.new("D'ya think I'm sexy", "Rod Stewart")
    @song4 = Song.new("Circle of Life", "Elton John")
    @song5 = Song.new("I want it all", "Queen")
    @song6 = Song.new("Friday", "Rebecca Black")
    @room = Room.new("Blue Banana", 5)
    @guest1 = Guest.new("Jean", @song1, 50)
    @guest2 = Guest.new("Kevin Bacon", @song2, 50)
    @guest3 = Guest.new("Jeff Bridges", @song3, 50)
    @guest4 = Guest.new("Terry Crews", @song4, 50)
    @guest5 = Guest.new("Tina Fey", @song5, 50)
    @guest6 = Guest.new("Tom Cruise", @song6, 50)

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
    assert_equal("Sorry, this room is full.", @room.guest_check_in(@guest6))

  end

  def test_guest_check_out
    @room.guest_check_in(@guest1)
    @room.guest_check_in(@guest2)
    @room.guest_check_out(@guest1)
    assert_equal(1, @room.room_guests.count)
  end

  def test_add_song_to_playlist
    @room.add_song_to_playlist(@song1)
    assert_equal(1, @room.playlist.count)
    assert_equal("Africa", @room.playlist[0].title)
  end





end
