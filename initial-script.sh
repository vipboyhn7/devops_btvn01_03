#!/bin/bash

# 1. Cập nhật hệ thống
sudo apt-get update && sudo apt-get upgrade -y

# 2. Cài đặt các gói phần mềm bắt buộc
sudo apt-get install -y openjdk-17-jdk git curl

# 3. Kiểm tra sự tồn tại của group quickbite, nếu chưa có thì tạo mới
if ! getent group quickbite > /dev/null 2>&1; then
    sudo groupadd quickbite
    echo "Đã tạo group quickbite."
else
    echo "Group quickbite đã tồn tại."
fi

# 4. Tạo system user quickbite thuộc nhóm quickbite, không tạo home (-r), khóa login (/bin/false)
if ! id -u quickbite > /dev/null 2>&1; then
    sudo useradd -r -g quickbite -s /bin/false quickbite
    echo "Đã tạo system user quickbite."
else
    echo "User quickbite đã tồn tại."
fi
