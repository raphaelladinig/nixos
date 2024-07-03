import { forMonitors } from "./lib/utils";
import Bar from "./widgets/Bar/Bar";

const scss = `${App.configDir}/styles/main.scss`;
const css = `/tmp/ags.css`;
Utils.exec(`sassc ${scss} ${css}`);
App.applyCss(css);

App.config({
  windows: [...forMonitors(Bar)],
});
