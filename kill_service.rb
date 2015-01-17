require 'socket'      # Sockets are in standard library

hostname = 'localhost'
port = 3001

s = TCPSocket.open(hostname, port)

s.puts "KILL_SERVICE"

s.close               # Close the socket when done