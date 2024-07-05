import { forMonitors } from "./lib/utils";
import "style/style";
import Bar from "./widget/bar/bar";
import NotificationPopups from "./widget/notification/popups";

App.config({
  windows: [...forMonitors(Bar), ...forMonitors(NotificationPopups)],
});
