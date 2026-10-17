#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

clear

echo
echo "===================================="
echo "         DOT_NIXOS INSTALL"
echo "===================================="
echo

echo "Beschikbare schijven:"
echo

lsblk -d -e 7,11 -o NAME,SIZE,MODEL

echo

read -rp "Selecteer schijf (bijv. sda of nvme0n1): " DISK_NAME

if [[ -z "${DISK_NAME}" ]]; then
    echo
    echo "Geen schijf geselecteerd."
    exit 1
fi

DISK="/dev/${DISK_NAME}"

if [[ ! -b "${DISK}" ]]; then
    echo
    echo "Schijf bestaat niet: ${DISK}"
    exit 1
fi

echo
echo "===================================="
echo " Geselecteerde schijf"
echo "===================================="
echo
echo "${DISK}"
echo

echo "WAARSCHUWING!"
echo
echo "Alle data op:"
echo "  ${DISK}"
echo
echo "wordt verwijderd."
echo

read -rp "Typ JA om verder te gaan: " CONFIRM

if [[ "${CONFIRM}" != "JA" ]]; then
    echo
    echo "Installatie afgebroken."
    exit 1
fi

echo

echo "===================================="
echo
echo "Schijf : ${DISK}"
echo "Layout : EFI + LUKS + BTRFS"
echo
echo "Subvolumes:"
echo "  @root"
echo "  @home"
echo "  @nix"
echo "  @log"
echo "  @snapshots"
echo

read -rp "Doorgaan met formatteren? (JA): " FINAL_CONFIRM

if [[ "${FINAL_CONFIRM}" != "JA" ]]; then
    echo
    echo "Installatie afgebroken."
    exit 1
fi

echo
echo "Start Disko."
echo

sudo DISK="${DISK}" nix \
  --extra-experimental-features "nix-command flakes" \
  run github:nix-community/disko/latest -- \
  --mode disko \
  "${REPO_ROOT}/disko/layouts/luks-btrfs.nix"

echo
echo "===================================="
echo " Host Selectie"
echo "===================================="
echo
echo "1) vm"
echo "2) laptop"
echo

read -rp "Kies host: " HOST_CHOICE

case "${HOST_CHOICE}" in
    1)
        HOST="vm"
        ;;
    2)
        HOST="laptop"
        ;;
    *)
        echo
        echo "Ongeldige host."
        exit 1
        ;;
esac

echo
echo "===================================="
echo " NixOS Installatie"
echo "===================================="
echo
echo "Host : ${HOST}"
echo

cd "${REPO_ROOT}"

sudo nixos-install \
  --root /mnt \
  --flake ".#${HOST}"

echo
echo "===================================="
echo " Installatie voltooid"
echo "===================================="
echo
echo "Host : ${HOST}"
echo "Disk : ${DISK}"
echo
echo "Voer nu uit:"
echo
echo "reboot"
echo

