import { forMonitors } from "./lib/utils";
import "style/style";
import Bar from "./widget/bar/bar";
import Osi from "./widget/osi/osi";
import Notifications from "./widget/notifications/notifications";

App.config({
  windows: [
    ...forMonitors(Bar),
    ...forMonitors(Osi),
    ...forMonitors(Notifications),
  ],
});
