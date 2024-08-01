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

    for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +1); do
        delete_subvolume_recursively "$i"
    done

    btrfs subvolume create /btrfs_tmp/root
    umount /btrfs_tmp
  '';

  fileSystems."/persist".neededForBoot = true;

  users.users = {
    root.hashedPasswordFile = "/persist/passwords/root";
    raphael.hashedPasswordFile = "/persist/passwords/raphael/";
  };

  environment.persistence."/persist/system" = {
    directories = [
      "/var/lib/bluetooth"
      "/var/lib/libvirt"
      "/etc/NetworkManager/system-connections"
    ];

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
        "Notes"
        "Development"
        "Virtual-Machines"
        ".ssh"
        ".mozilla"
        ".config/gopass"
        ".local/share/gopass"
        ".local/share/nvim"
        ".local/share/zoxide"
        ".local/state/lazygit"
      ];

      files = [ ".zsh_history" ];
    };
  };
}
