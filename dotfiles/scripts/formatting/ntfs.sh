#!/usr/bin/env bash

echo "Beschikbare schijven:"
lsblk -d -o NAME,SIZE,MODEL

echo ""
read -p "Welke schijf wil je formatteren? (bijv. sdb, nvme1n1): " disk
dev="/dev/$disk"

echo ""
echo "Je hebt gekozen voor: $dev"

# Mogelijke systeemschijven detecteren
if [[ "$disk" == "sda" || "$disk" == nvme0n1 || "$disk" == vda ]]; then
    echo ""
    echo "⚠️ WAARSCHUWING: $dev lijkt een systeemschijf te zijn!"
    echo "Formatteren hiervan wist je hele OS."
    read -p "Weet je 100% zeker dat je deze schijf wilt formatteren? (ja/nee): " sysconfirm
    if [[ "$sysconfirm" != "ja" ]]; then
        echo "Geannuleerd."
        exit 1
    fi
fi

echo ""
echo "Je staat op het punt ALLES op $dev te verwijderen."
read -p "Bevestig opnieuw (ja/nee): " confirm

if [[ "$confirm" != "ja" ]]; then
    echo "Geannuleerd."
    exit 1
fi

echo ""
echo "Ontkoppelen van eventuele partities..."
sudo umount ${dev}* 2>/dev/null

echo "Nieuwe partitietabel maken..."
sudo parted $dev mklabel msdos

echo "Nieuwe NTFS-partitie maken..."
sudo parted -a optimal $dev mkpart primary ntfs 0% 100%

echo "Formatteren naar NTFS..."
sudo mkfs.ntfs -f ${dev}1

echo ""
echo "Klaar! $dev is nu één NTFS-partitie."

