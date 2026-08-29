hostname = io.popen("uname -n"):read("*l")
is_laptop = hostname == "unowhynotarch"
is_desktop = hostname == "archrien"
