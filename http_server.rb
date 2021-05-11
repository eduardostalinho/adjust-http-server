require 'socket'

server  = TCPServer.new('0.0.0.0', 80)

loop {
  client  = server.accept
  request = client.readpartial(2048)
  
  method, path, version = request.lines[0].split

  puts "#{method} #{path} #{version}"

  if path == "/healthcheck"
    response = "OK"
  else
    response = "Well, hello there!"
  end

  client.print "#{version} 200\r\n"
  client.print "Content-Length: #{response.bytesize}\r\n"
  client.print "\r\n"
  client.print response

  client.close
}
