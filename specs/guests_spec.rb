require('minitest/autorun')
require('minitest/rg')
require("pry")

require_relative('../guest.rb')
require_relative('../songs.rb')

class GuestsTest < MiniTest::Test

  def setup

    @guest1 = Guest.new("Jean", "Africa by Toto")
  end

  def test_guest_name
    assert_equal("Jean", @guest1.name)
  end

  def test_guest_has_favourite_song
    assert_equal("Africa by Toto", @guest1.favourite_song)
  end

end
