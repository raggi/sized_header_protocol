require File.dirname(__FILE__) + '/helper'

class MockTransport

  attr_accessor :sent, :recv

  def initialize
    @sent, @recv = [], []
  end

  def send_data(data)
    @sent << data
  end

  def receive_data(data)
    @recv << data
  end

end

describe 'sized header protocol sending a frame' do
  before do
    @trans = MockTransport.new
    @proto = SizedHeaderProtocol.new(@trans, :send_data, @trans, :receive_data)
  end

  should 'call the send method on the target object with a size header' do
    data = '1234567890'
    size = data.size
    @proto.send_data(data)
    @trans.sent.first[0,4].unpack('N').first.should.eql(size)
  end

  should 'send the data immediately after the header' do
    data = '1234567890'
    @proto.send_data(data)
    @trans.sent.first[4,data.size].should.eql(data)
  end
end

describe 'sized header protocol receiving a frame' do
  before do
    @trans = MockTransport.new
    @proto = SizedHeaderProtocol.new(@trans, :send_data, @trans, :receive_data)
  end

  should 'call receive_data with the data when a whole frame is read' do
    data = '1234567890'
    size = data.size
    packet = "#{[size].pack('N')}#{data}"
    @proto.receive_data(packet)
    @trans.recv.first.should.eql(data)
  end

  should 'buffer data until a whole frame is read' do
    data = '1234567890'
    size = data.size
    packet = "#{[size].pack('N')}#{data}"
    first = packet.slice 0, packet.size/2
    second = packet.slice packet.size/2, packet.size # excessive, but meh.
    @proto.receive_data(first)
    @trans.recv.should.be.empty
    @proto.receive_data(second)
    @trans.recv.first.should.eql(data)
  end

  should 'call the receive callback for each packet read' do
    data = '1234567890'
    size = data.size
    packet = "#{[size].pack('N')}#{data}"
    @proto.receive_data(packet + packet)
    @trans.recv.size.should.eql(2)
    @trans.recv[0].should.eql(data)
    @trans.recv[1].should.eql(data)
  end
end