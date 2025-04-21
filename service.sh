#!/system/bin/sh
MODDIR=${0%/*}

for i in $(seq 1 10); do
    sleep 1
    echo "Trying to unmount /storage/emulated/0/Android/obb, attempt $i/10"
    umount /storage/emulated/0/Android/obb
    umount_output=$(umount /storage/emulated/0/Android/obb 2>&1)
    umount_success=$?
    
    # if is_mounted /storage/emulated/0/Android/obb; then
    #     sleep 1
    #     continue
    # else
    #     echo "- Unmount successfully"
    #     break
    # fi
    
    if [ $umount_success -ne 0 ]; then
        echo "- Unmount failed: $umount_output"
        echo "- Error code: $umount_success"
    else
        echo "- Unmount successfully"
    fi
done

if is_mounted /storage/emulated/0/Android/obb; then
    echo "Failed to unmount after 10 attempts"
fi
