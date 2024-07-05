import Workspaces from "./modules/workspaces";
import Date from "./modules/date";
import System from "./modules/system";
import Battery from "./modules/battery";

function Left() {
  return Widget.Box({
    hpack: "start",
    children: [
      Workspaces(),
    ],
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
};
