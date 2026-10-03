#!/usr/bin/env bash

set -euo pipefail

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

export DISK

echo
echo "Configuratie gevalideerd."
echo
echo "Klaar voor Disko."
echo

sudo nix --extra-experimental-features "nix-command flakes" \
run github:nix-community/disko/latest -- \
--mode disko \
./disko/layouts/luks-btrfs.nix
