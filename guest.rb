class Guest

  attr_reader :name, :favourite_song
  attr_accessor :money, :drunkenness

  def initialize(name, favourite_song, money)
    @name = name
    @favourite_song = favourite_song
    @money = money
    @drunkenness = 0
  end

  def guest_pay_entry_fee(room)
    @money -= room.entry_fee
    room.till += room.entry_fee
  end

  def guest_take_drink(drink)
    @drunkenness += drink.alcohol_level
  end

end
