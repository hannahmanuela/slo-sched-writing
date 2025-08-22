

# kubernetes
cp ../../../benchs-existing/kubernetes/out/unedited/2/out_clnt.png graphs/kubernetes-unedited.png
cp ../../../benchs-existing/kubernetes/out/unedited-idle/2/out_clnt.png graphs/kubernetes-idle.png
cp ../../../benchs-existing/kubernetes/out/patched/2/out_clnt.png graphs/kubernetes-schedbe.png

# parked
cp ../../../benchs-existing/kubernetes/out/starve/plot.png graphs/parked-kubernetes.png

# overload
cp ../../../benchs-existing/linux/srv-bg/out/unedited-rt-normal/1450/out_clnt.png graphs/overload-rt.png
cp ../../../benchs-existing/linux/srv-bg/out/patched/1450/out_clnt.png graphs/overload-schedbe.png

# comparison
cp ../../../benchs-existing/cmp_graphs/cmp_linux_idle_sched_be_weight_.png graphs/srv-bg-cmp-all.png
cp ../../../benchs-existing/cmp_graphs/cmp_linux_sched_be_weight_.png graphs/srv-bg-cmp-unedited-schedbe.png

# srv-bg
cp ../../../benchs-existing/linux/srv-bg/out/unedited-idle/1550/out_clnt.png graphs/srv-bg-idle-high.png
cp ../../../benchs-existing/linux/srv-bg/out/unedited-idle/1720/out_clnt.png graphs/srv-bg-idle-low.png
cp ../../../benchs-existing/linux/srv-bg/out/unedited-rt-normal/1550/out_clnt.png graphs/srv-bg-rt-high.png
cp ../../../benchs-existing/linux/srv-bg/out/unedited-rt-normal/1720/out_clnt.png graphs/srv-bg-rt-low.png
cp ../../../benchs-existing/linux/srv-bg/out/patched/1550/out_clnt.png graphs/srv-bg-schedbe-high.png
cp ../../../benchs-existing/linux/srv-bg/out/patched/1720/out_clnt.png graphs/srv-bg-schedbe-low.png
cp ../../../benchs-existing/linux/srv-bg/out/unedited-weight/1550/150/out_clnt.png graphs/srv-bg-weight-high.png
cp ../../../benchs-existing/linux/srv-bg/out/unedited-weight/1720/150/out_clnt.png graphs/srv-bg-weight-low.png

# mutliple weights
cp ../../../benchs-existing/linux/srv-bg/out/unedited-weight/1550/overall_latency.png graphs/srv-bg-weight-cmp-high.png
cp ../../../benchs-existing/linux/srv-bg/out/unedited-weight/1720/overall_latency.png graphs/srv-bg-weight-cmp-low.png
