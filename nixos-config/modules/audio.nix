{ pkgs, ... }:
{
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    extraLadspaPackages = [ pkgs.rnnoise-plugin ];
	
	# Override PipeWire configuration to increase the buffer size
	extraConfig.pipewire."99-buffer-fix" = {
		"context.properties" = {
		"default.clock.min-quantum" = 512;
		};
	};
    # jack.enable = true;
  };
}
