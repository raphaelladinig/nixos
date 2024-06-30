async function resetCss() {
  try {
    const scss = `${TMP}/main.scss`;
    const css = `${TMP}/main.css`;

    Utils.exec(`sassc ${scss} ${css}`);

    App.applyCss(css, true);
  } catch (error) {
    error instanceof Error ? logError(error) : console.error(error);
  }
}

await resetCss();
