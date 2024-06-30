import { forMonitors } from "./lib/utils";
import "styles/style";
import Bar from "./widgets/Bar/Bar";

App.config({
  style: css,
  windows: [...forMonitors(Bar)],
});
