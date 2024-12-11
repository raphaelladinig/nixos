import Workspaces from "./workspaces";
import Date from "./date";
import Notifications from "./notifications";
import Network from "./network";
import Speakers from "./speakers";
import Microphone from "./microphone";
import Bluetooth from "./bluetooth";
import Battery from "./battery";

export default (monitor: number) => {
  const left = Widget.Button({
    class_name: "left",
    hpack: "start",
    child: Widget.Box([Workspaces()]),
  });

  const middle = Widget.Button({
    class_name: "middle",
    hpack: "center",
    child: Widget.Box([Date()]),
  });

  const right = Widget.Button({
    class_name: "right",
    hpack: "end",
    child: Widget.Box([
      Notifications(),
      Bluetooth(),
      Network(),
      Microphone(),
      Speakers(),
      Battery(),
    ]),
  });

  return Widget.Window({
    monitor,
    class_name: "bar",
    name: `bar-${monitor}`,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
      start_widget: left,
      center_widget: middle,
      end_widget: right,
    }),
  });
};
