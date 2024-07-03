import { forMonitors } from "./lib/utils";
import Bar from "./widgets/Bar/Bar";

const scss = `${App.configDir}/styles/main.scss`;
const css = `/tmp/ags.css`;

Utils.monitorFile(
  `${App.configDir}/styles`,

  function () {
    Utils.exec(`sassc ${scss} ${css}`);
    App.resetCss();
    App.applyCss(css);
  },
);

App.config({
  style: css,
  windows: [...forMonitors(Bar)],
});
