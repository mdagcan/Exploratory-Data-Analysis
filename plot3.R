# plot3.R
# Time series of Energy Sub Metering (3 farklı ölçüm)

source("read_data.R")

power_data <- read_power_data()

png("plot3.png", width = 480, height = 480, bg = "transparent")

# İlk çizgiyi çiz (Sub_metering_1)
plot(
  power_data$DateTime,
  power_data$Sub_metering_1,
  type = "l",
  xlab = "",
  ylab = "Energy sub metering",
  col = "black",
  lwd = 1
)

# İkinci çizgiyi ekle (Sub_metering_2)
lines(
  power_data$DateTime,
  power_data$Sub_metering_2,
  col = "red",
  lwd = 1
)

# Üçüncü çizgiyi ekle (Sub_metering_3)
lines(
  power_data$DateTime,
  power_data$Sub_metering_3,
  col = "blue",
  lwd = 1
)

# Legend ekle
legend(
  "topright",
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col = c("black", "red", "blue"),
  lty = 1,
  lwd = 1,
  cex = 0.8,
  bty = "n"  # Legend kutusunu kaldır
)

# X ekseni etiketleri
axis.POSIXct(1, at = seq(
  min(power_data$DateTime), 
  max(power_data$DateTime), 
  by = "day"
), format = "%a")

dev.off()

message("plot3.png oluşturuldu.")
