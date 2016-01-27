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
require 'TProtocolDecorator'

local SEPARATOR = ":"

TMultiplexedProtocol = __TObject.new(TProtocolBase, {
  __type = 'TMultiplexedProtocol',
  serviceName = ''
})

function TMultiplexedProtocol:new(protocol, serviceName)
    if not serviceName or not protocol then
        terror(TProtocolException:new{
            message = 'Must supply a protocol and serviceName to ' .. ttype(self)})
    end

    return __TObject.new(TProtocolDecorator, {
        serviceName = serviceName,
        protocol = protocol
    })
end

function TMultiplexedProtocol:writeMessageBegin(name, ttype, seqid)
    if (ttype == TMessageType.CALL or ttype == TMessageType.ONEWAY) then
        TProtocolDecorator.writeMessageBegin(self, serviceName .. SEPARATOR .. name, ttype, seqid)
    else
        TProtocolDecorator.writeMessageBegin(self, name, ttype, seqid)
    end
end
