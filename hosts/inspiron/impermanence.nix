{ lib, ... }:

{
  boot.initrd.postDeviceCommands = lib.mkAfter ''
    mkdir /btrfs_tmp
    mount /dev/root_vg/root /btrfs_tmp
    if [[ -e /btrfs_tmp/root ]]; then
        mkdir -p /btrfs_tmp/old_roots
        timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/root)" "+%Y-%m-%-d_%H:%M:%S")
        mv /btrfs_tmp/root "/btrfs_tmp/old_roots/$timestamp"
    fi

    delete_subvolume_recursively() {
        IFS=$'\n'
        for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
            delete_subvolume_recursively "/btrfs_tmp/$i"
        done
        btrfs subvolume delete "$1"
    }

    for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +7); do
        delete_subvolume_recursively "$i"
    done

    btrfs subvolume create /btrfs_tmp/root
    umount /btrfs_tmp
  '';

  fileSystems."/persist".neededForBoot = true;

  environment.persistence."/persist" = {
    directories = [
      {
        directory = "/etc/nixos";
        user = "raphael";
      }
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/libvirt"
      "/var/db/sudo"
      "/etc/NetworkManager/system-connections"
    ];
    files = [ "/etc/machine-id" ];

    users.raphael = {
      directories = [
        "Desktop"
        "Documents"
        "Downloads"
        "Music"
        "Pictures"
        "Public"
        "Templates"
        "Videos"
        "Development"
        "Virtual-Machines"
        ".ssh"
        ".mozilla"
        ".local/share/nvim"
        ".local/state/nvim"
        ".local/share/zinit"
        ".local/share/zoxide"
        ".local/state/lazygit"
        ".local/state/yazi"
        ".config/gopass"
        ".local/share/gopass"
      ];
      files = [ ".zsh_history" ];
    };
  };
}
