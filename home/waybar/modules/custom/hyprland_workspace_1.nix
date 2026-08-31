{
  exec = "hyprctl monitors -j | jq .[1].activeWorkspace.id";
  interval = 1;
}
