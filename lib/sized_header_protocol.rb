class SizedHeaderProtocol

  Version = '0.1.0'

  def self.version
    Version
  end

  def initialize(send_obj, send_meth, read_obj, read_meth)
    @send_obj, @send_meth = send_obj, send_meth
    @read_obj, @read_meth = read_obj, read_meth
    @buffer, @next_size = '', nil
  end

  def send_data(data)
    @send_obj.send @send_meth, "#{[data.size].pack('N')}#{data}"
  end

  def receive_data(data)
    @buffer << data
    while more?
      unpack
    end
  end

  private
  def unpack
    @next_size ||= @buffer.slice!(0, 4).unpack('N').first
    return unless more?
    data = @buffer.slice!(0, @next_size)
    @next_size = nil
    @read_obj.send(@read_meth, data)
  end

  def more?
    # XXX 1.9 has bytesize, too, but not bytewise slice.
    @buffer.size >= (@next_size || 4)
  end

end