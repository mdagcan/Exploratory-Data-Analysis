# plot2.R
# Time series of Global Active Power

source("read_data.R")

power_data <- read_power_data()

png("plot2.png", width = 480, height = 480, bg = "transparent")

plot(
  power_data$DateTime,
  power_data$Global_active_power,
  type = "l",  # Çizgi grafiği
  xlab = "",
  ylab = "Global Active Power (kilowatts)",
  col = "black",
  lwd = 1
)

# X ekseni etiketlerini düzgün formatla
axis.POSIXct(1, at = seq(
  min(power_data$DateTime), 
  max(power_data$DateTime), 
  by = "day"
), format = "%a")

dev.off()

message("plot2.png oluşturuldu.")
