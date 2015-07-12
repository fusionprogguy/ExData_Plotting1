# PLOT3
#
#================================================
# DESCRIPTION

fname <- "plot3.png"
png(filename = fname, 
    width = plot_w, height = plot_h, 
    units = plot_u, bg = plot_bg)

# Draw the timeseries
plot3 <- function() {
        plot(gp.df$DateTime, gp.df$Sub_metering_1,
             main = "",
             ylab = "Energy sub metering",
             xlab= "",
             type = "l")

        points(gp.df$DateTime, gp.df$Sub_metering_2, col = "red", type = "l")
        points(gp.df$DateTime, gp.df$Sub_metering_3, col = "blue", type = "l")
        
        # Add the legend in the top right corner
        legend("topright",
               lty = c(1, 1),
               #put all columns that contain Sub_metering in legend
               legend = grep("Sub", names(gp.df), value = TRUE),
               col = c("black", "red", "blue"))
}
plot3()

dev.off()
cat(fname, "saved in", basename(getwd()))