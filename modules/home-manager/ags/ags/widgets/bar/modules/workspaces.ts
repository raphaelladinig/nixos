const hyprland = await Service.import("hyprland");
import options from "options";

export default () => {
  const workspaces = Array.from({ length: options.bar.workspaces }, (_, i) => i + 1); 

  return Widget.Box({
    class_name: "workspaces",
    children: workspaces.map((id) =>
      Widget.Label({
        vpack: "center",
        label: `${id}`,
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
