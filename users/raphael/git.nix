{
  programs.git = {
    enable = true;
    userName = "Raphael Ladinig";
    userEmail = "raphaelladinig07@gmail.com";
    extraConfig = {
      pull = {
        rebase = false;
      };
    };
  };
}
