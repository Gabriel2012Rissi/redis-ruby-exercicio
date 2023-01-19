require_relative "./libs/clientDAO"
require_relative "./libs/client"

# Start the app
puts "Welcome to Redis CLI"
puts "Type 'help' to see all commands"
puts "\n"

while true
  print "local> "
  command = gets.chomp.split(" ")

  case command[0]
  when "exit"
    puts "BYE"
    break
  else
    Client.start(command)
  end
end