export default (monitor: number) => {
  return Widget.Window({
    monitor,
    class_name: "osi",
    name: `osi-${monitor}`,
    anchor: ["top", "left", "right", "bottom"],
    layer: "overlay",
    click_through: true,
    child: Widget.Overlay({}),
  });
};
