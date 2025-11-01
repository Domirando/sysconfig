{
  outputs,
  config,
  pkgs,
  lib,
  ...
}: let
  modules = [
    outputs.homeModules.vim
    outputs.homeModules.packages
    outputs.homeModules.zsh
    outputs.homeModules.git
    outputs.homeModules.bash
    outputs.homeModules.zellij
    outputs.homeModules.starship
  ];

  cfg = {
    xresources.properties = {
      # dark theme for Xaw       # applies to:
      "*Background" = "black"; # *background, *pointerColorBackground
      "*Foreground" = "gray90"; # *foreground, *pointerColor, *StripChart.highlight
      "*Color" = "gray90"; # *AsciiSink.cursorColor
      "*BorderColor" = "gray90"; # *borderColor, *Paned.internalBorderColor
      "*ShadowColor" = "gray90"; # *Panner.shadowColor
      "*StripChart.highlight" = "gray50"; # looks better this way

      # make Xaw scrollbars easier to use
      "*Scrollbar.translations" = ''
        #replace \n\
        <Btn1Down>  : StartScroll(Continuous) MoveThumb() NotifyThumb() \n\
        <Btn1Motion>: MoveThumb() NotifyThumb() \n\
        <Btn4Down>  : StartScroll(Backward) \n\
        <Btn5Down>  : StartScroll(Forward) \n\
        <BtnUp>     : NotifyScroll(FullLength) EndScroll()'';
    };

    nixpkgs.config.allowUnfree = true;
    home = {
      stateVersion = "25.05";
      username = "domirando";
      homeDirectory = "/home/domirando";
      enableNixpkgsReleaseCheck = false;
      preferXdgDirectories = true;
    };
    programs.home-manager.enable = true;
  };
in {
  imports = modules;
  config = cfg;
}
