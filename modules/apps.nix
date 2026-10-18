{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    
    # Utilities
    qalculator		# calculator
    zathura			# A highly customizable and functional PDF viewer
    calibre			# an ebook library manager
    
    # Network
    nmap		# a utility for network exploration

    # Browsers e.d.
    firefox			# Web Browser 
    qutebrowser		# Vim-like browser based on Qt6
    syncthing		# File Synchronisation

    # Hardware
    iotop			# Python program shows which process is the I/O going on.
    lshw			# a small tool for informaton on the hardware configuration
    nvme-cli		# NVM Express user space tools
    mtools 			# Utilities to acces MS-DOS disks
	ntfs3g			# FUSE-based NTFS driver with full write support

    # Passwordmanagers
    keepassxc		# Qt5-based Password Manager 
    bitwarden		# Password manager
    
    # Media
    cheese			# Webcam Booth for GNOME
    grim			# Wayland compositor image grabber 
    slurp			# Wayland region selector
    mpv				# Multimedia player 
    celluloid		# Simple GTK+ frontend for MPV 
    pinta			# Image editing application
    swayimg			# Picture viewer
   
    # Office
    abiword			# Multiplatform Word Processor
    gnumeric		# Spreadsheet Application
    
    #Editors
	geany			# a text editor using the GTK+ toolkit
	vim				# Compatible version of the UNIX editor vi
	
	#Terminal
	fastfetch		# tool for fetching system information
    speedtest-cli	# Command line interface for testing internet bandwidth
	yt-dlp			# command-line program to retrieve videos from video sites
    git				# Fast, scalable, distributed revision control system
    wget			# Tool for Mirroring FTP and HTTP Servers
    tree			# File listing as a tree	
    jq				# A lightweight and flexible command-line JSON processor
    mc				# user shell much like Norton Commander with text-mode full-screen interface
  ];
}
