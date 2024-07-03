import { forMonitors } from "./lib/utils";
import Bar from "./widgets/Bar/Bar";
import "styles/styles";

App.config({
  windows: [...forMonitors(Bar)],
});
