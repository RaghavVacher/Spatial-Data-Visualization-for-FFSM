library(ncdf4)
library(fields)
#loading nc file
nc <- nc_open(choose.files())
nc

#extracting longitudes and latitudes for mapping
long <- ncvar_get(nc, "longitude")
lati <- ncvar_get(nc, "latitude")

#sorting longitudes and latitudes 
longs <- sort(long)
latis <- sort(lati)

#extracting the 5 variables in the dataset on the bases of: longitude, latitude, time
tp <- ncvar_get(nc, "tp", start = c(1 ,1 , 1), count = c(-1 , -1, 1))
e <- ncvar_get(nc, "e", start = c(1 ,1 , 1), count = c(-1 , -1, 1))
skt <- ncvar_get(nc, "skt", start = c(1 ,1 , 1), count = c(-1 , -1, 1))
lai_hv <- ncvar_get(nc, "lai_hv", start = c(1 ,1 , 1), count = c(-1 , -1, 1))
lavi_lv <- ncvar_get(nc, "lai_lv", start = c(1 ,1 , 1), count = c(-1 , -1, 1))
d2m <- ncvar_get(nc, "d2m", start = c(1 ,1 , 1), count = c(-1 , -1, 1))
src <- ncvar_get(nc, "src", start = c(1 ,1 , 1), count = c(-1 , -1, 1))

#plotting the variables using image.plot from the fields package and saving them as .png files
png("tp.png", width = 800, height = 1000)
image.plot(longs, latis, tp)
dev.off()

png("e.png", width = 800, height = 1000)
image.plot(longs, latis, e)
dev.off()

png("skt.png", width = 800, height = 1000)
image.plot(longs, latis, skt)
dev.off()

png("lai_hv.png", width = 800, height = 1000)
image.plot(longs, latis, lai_hv)
dev.off()

png("lai_lv.png", width = 800, height = 1000)
image.plot(longs, latis, lavi_lv)
dev.off()

png("d2m.png", width = 800, height = 1000)
image.plot(longs, latis, d2m)
dev.off()

png("src.png", width = 800, height = 1000)
image.plot(longs, latis, src)
dev.off()
