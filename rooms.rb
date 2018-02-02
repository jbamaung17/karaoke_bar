class Room

attr_reader :name, :maximum_capacity
attr_accessor :playlist, :room_guests

def initialize(room_name, playlist, maximum_capacity)
  @name = room_name
  @playlist = playlist
  @maximum_capacity = maximum_capacity
  @room_guests = []

end

def guest_check_in(guest)
  @room_guests << guest
end

def guest_check_out(guest)
  for people in @room_guests
    if people == guest
      @room_guests.delete(guest)
    end
  end
end




end
