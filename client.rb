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


s.puts "CHAT: [0]
JOIN_ID: [0]
CLIENT_NAME: [micky]
MESSAGE: [string terminated with '\n\n']
\r\n"

line = s.gets   # Read lines from the socket
while line != "\r\n"
		puts line.chop      # And print with platform line terminator
		lines.push(line)
		line = s.gets
end

s.puts "DISCONNECT: [0]
PORT: [0]
CLIENT_NAME: [dicky]
\r\n"

while line != "\r\n"
		puts line.chop      # And print with platform line terminator
		lines.push(line)
		line = s.gets
end

s.close               # Close the socket when done