class Room

  attr_reader :name, :maximum_capacity, :entry_fee
  attr_accessor :playlist, :room_guests, :till

  def initialize(room_name, maximum_capacity, entry_fee)
    @name = room_name
    @playlist = []
    @maximum_capacity = maximum_capacity
    @room_guests = []
    @till = 0
    @entry_fee = entry_fee
  end

  def guest_check_in(guest)
    if @room_guests.count >= @maximum_capacity
      return "Sorry, this room is full."
    else
    @room_guests << guest
  end
  end

  def guest_check_out(guest)
    for people in @room_guests
      if people == guest
        @room_guests.delete(guest)
      end
    end
  end

  def add_song_to_playlist(song)
    @playlist << song
  end

end
