add support for ngx_lua base on org.apache.thrift lua library

required
==========
* openresty (>=0.9.9 feature of full-duplex)


Example
==========

```lua
require "TSocket"
require "TBinaryProtocol"
require "TFramedTransport"
require "thrift.echo_Echo"

local socket = TSocket:new({
    host = "127.0.0.1", --multi host split by ',' and loadbalance by random
    port = 9090,
    timeout = 5000, --timeout for connect/read/send operation
    connections = 10 --connection pool size, if set 0 then no keepalive connection
})

local client = EchoClient:new{
    protocol = TBinaryProtocol:new{
        trans = TFramedTransport:new(socket)
    }
}

local ok, err = pcall(socket.open, socket);
if not ok then
    ngx.log(ngx.ERR, err);
    return ngx.exit(500);
end

local ok, msg = pcall(client.echo, client, "hello");
if not ok then
    ngx.log(ngx.ERR, msg);
    return ngx.exit(500);
end

ngx.say(msg);
```
