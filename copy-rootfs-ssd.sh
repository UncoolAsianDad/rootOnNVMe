#!/bin/bash
# Mount the SSD as /mnt
# Check if the device exists
if [ ! -e /dev/nvme0n1p1 ]; then
	    echo "Error: /dev/nvme0n1p1 does not exist."
	        exit 1
fi
sudo mount /dev/nvme0n1p1 /mnt
# Copy over the rootfs from the SD card to the SSD
sudo rsync -axHAWX --numeric-ids --info=progress2 --exclude={"/dev/","/proc/","/sys/","/tmp/","/run/","/mnt/","/media/*","/lost+found"} / /mnt
# We want to keep the SSD mounted for further operations
# So we do not unmount the SSD
