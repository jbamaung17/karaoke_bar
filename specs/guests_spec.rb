require('minitest/autorun')
require('minitest/rg')
require("pry")

require_relative('../guest.rb')
require_relative('../songs.rb')

class GuestsTest < MiniTest::Test

  def setup
    song = Song.new("Africa", "Toto")
    @guest1 = Guest.new("Jean", song)
  end


end
