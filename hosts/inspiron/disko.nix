{
  disko.devices = {
    disk = {
      main = {
        device = "/dev/disk/by-id/nvme-CT1000P1SSD8_20452B5DC42B";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            esp = {
              name = "esp";
              type = "EF00";
              size = "512M";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            swap = {
              name = "swap";
              size = "32G";
              content = {
                type = "swap";
              };
            };
            root = {
              name = "root";
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
          };
        };
      };
    };
  };
}
