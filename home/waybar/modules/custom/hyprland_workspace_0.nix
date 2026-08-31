{
  exec = "hyprctl monitors -j | jq .[0].activeWorkspace.id";
  interval = 1;
}
