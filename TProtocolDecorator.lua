--
-- Licensed to the Apache Software Foundation (ASF) under one
-- or more contributor license agreements. See the NOTICE file
-- distributed with this work for additional information
-- regarding copyright ownership. The ASF licenses this file
-- to you under the Apache License, Version 2.0 (the
-- "License"); you may not use this file except in compliance
-- with the License. You may obtain a copy of the License at
--
--   http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing,
-- software distributed under the License is distributed on an
-- "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
-- KIND, either express or implied. See the License for the
-- specific language governing permissions and limitations
-- under the License.
--

require 'TProtocol'

TProtocolDecorator = __TObject.new(TProtocolBase, {
  __type = 'TProtocolDecorator',
  protocol
})

function TProtocolDecorator:writeMessageBegin(name, ttype, seqid)
    self.protocol:writeMessageBegin(name, ttype, seqid)
end

function TProtocolDecorator:writeMessageEnd()
    self.protocol:writeMessageEnd()
end

function TProtocolDecorator:writeStructBegin(name)
    self.protocol:writeStructBegin()
end

function TProtocolDecorator:writeStructEnd()
    self.protocol:writeStructEnd()
end

function TProtocolDecorator:writeFieldBegin(name, ttype, id)
    self.protocol:writeFieldBegin()
end

function TProtocolDecorator:writeFieldEnd()
    self.protocol:writeFieldEnd()
end

function TProtocolDecorator:writeFieldStop()
    self.protocol:writeFieldStop()
end

function TProtocolDecorator:writeMapBegin(ktype, vtype, size)
    self.protocol:writeMapBegin(ktype, vtype, size)
end

function TProtocolDecorator:writeMapEnd()
    self.protocol:writeMapEnd()
end

function TProtocolDecorator:writeListBegin(etype, size)
    self.protocol:writeListBegin(etype, size)
end

function TProtocolDecorator:writeListEnd()
    self.protocol:writeListEnd()
end

function TProtocolDecorator:writeSetBegin(etype, size)
    self.protocol:writeSetBegin(etype, size)
end

function TProtocolDecorator:writeSetEnd()
    self.protocol:writeSetEnd()
end

function TProtocolDecorator:writeBool(bool)
    self.protocol.writeBool(bool)
end

function TProtocolDecorator:writeByte(byte)
    self.protocol:writeByte(byte)
end

function TProtocolDecorator:writeI16(i16)
    self.protocol:writeI16(i16)
end

function TProtocolDecorator:writeI32(i32)
    self.protocol:writeI32(i32)
end

function TProtocolDecorator:writeI64(i64)
    self.protocol:writeI64(i64)
end

function TProtocolDecorator:writeDouble(dub)
    self.protocol:writeDouble(dub)
end

function TProtocolDecorator:writeString(str)
    self.protocol:writeString(str)
end

function TProtocolDecorator:readMessageBegin()
    return self.protocol:readMessageBegin()
end

function TProtocolDecorator:readMessageEnd()
    self.protocol:readMessageEnd()
end

function TProtocolDecorator:readStructBegin()
    return self.protocol:readStructBegin()
end

function TProtocolDecorator:readStructEnd()
    self.protocol:readStructEnd()
end

function TProtocolDecorator:readFieldBegin()
    return self.protocol:readFieldBegin()
end

function TProtocolDecorator:readFieldEnd()
    self.protocol:readFieldEnd()
end

function TProtocolDecorator:readMapBegin()
    return self.protocol:readMapBegin()
end

function TProtocolDecorator:readMapEnd()
    self.protocol:readMapEnd()
end

function TProtocolDecorator:readListBegin()
    return self.protocol:readListBegin()
end

function TProtocolDecorator:readListEnd()
    self.protocol:readListEnd()
end

function TProtocolDecorator:readSetBegin()
    return self.protocol:readSetBegin()
end

function TProtocolDecorator:readSetEnd()
    self.protocol.readSetEnd()
end

function TProtocolDecorator:readBool()
    return self.protocol:readBool()
end

function TProtocolDecorator:readByte()
    return self.protocol:readByte()
end

function TProtocolDecorator:readI16()
    return self.protocol:readI16()
end

function TProtocolDecorator:readI32()
    return self.protocol:readI32()
end

function TProtocolDecorator:readI64()
    return self.protocol:readI64()
end

function TProtocolDecorator:readDouble()
    return self.protocol:readDouble()
end

function TProtocolDecorator:readString()
    return self.protocol:readString()
end
