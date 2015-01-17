require 'socket'

class Client
	@JOINED_CHATROOM 
	@CLIENT_IP
	@PORT
	@CLIENT_NAME
	@JOIN_ID
	@SOCKET

	def initialize(chatroom, ip, port, name, id, socket)
		puts "initalising client"
		@JOINED_CHATROOM = chatroom
		@CLIENT_IP = ip
		@PORT = port
		@CLIENT_NAME = name
		@JOIN_ID = id
		@SOCKET = socket
	end
   
	def get_id
		return @JOIN_ID
	end
   
	def get_name
		return
	end
   
   def get_socket
		return @SOCKET
   end
   
end