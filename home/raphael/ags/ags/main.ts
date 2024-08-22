import { forMonitors } from "./lib/utils";
import { applyScss } from "./style/style";
import Bar from "./widgets/bar/bar";
import NotificationPopups from "./widgets/notifications/notificationPopups";
import Applauncher from "./widgets/applauncher";

App.config({
  windows: [
    ...forMonitors(Bar),
    ...forMonitors(NotificationPopups),
    Applauncher(),
  ],
});

Utils.monitorFile(`${App.configDir}/style`, applyScss);
await applyScss();
