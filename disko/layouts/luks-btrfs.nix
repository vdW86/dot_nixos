{
  disko.devices = {
    disk.main = {
      device = builtins.getEnv "DISK";

      type = "disk";

      content = {
        type = "gpt";

        partitions = {

          ESP = {
            size = "1G";
            type = "EF00";

            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
            };
          };

          luks = {
            size = "100%";

            content = {
              type = "luks";

              name = "cryptroot";

              content = {
                type = "btrfs";

                extraArgs = [ "-f" ];

                subvolumes = {

                  "@root" = {
                    mountpoint = "/";
                  };

                  "@home" = {
                    mountpoint = "/home";
                  };

                  "@nix" = {
                    mountpoint = "/nix";
                  };

                  "@log" = {
                    mountpoint = "/var/log";
                  };

                  "@snapshots" = {
                    mountpoint = "/.snapshots";
                  };

                };
              };
            };
          };
        };
      };
    };
  };
}
