import { forMonitors } from "./lib/utils";
import "styles/styles";
import Bar from "./widgets/bar/bar";
import Osi from "./widgets/osi/osi";
// import Notifications from "./widgets/notifications/NotificationPopups";
import Notifications from "./widgets/notifications/notifications";

App.config({
  windows: [...forMonitors(Bar), ...forMonitors(Osi), ...forMonitors(Notifications)],
});
