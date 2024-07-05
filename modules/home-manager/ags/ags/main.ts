import { forMonitors } from "./lib/utils";
import "style/style";
import Bar from "./widget/bar/bar";
import Notifications from "./widget/notifications/notifications";

App.config({
  windows: [
    ...forMonitors(Bar),
    // ...forMonitors(Notifications),
  ],
});
