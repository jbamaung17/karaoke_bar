require('minitest/autorun')
require('minitest/rg')
require("pry")

require_relative('../songs.rb')

class SongsTest < MiniTest::Test

def setup

@song = Song.new("Africa", "Toto")

end

def test_song_has_artist
  assert_equal("Toto", @song.artist)
end

def test_song_has_title
  assert_equal("Africa", @song.title)
end







end
