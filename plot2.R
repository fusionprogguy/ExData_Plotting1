# PLOT2
#
#================================================
# DESCRIPTION

fname <- "plot2.png"
png(filename = fname, 
    width = plot_w, height = plot_h, 
    units = plot_u, bg = plot_bg)

plot2 <- function() {
        plot(gp.df$DateTime,
             gp.df$Global_active_power,
             main = "",
             ylab="Global Active Power (kilowatts)",
             xlab="",
             type="l")
}
plot2()

dev.off()
cat(fname, "saved in", basename(getwd()))