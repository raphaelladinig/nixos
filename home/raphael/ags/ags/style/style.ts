import options from "options";

const variables = () => {
  let vars: string[] = [];
  for (let key in options.theme) {
    vars.push(`$${key}: ${options.theme[key]};`);
  }
  return vars;
};

export async function applyScss() {
  try {
    const scss = `/tmp/ags/main.scss`;
    const vars = `/tmp/ags/vars.scss`;
    const css = `/tmp/ags/main.css`;
    const fd = Utils.exec(`fd ".scss" ${App.configDir}/style`);
    const files = fd.split(/\s+/);
    const imports = [vars, ...files].map((f) => `@import '${f}';`);

    await Utils.writeFile(variables().join("\n"), vars);
    await Utils.writeFile(imports.join("\n"), scss);
    Utils.exec(`sassc ${scss} ${css}`);

    App.resetCss();
    App.applyCss(css);
  } catch (e) {
    console.error(e);
  }
}
