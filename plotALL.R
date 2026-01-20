# run_all.R
# Tüm plotları tek seferde oluştur

message("Exploratory Data Analysis - Course Project 1")
message("=============================================")

# Gerekli dosyalar var mı kontrol et
required_scripts <- c("read_data.R", "plot1.R", "plot2.R", "plot3.R", "plot4.R")
missing_scripts <- required_scripts[!file.exists(required_scripts)]

if (length(missing_scripts) > 0) {
  stop("Eksik dosyalar: ", paste(missing_scripts, collapse = ", "))
}

# Tüm plotları oluştur
message("\n1. plot1.png oluşturuluyor...")
source("plot1.R")

message("\n2. plot2.png oluşturuluyor...")
source("plot2.R")

message("\n3. plot3.png oluşturuluyor...")
source("plot3.R")

message("\n4. plot4.png oluşturuluyor...")
source("plot4.R")

# Kontrol
png_files <- c("plot1.png", "plot2.png", "plot3.png", "plot4.png")
created_files <- png_files[file.exists(png_files)]

if (length(created_files) == 4) {
  message("\n✅ TÜM PLOTLAR BAŞARIYLA OLUŞTURULDU!")
  message("Oluşturulan dosyalar:")
  for (file in created_files) {
    file_size <- file.size(file) / 1024  # KB cinsinden
    message("  - ", file, " (", round(file_size, 1), " KB)")
  }
} else {
  missing <- png_files[!file.exists(png_files)]
  warning("\n⚠️ Eksik dosyalar: ", paste(missing, collapse = ", "))
}

message("\n📁 Mevcut dosyalar:")
print(list.files(pattern = "\\.(png|R)$"))
