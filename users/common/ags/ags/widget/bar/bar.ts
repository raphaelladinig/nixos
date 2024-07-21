import Workspaces from "./workspaces";
import Date from "./date";
import Network from "./network";
import Audio from "./audio";
import Microphone from "./microphone";
import Bluetooth from "./bluetooth";
import Battery from "./battery";

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
    children: [Bluetooth(), Network(), Microphone(), Audio(), Battery()],
  });
}

export default (monitor: number) => {
  return Widget.Window({
    monitor,
    class_name: "bar",
    name: `bar${monitor}`,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    layer: "top",
    child: Widget.CenterBox({
      start_widget: Left(),
      center_widget: Center(),
      end_widget: Right(),
    }),
  });
};
