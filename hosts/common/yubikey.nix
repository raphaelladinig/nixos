{ pkgs, ... }:
{
  services = {
    pcscd.enable = true;
    udev.packages = [ pkgs.yubikey-personalization ];
    yubikey-agent.enable = true;
  };

  environment.systemPackages = with pkgs; [
    yubikey-manager
    yubikey-personalization
    age-plugin-yubikey
    pam_u2f
  ];
}
