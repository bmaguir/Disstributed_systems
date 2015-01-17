require 'socket'      # Sockets are in standard library

hostname = 'localhost'
port = 3001

s = TCPSocket.open(hostname, port)

s.puts "LEAVE_CHATROOM: [0]
JOIN_ID: [0]
CLIENT_NAME: [micky]
\r\n"

while line = s.gets   # Read lines from the socket
  puts line.chop      # And print with platform line terminator
end
s.close  