
class Hotel 
  attr_reader :rooms

  def initialize(name = "Transalvania Inn")
    @name = name
    @rooms = {
      "lovelace" => Room.new(2),
      "hopper" => Room.new(2),
      "turing" => Room.new(1)
    }
  end
  
  def room_exists?(name)
    @rooms.has_key?(name)
  end

  def check_in(room, guest)
    @rooms[room].add_occupant(guest)
  end

  def has_vacanacy
    @rooms.all? {|k, v| v.available_space? > 0}
  end

  def list_rooms
    puts "------ ".brown + "Rooms and Remaining Spaces".brown + " ------".brown 
    @rooms.each do |k, v|
      puts k.capitalize.cyan +  " : "  + v.available_space?.to_s.brown
    end
    puts ("=" * 40).brown
  end

  def list_rooms_with_names
    puts "---------- ".brown + "Rooms and Occupants".brown + " ---------".brown 
    @rooms.each do |k, v|
      print k.capitalize.cyan +  " : ";  puts v.occupants.to_s.brown
    end
    puts ("=" * 40).brown
  end

  def validate_room_name(room_name)
    until @rooms.has_key?(room_name)
      print "Enter a valid room name!"
      room_name = gets.chomp.downcase
    end
    room_name
  end
end
