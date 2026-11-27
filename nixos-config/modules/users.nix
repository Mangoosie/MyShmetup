{ pkgs, ... }:
{
  users.users.mangoose = {
    isNormalUser = true;
    description = "Mangoose";
    extraGroups = [ "networkmanager" "wheel" "kvm" ];
    packages = with pkgs; [
      kdePackages.kate
      # thunderbird
    ];
  };
}
