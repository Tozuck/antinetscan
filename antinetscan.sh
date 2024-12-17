#!/bin/bash

# Script to block all Cloudflare IP ranges using iptables (IPv4) and ip6tables (IPv6)

# Cloudflare IPv4 ranges
CLOUDFLARE_IPV4=(
    "173.245.48.0/20"
    "103.21.244.0/22"
    "103.22.200.0/22"
    "103.31.4.0/22"
    "141.101.64.0/18"
    "108.162.192.0/18"
    "190.93.240.0/20"
    "188.114.96.0/20"
    "197.234.240.0/22"
    "198.41.128.0/17"
    "162.158.0.0/15"
    "104.16.0.0/13"
    "104.24.0.0/14"
    "172.64.0.0/13"
    "131.0.72.0/22"
)

# Cloudflare IPv6 ranges
CLOUDFLARE_IPV6=(
    "2400:cb00::/32"
    "2606:4700::/32"
    "2803:f800::/32"
    "2405:b500::/32"
    "2405:8100::/32"
    "2a06:98c0::/29"
    "2c0f:f248::/32"
)

# Function to block IPv4 ranges
block_ipv4() {
    echo "[+] Blocking Cloudflare IPv4 ranges..."
    for ip in "${CLOUDFLARE_IPV4[@]}"; do
        iptables -A INPUT -s "$ip" -j DROP
        echo "Blocked IPv4: $ip"
    done
}

# Function to block IPv6 ranges
block_ipv6() {
    echo "[+] Blocking Cloudflare IPv6 ranges..."
    for ip in "${CLOUDFLARE_IPV6[@]}"; do
        ip6tables -A INPUT -s "$ip" -j DROP
        echo "Blocked IPv6: $ip"
    done
}

# Main execution
echo "Starting to block all Cloudflare IP ranges..."

# Block IPv4 and IPv6 ranges
block_ipv4
block_ipv6

echo "All Cloudflare IP ranges have been successfully blocked."
