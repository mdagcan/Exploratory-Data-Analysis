# read_data.R
# Veri okuma fonksiyonu - SADECE 2007-02-01 ve 2007-02-02 için

read_power_data <- function() {
  
  # Eğer dosya yoksa indir
  if (!file.exists("household_power_consumption.txt")) {
    message("Dosya indiriliyor...")
    download.file(
      "https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip",
      "household_power_consumption.zip",
      method = "curl"
    )
    unzip("household_power_consumption.zip")
    message("Dosya indirildi ve açıldı.")
  }
  
  # Sütun isimleri
  col_names <- c(
    "Date", "Time", "Global_active_power", "Global_reactive_power",
    "Voltage", "Global_intensity", "Sub_metering_1", 
    "Sub_metering_2", "Sub_metering_3"
  )
  
  # Sadece 2007-02-01 ve 2007-02-02 tarihlerini oku
  # skip = 66637 (1-indexed), nrows = 2880 (2 gün * 24 saat * 60 dakika)
  data <- read.table(
    "household_power_consumption.txt",
    sep = ";",
    na.strings = "?",
    skip = 66637,
    nrows = 2880,
    col.names = col_names,
    stringsAsFactors = FALSE
  )
  
  # DateTime sütunu oluştur
  data$DateTime <- as.POSIXct(
    paste(data$Date, data$Time),
    format = "%d/%m/%Y %H:%M:%S"
  )
  
  # Kontroller
  message("Veri okundu. Satır sayısı: ", nrow(data))
  message("Tarih aralığı: ", 
          format(min(data$DateTime), "%Y-%m-%d"), " - ", 
          format(max(data$DateTime), "%Y-%m-%d"))
  
  return(data)
}
