# plot1.R
# Histogram of Global Active Power

# Veri okuma fonksiyonunu yükle
source("read_data.R")

# Veriyi oku
power_data <- read_power_data()

# PNG dosyasını başlat
png("plot1.png", width = 480, height = 480, bg = "transparent")

# Histogram çiz
hist(
  power_data$Global_active_power,
  col = "red",
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)",
  ylab = "Frequency",
  breaks = 12,
  xlim = c(0, 8),
  ylim = c(0, 1200)
)

# Grafik cihazını kapat
dev.off()

message("plot1.png oluşturuldu.")
