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






end
