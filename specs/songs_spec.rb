require('minitest/autorun')
require('minitest/rg')
require("pry")

require_relative('../songs.rb')

class SongsTest < MiniTest::Test

def setup

@song = Song.new("Africa", "Toto")

end

def test_song_has_artist
  @song.artist
end

def test_song_has_title
  @song.title
end







end
