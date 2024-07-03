const hyprland = await Service.import("hyprland");

export default () => {
  const workspaces = hyprland.bind("workspaces").as((ws) =>
    ws.map(({ id }) =>
      Widget.Label({
        vpack: "center",
        label: `${id}`,
        setup: (self) =>
          self.hook(hyprland, () => {
            self.toggleClassName(
              "active",
              hyprland.active.workspace.id === id,
            );
            self.toggleClassName(
              "occupied",
              (hyprland.getWorkspace(id)?.windows || 0) > 0,
            );
          }),
      }),
    ),
  );

  return Widget.Box({
    class_name: "workspaces",
    children: workspaces,
  });
};
