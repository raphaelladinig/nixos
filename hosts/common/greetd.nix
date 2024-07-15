{ pkgs, environment ? "bash", ... }:

{
  environment.systemPackages = with pkgs; [
    greetd.greetd
  ];

  services.libinput.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd ${environment}";
      };
    };
  };

  environment.etc."greetd/environments".text = ''
    bash
  '';

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
