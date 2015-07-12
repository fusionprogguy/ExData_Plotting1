# PLOT4
#
#================================================
# DESCRIPTION

fname <- "plot4.png"
png(filename = fname, 
    width = plot_w, height = plot_h, 
    units = plot_u, bg = plot_bg)

plot4 <- function() {
        par(mfcol = c(2,2))
        
        # Top-left
        # Global Actve Power
        plot2()  #Sub Plot 2
        
        # Bottom-left
        # Energy sub metering
        plot3()  #Sub Plot 3

        #Top-right
        plot(gp.df$DateTime, gp.df$Voltage,
             ylab = "Voltage",
             xlab = "datetime",
             type = "l")        
        
        # Bottom-right
        # Sub Plot 4
        plot(gp.df$DateTime, gp.df$Global_reactive_power,
             ylab="Global reactive power",
             xlab="datetime",
             type="l")
}
plot4()

dev.off()
cat(fname, "saved in", basename(getwd()))