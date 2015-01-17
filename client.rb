require 'socket'      # Sockets are in standard library

hostname = 'localhost'
port = 3001

s = TCPSocket.open(hostname, port)

s.puts "JOIN_CHATROOM: [DaBois]
CLIENT_IP: [0]
PORT: [0]
CLIENT_NAME: [dicky]
\r\n"
lines = Array.new

line = s.gets   # Read lines from the socket
while line != "\r\n"
		puts line.chop      # And print with platform line terminator
		lines.push(line)
		line = s.gets
end

s.puts "LEAVE_CHATROOM: [0]
JOIN_ID: [0]
CLIENT_NAME: [micky]
\r\n"

line = s.gets   # Read lines from the socket
while line != "\r\n"
		puts line.chop      # And print with platform line terminator
		lines.push(line)
		line = s.gets
end

s.close               # Close the socket when done