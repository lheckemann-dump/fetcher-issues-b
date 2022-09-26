{ path ? builtins.fetchGit {
  url = https://git.openwrt.org/openwrt/openwrt.git;
  rev = "8010d3da0376f68dd3724c30db0c4c9c513e5376";
},
  runCommandNoCC
}: runCommandNoCC "test" { output = builtins.toJSON (builtins.readDir "${path}"); } ''
  echo $output > $out
''
