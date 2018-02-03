require('minitest/autorun')
require('minitest/rg')
require("pry")

require_relative('../guest.rb')
require_relative('../songs.rb')
require_relative('../rooms.rb')
require_relative('../drink.rb')

class RoomsTest < MiniTest::Test

  def setup
    @song1 = Song.new("Africa", "Toto")
    @song2 = Song.new("Footloose", "Kenny Loggins")
    @song3 = Song.new("D'ya think I'm sexy", "Rod Stewart")
    @song4 = Song.new("Circle of Life", "Elton John")
    @song5 = Song.new("I want it all", "Queen")
    @song6 = Song.new("Friday", "Rebecca Black")
    @room = Room.new("Blue Banana", 5, 2)
    @guest1 = Guest.new("Jean", @song1, 50)
    @guest2 = Guest.new("Kevin Bacon", @song2, 50)
    @guest3 = Guest.new("Jeff Bridges", @song3, 50)
    @guest4 = Guest.new("Terry Crews", @song4, 50)
    @guest5 = Guest.new("Tina Fey", @song5, 50)
    @guest6 = Guest.new("Tom Cruise", @song6, 50)
    @drink1 = Drink.new("Gordons", 5, 2)

  end

  def test_room_has_name
    assert_equal("Blue Banana", @room.room_name)
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

def test_oh_no_godzilla
  @room.add_song_to_playlist(@song1)
  @room.guest_check_in(@guest1)
  @room.oh_no_godzilla
  assert_equal(0, @room.playlist.count)
  assert_equal(0, @room.room_guests.count)
  assert_equal("And suddenly, as if from nowhere, Godzilla rises from the sea and destroys downtown Tokyo. The Blue Banana is completely destroyed, there are no survivors. Long live our lizard Lord", @room.oh_no_godzilla)
end


def test_sell_drink
  @room.sell_drink(@drink1, @guest1)
  assert_equal(5, @room.till)
  assert_equal(45, @guest1.money)
end


end
