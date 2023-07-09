#!/bin/bash

# Disable unnecessary services using systemctl command

systemctl disable bluetooth.service # Disable Bluetooth service 
systemctl disable cups.service # Disable Common Unix Printing System service 
systemctl disable avahi-daemon.service # Disable Avahi mDNS/DNS-SD service 

# Enforce password policies using pam_cracklib module

echo "password requisite pam_cracklib.so retry=3 minlen=8 difok=3 ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-1" >> /etc/pam.d/common-password # Add the following line to /etc/pam.d/common-password file
# This line enforces the following password policies:
# - retry=3: The user can try to enter the password 3 times before the authentication fails
# - minlen=8: The minimum length of the password is 8 characters
# - difok=3: The password must differ from the old one by at least 3 characters
# - ucredit=-1: The password must contain at least one uppercase letter
# - lcredit=-1: The password must contain at least one lowercase letter
# - dcredit=-1: The password must contain at least one digit
# - ocredit=-1: The password must contain at least one special character

# Configure firewall rules using ufw command

ufw default deny incoming # Deny all incoming connections by default
ufw default allow outgoing # Allow all outgoing connections by default
ufw allow 22/tcp # Allow SSH connections on port 22
ufw allow 80/tcp # Allow HTTP connections on port 80
ufw allow 443/tcp # Allow HTTPS connections on port 443
ufw enable # Enable the firewall
