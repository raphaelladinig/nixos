import Workspaces from "./modules/Workspaces";
import Date from "./modules/Date";
import System from "./modules/System";
import Battery from "./modules/Battery";

function Left() {
  return Widget.Box({
    hpack: "start",
    children: [Workspaces()],
  });
}

function Center() {
  return Widget.Box({
    hpack: "center",
    children: [Date()],
  });
}

function Right() {
  return Widget.Box({
    hpack: "end",
    children: [System(), Battery()],
  });
}

export default (monitor: number) => {
  return Widget.Window({
    monitor,
    class_name: "bar",
    name: `bar-${monitor}`,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
      start_widget: Left(),
      center_widget: Center(),
      end_widget: Right(),
    }),
  });
}
