puts;puts
puts "-----------------------------------------".brown
puts "************ HOTEL CHECK-IN *************".brown
puts "-----------------------------------------".brown
puts 
puts "----------------- RULES -----------------".cyan
puts "Choose the guest name. View all the rooms".cyan
puts "and thier vacanacies. Chek into rooms with".cyan
puts "available space. When all rooms are full".cyan
puts "hotel is closed and game is over. Enjoy!".cyan
puts

print "Enter a name for the hotel: ";
hotel_name = gets.chomp ; puts
puts "Welcome to " + hotel_name.upcase.cyan;
my_hotel = Hotel.new(hotel_name)

until my_hotel.rooms.all? {|k, v| v.available_space? == 0}
  puts
  print "Enter a new guest name to check in: ";
  guest_name = gets.chomp; puts
  my_hotel.list_rooms; puts
  print "Enter a room name to check into: "
  room_name = gets.chomp
  room_name = my_hotel.validate_room_name(room_name); puts

  if my_hotel.room_exists?(room_name) && !my_hotel.rooms[room_name].full? 
    my_hotel.rooms[room_name].add_occupant(guest_name)
    puts "Check in successful!".cyan; puts
    my_hotel.list_rooms_with_names
  else
    puts "Sorry, room is full! Try Another one!".cyan; puts
    my_hotel.list_rooms_with_names
  end
end

puts
puts "All rooms are full! " + hotel_name.upcase.cyan + " is now closed!"

