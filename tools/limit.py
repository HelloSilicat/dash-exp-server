import os
import json
import pandas as pd
import time

network = pd.read_csv("network.csv", header=None)
network.columns = ["ts", "tpt"]
interval = 2

temps = 0.0
c = 0
for v in network["tpt"].values:
    #v = v * 1.1
    c += 1
    temps += v
    if c % (10 * interval) == 0:
        os.system("tc qdisc add dev eth0 root tbf rate {}kbit latency 50ms burst 15kb".format(temps / (10.0 * interval) * 1024))
        print(temps / (10.0 * interval) * 1024, time.time(), "{}/{}".format(c, network["tpt"].shape[0]))
        time.sleep(interval)
        temps = 0
        os.system("tc qdisc del dev eth0 root")
        #os.system("./wondershaper -c -a enp0s5")

