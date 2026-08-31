{ system, inputs, ... }:
let
  cursor = "miku-cat";
in
{
  home.pointerCursor = {
    enable = true;
    size = 32;
    name = cursor;
    package = inputs.adrien5902s-hyprcursors.packages.${system}.${cursor};

    hyprcursor = {
      enable = true;
    };
  };
}

