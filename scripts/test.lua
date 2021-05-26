-- test.lua
--

package.path = package.path ..";?.lua;pktgen-21.02.0/?.lua;"

require "Pktgen";

function mysleep(n)
  os.execute("sleep " .. tonumber(n))
end

pktgen.set_mac(0, "dst", "b8:ce:f6:44:d1:e2");
pktgen.set_mac(1, "dst", "b8:ce:f6:44:d1:e3");
--pktgen.set_mac(2, "dst", "04:3f:72:ad:1d:7e");
--pktgen.set_mac(3, "dst", "04:3f:72:ad:1d:7f");

local stats_file = "stats.csv";

local send_for_secs = 60;
local max_loss_rate = 0.1;
local start_rate = .1;
local pkt_sizes = { 64,128,256,512,1024 };

pktgen.set("all", "size", 64);

pktgen.set_proto("all", "udp");
pktgen.set("all", "sport", 1234);
pktgen.set("all", "dport", 5678);
pktgen.set("all", "ttl", 64);

pktgen.set_ipaddr(0, "dst", "198.18.0.85");
pktgen.set_ipaddr(1, "dst", "198.18.128.85");
--pktgen.set_ipaddr(2, "dst", "198.19.0.85");
--pktgen.set_ipaddr(3, "dst", "198.19.128.85");

pktgen.set_ipaddr("all", "src", "10.10.10.10/24");

