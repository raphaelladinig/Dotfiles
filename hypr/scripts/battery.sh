 #!/bin/sh

 notify-send "$(acpi -b | awk -F'[,:%]' '{print "Battery level: " $2 $3"%"}')"
