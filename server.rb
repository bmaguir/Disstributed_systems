require 'socket'                # Get sockets from stdlib
require_relative 'Clients'
require_relative 'Chatroom'

@@Chatroom_simple = Array.new
@@myChatrooms = Array.new
@@join_id = 0
@@server_ip = "macneill.scss.tcd.ie"

def thread_fun(client)
	lines = Array.new
	puts "new connection"
	line = client.gets   # Read lines from the socket
	while line != "\r\n"
		#puts line.chop      # And print with platform line terminator
		exit if line.include? "KILL_SERVICE"
		lines.push(line)
		line = client.gets
	end
	
	if lines[0].include? "JOIN_CHATROOM:"
		puts "Joining Chatroom"
		client_details = Array.new
		lines.each do |l|
			arr = l.split(/\[(.*?)\]/)
			client_details.push(arr[1])
		end
		puts "creating new client"
		newClient = Client.new(client_details[0], client_details[1], client_details[2], client_details[3], @@join_id, client)
		@@join_id = @@join_id + 1
		@@myChatrooms[0].add_user(newClient)
		
		client.puts "JOINED_CHATROOM: [" + @@myChatrooms[0].get_name + "]\nSERVER_IP: [" + @@server_ip + "]\nPORT: [0]\nROOM_REF: [0]\nJOIN_ID: [" + newClient.get_id.to_s + "]\r\n"
	end
	
	if lines[0].include? "LEAVE_CHATROOM:"
		puts "Leaving chatroom"
		client_details = Array.new
		lines.each do |l|
			arr = l.split(/\[(.*?)\]/)
			client_details.push(arr[1])		#room ref, join_id, name
		end
		puts client_details
		@@myChatrooms[client_details[0].to_i].remove_user(client_details[1].to_i)
		puts "removed user " + client_details[2]
		client.puts "LEFT_CHATROOM: [" + client_details[0] + "]\nJOIN_ID: [" + client_details[1] + "]\r\n"
	end
	
	if lines[0].include? "CHAT:"
		puts "Message"
		client_details = Array.new
		lines.each do |l|
			arr = l.split(/\[(.*?)\]/)
			client_details.push(arr[1])		#room ref, join_id, name
		end
		lines.join()
		puts lines
		puts client_details
		client.puts "\r\n"
	
	
	end
	puts "closing thread"
	#client.puts "Closing the connection. Bye!"
	#client.close                # Disconnect from the client

end

@@myChatrooms.push(Chatroom.new)

thread_pool = Array.new
server = TCPServer.open(3001)   # Socket to listen on port 20007

@@myChatrooms[0].add_user(Client.new("hai", 0, 0,"micky", 123, server))
@@myChatrooms[0].remove_user(123)

puts "Listenting on port 3001"
loop {                          # Servers run forever

  client = server.accept;
  puts "Accepted message starting Thread"
  thread_pool.push(Thread.new{thread_fun(client)})
  thread_pool.each do |thread|
	if thread.status == "false"
		puts "joining Thread"
		thread.join
		thread.delete
	end
  end
}
  
 