class Guest

  attr_reader :name, :favourite_song
  attr_accessor :money

  def initialize(name, favourite_song, money)
    @name = name
    @favourite_song = favourite_song
    @money = money
  end

  def guest_pay_entry_fee(room)
    @money -= room.entry_fee
    room.till += room.entry_fee
  end


end
