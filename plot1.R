# PLOT1
#
#================================================
# DESCRIPTION

fname <- "plot1.png"
png(filename = fname, 
    width = plot_w, height = plot_h, 
    units = plot_u, bg = plot_bg)

plot1 <- function() {
        hist(gp.df$Global_active_power, 
             main = "Global Active Power", 
             xlab = "Global Active Power (kilowatts)",
             col = "red")
}
plot1()

dev.off()
cat(fname, "saved in", basename(getwd()))