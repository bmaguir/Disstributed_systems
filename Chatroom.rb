require 'socket'

class Chatroom
	@@users = Array.new
	@@name = "mai chatroom"
	@@no_of_users = 0
	
	def initialise(new_name)
		puts "initialising chatroom"
		@name = new_name
		@@users = Array.new
		@@no_of_users = 0
	end
	
	def initialise()
		@@name = "mai chatroom"
		@@users = Array.new
		@@no_of_users =0
	end
	
	def add_user(user)
		puts "adding user"
		@@users<< user
		@@no_of_users = @@no_of_users + 1
		puts "added user"
	end
	
	def get_no_of_users
		return @@no_of_users
	end
	
	def get_name
	return @@name
	end
	
	def send_message
	
	end
	
	def remove_user(user_id)
		puts "removing user " + user_id.to_s
		for i in 0 .. @@users.length
			if @@users[i] == user_id
				@@users[i].get_socket.puts "Closing the connection. Bye!"
				@@users[i].get_socket.close
				@@users.delete(i)
			end
		end
	end
end