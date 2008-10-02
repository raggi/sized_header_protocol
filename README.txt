sized_header_protocol
    by James Tucker
    http://ra66i.org
    http://github.com/raggi/sized_header_protocol

== DESCRIPTION:

A simple chainable implementation of a basic sized header protocol. The 
'protocol' does not define it's transport, that is left as configurable. 
Implementing wire protocols should call send_data to construct packets or 
frames and receive_data to deconstruct packets or frames.

== FEATURES/PROBLEMS:

* Simplicity.
* Not really suitable for streaming (this is not a problem, it's a feature).
* Needs it's documentation filling in.

== SYNOPSIS:

The following example does not cover common usage exactly, in that it talks to
itself, however, it shows an example of the data flow of an application
utilizing the protocol. 

For incoming data, receive_data calls the protocol in order to unpack the
data. The protocol will call receive_packet when a fully buffered packet has
been deconstructed and the data may be read by the application.

For outgoing data, the application calls send_packet, and that will call on 
the protocol. The protocol will use the callback send_data specified upon 
construction in order to send data 'over the wire' or to the next protocol in
the chain, in this case send_data.

  module BackChatExample
    def post_init
      @prot = SizedHeaderProtocol.new(self, :send_data, self, :receive_packet)
    end

    def receive_data(data)
      @prot.receive_data(data)
    end

    def send_packet(data)
      @prot.send_data(data)
    end

    def receive_packet(data)
      puts "<< #{data}"
    end

    def send_data(data)
      puts ">> #{data}"
    end
  end

  conn = Class.new
  conn.extend EmMock
  conn.post_init
  conn.send_data('send')
  data = "read"
  conn.receive_data("#{[data.size].pack('N')}#{data}")
  
See the specs (tests) for further details.

== REQUIREMENTS:

* A transport system (eventmachine / packet / rev)
* Bacon for the test (spec) suite.

== INSTALL:

* sudo gem install sized_header_protocol

== LICENSE:

(The MIT License)

Copyright (c) 2008 James Tucker

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
