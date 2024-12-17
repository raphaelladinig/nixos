{
  disko.devices = {
    disk.main = {
      device = "/dev/disk/by-id/nvme-CT1000P1SSD8_20452B5DC42B";
      type = "disk";
      content = {
        type = "gpt";
        partitions = {
          esp = {
            name = "ESP";
            size = "512M";
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
              name = "crypted";
              settings = {
                keyFile = "/tmp/disk.key";
                crypttabExtraOpts = [
                  "fido2-device=auto"
                  "token-timeout=10"
                ];
              };
              content = {
                type = "lvm_pv";
                vg = "root_vg";
              };
            };
          };
        };
      };
    };
    lvm_vg = {
      root_vg = {
        type = "lvm_vg";
        lvs = {
          root = {
            size = "100%FREE";
            content = {
              type = "btrfs";
              extraArgs = [ "-f" ];
              subvolumes = {
                "/root" = {
                  mountpoint = "/";
                };
                "/persist" = {
                  mountOptions = [
                    "subvol=persist"
                    "noatime"
                  ];
                  mountpoint = "/persist";
                };
                "/nix" = {
                  mountOptions = [
                    "subvol=nix"
                    "noatime"
                  ];
                  mountpoint = "/nix";
                };
                "/swap" = {
                  mountpoint = "/.swapvol";
                  swap.swapfile.size = "32G";
                };
              };
            };
          };
        };
      };
    };
  };
}
