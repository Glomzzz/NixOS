{
  pkgs,
  config,
  username,
  ...
}: {
  home.packages = with pkgs; [
    microsoft-edge
    (pkgs.callPackage ./qq { })
    wechat-uos
  ];
  
}
