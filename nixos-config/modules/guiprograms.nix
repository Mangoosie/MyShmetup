{ ... }:
{
  programs.firefox.enable = true;
  programs.steam.enable = true;

  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "mangoose" ];
  };
}
