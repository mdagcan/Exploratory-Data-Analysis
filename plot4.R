# plot4.R
# 2x2 Panel Grafik

source("read_data.R")

power_data <- read_power_data()

png("plot4.png", width = 480, height = 480, bg = "transparent")

# 2x2 panel ayarla
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 0, 0))

# 1. Grafik: Global Active Power (sol üst)
plot(
  power_data$DateTime,
  power_data$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power",
  col = "black",
  lwd = 1
)
axis.POSIXct(1, at = seq(
  min(power_data$DateTime), 
  max(power_data$DateTime), 
  by = "day"
), format = "%a")

# 2. Grafik: Voltage (sağ üst)
plot(
  power_data$DateTime,
  power_data$Voltage,
  type = "l",
  xlab = "datetime",
  ylab = "Voltage",
  col = "black",
  lwd = 1
)
axis.POSIXct(1, at = seq(
  min(power_data$DateTime), 
  max(power_data$DateTime), 
  by = "day"
), format = "%a")

# 3. Grafik: Energy Sub Metering (sol alt)
plot(
  power_data$DateTime,
  power_data$Sub_metering_1,
  type = "l",
  xlab = "",
  ylab = "Energy sub metering",
  col = "black",
  lwd = 1,
  ylim = c(0, max(power_data$Sub_metering_1, power_data$Sub_metering_2, power_data$Sub_metering_3, na.rm = TRUE))
)
lines(power_data$DateTime, power_data$Sub_metering_2, col = "red", lwd = 1)
lines(power_data$DateTime, power_data$Sub_metering_3, col = "blue", lwd = 1)
legend(
  "topright",
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col = c("black", "red", "blue"),
  lty = 1,
  lwd = 1,
  cex = 0.7,
  bty = "n"
)
axis.POSIXct(1, at = seq(
  min(power_data$DateTime), 
  max(power_data$DateTime), 
  by = "day"
), format = "%a")

# 4. Grafik: Global Reactive Power (sağ alt)
plot(
  power_data$DateTime,
  power_data$Global_reactive_power,
  type = "l",
  xlab = "datetime",
  ylab = "Global_reactive_power",
  col = "black",
  lwd = 1
)
axis.POSIXct(1, at = seq(
  min(power_data$DateTime), 
  max(power_data$DateTime), 
  by = "day"
), format = "%a")

dev.off()

message("plot4.png oluşturuldu.")
