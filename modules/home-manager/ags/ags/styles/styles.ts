import options from "options";

const variables = () => [`$bg: ${options.theme.bg}`];

async function applyScss() {
  try {
    console.log("Applying SCSS...");

    const scss = `/tmp/ags/main.scss`;
    const vars = `/tmp/ags/vars.scss`;
    const css = `/tmp/ags/main.css`;
    const fd = Utils.exec(`fd ".scss" ${App.configDir}/styles`);
    const files = fd.split(/\s+/);
    const imports = [vars, ...files].map((f) => `@import '${f}';`);

    await Utils.writeFile(variables().join("\n"), vars);
    await Utils.writeFile(imports.join("\n"), scss);
    Utils.exec(`sassc ${scss} ${css}`);

    App.resetCss();
    App.applyCss(css);
  } catch (error) {
    error instanceof Error ? logError(error) : console.error(error);
  }
}

Utils.monitorFile(`${App.configDir}/styles`, applyScss);
applyScss();
