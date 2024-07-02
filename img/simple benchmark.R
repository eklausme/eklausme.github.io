# Computer: NUC
## CPU: i5-4250U CPU @ 1.30GHz
## Mem: 8GB

# Measurement vectors
jobs = seq(1, 6)
# base and base-devel group (64 unique packages)
time_base = c(340.325, 279.047, 189.770, 171.163, 161.124, 156.724)
# base, base-devel and gnome group (111 unique packages)
time_gnome = c(634.284, 498.592, 348.511, 308.346, 292.659, 298.652)
# all packages installed at the NUC (1021 unique packages)
time_all = c(4856.509, 4002.653, 2545.701, 2289.114, 2172.302, 2164.872)
# base and base-devel group using XZ_OPT instead of true parallelization (64 unique packages)
time_xzopt_base = c(332.345, 267.433, 248.689, 247.828, 246.304, 245.932)
# base, base-devel and gnome group using XZ_OPT instead of true parallelization (111 unique packages)
time_xzopt_gnome = c(620.164, 548.262, 533.265, 533.075, 528.173, 528.970)
# all packages installed at the NUC using XZ_OPT instead of true parallelization (1021 unique packages)
time_xzopt_all = c(4782.006, 3807.457, 3637.071, 3556.447, 3542.436, 3541.516)

# Export drawing as vector graphic suitable for printing with A4
#svg("bacman: simple benchmark.svg", width=1*10, height=sqrt(2)*10)

# Define initial window size
par(mfrow=c(3, 1))

# Plot points and lines for base
plot(time_all ~ jobs, main="all (1021 pkgs)", ylim=c(0, max(time_all)*1.1), xlab="Jobs/Count", ylab="Time/s", col="blue")
lines(time_all ~ jobs, col="blue")
points(time_xzopt_all ~ jobs, col="black")
lines(time_xzopt_all ~ jobs, col="black")
legend(x="topright", legend=c("Parallele Jobs", "XZ_OPT=\"-T JOBS\""), col=c("blue", "black"), pch=c(19, 19))

# Plot points and lines for gnome
plot(time_gnome ~ jobs, main="base, base-devel, gnome (111 pkgs)", ylim=c(0, max(time_gnome)*1.1), xlab="Jobs/Count", ylab="Time/s", col="blue")
lines(time_gnome ~ jobs, col="blue")
points(time_xzopt_gnome ~ jobs, col="black")
lines(time_xzopt_gnome ~ jobs, col="black")
legend(x="topright", legend=c("Parallele Jobs", "XZ_OPT=\"-T JOBS\""), col=c("blue", "black"), pch=c(19, 19))

# Plot points and lines for all
plot(time_base ~ jobs, main="base, base-devel (64 pkgs)", ylim=c(0, max(time_base)*1.1), xlab="Jobs/Count", ylab="Time/s", col="blue")
lines(time_base ~ jobs, col="blue")
points(time_xzopt_base ~ jobs, col="black")
lines(time_xzopt_base ~ jobs, col="black")
legend(x="topright", legend=c("Parallele Jobs", "XZ_OPT=\"-T JOBS\""), col=c("blue", "black"), pch=c(19, 19))

# Write drawing to file
#dev.off()
