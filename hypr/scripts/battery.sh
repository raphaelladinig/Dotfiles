 #!/bin/sh

 notify-send "$(acpi -b | awk -F'[,:%]' '{print $2 $3"%"}')"
