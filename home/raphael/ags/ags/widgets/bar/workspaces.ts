const hyprland = await Service.import("hyprland");
import { range } from "lib/utils";

export default () => {
  const workspaces = range(10);

  return Widget.Box({
    class_name: "workspaces",
    children: workspaces.map((id) =>
      Widget.Label({
        vpack: "center",
        label: ``,
        setup: (self) =>
          self.hook(hyprland, () => {
            self.toggleClassName("active", hyprland.active.workspace.id === id);
            self.toggleClassName(
              "occupied",
              (hyprland.getWorkspace(id)?.windows || 0) > 0,
            );
          }),
      }),
    ),
  });
};
