{ ... }:
{
users.users.mangoose.linger = true;
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
}
