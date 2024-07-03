import { forMonitors } from "./lib/utils";
import Bar from "./widgets/bar/bar";
import "styles/styles";

App.config({
  windows: [...forMonitors(Bar)],
});
