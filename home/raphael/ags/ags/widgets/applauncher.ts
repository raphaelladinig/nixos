import { type Application } from "types/service/applications";
import { icon } from "lib/utils";

const applications = await Service.import("applications");
const windowName = "applauncher";

const appItem = (app: Application) =>
  Widget.Button({
    class_name: "appItem",
    on_clicked: () => {
      App.closeWindow(windowName);
      app.launch();
    },
    attribute: { app },
    child: Widget.Box({
      children: [
        Widget.Icon({
          class_name: "icon",
          icon: icon(app.icon_name, "application-x-executable"),
        }),
        Widget.Label({
          class_name: "title",
          label: app.name,
          xalign: 0,
          vpack: "center",
          truncate: "end",
        }),
      ],
    }),
  });

export default () => {
  let currentApplications = applications.query("").map(appItem);

  const list = Widget.Box({
    class_name: "list",
    vertical: true,
    children: currentApplications,
  });

  function repopulate() {
    currentApplications = applications.query("").map(appItem);
    list.children = currentApplications;
  }

  const search = Widget.Entry({
    class_name: "search",
    hexpand: true,

    on_accept: () => {
      const results = currentApplications.filter((item) => item.visible);
      if (results[0]) {
        App.toggleWindow(windowName);
        results[0].attribute.app.launch();
      }
    },

    on_change: ({ text }) =>
      currentApplications.forEach((item) => {
        item.visible = item.attribute.app.match(text ?? "");
      }),
  });

  return Widget.Window({
    name: windowName,
    setup: (self) =>
      self.keybind("Escape", () => {
        App.closeWindow(windowName);
      }),
    visible: false,
    keymode: "exclusive",
    child: Widget.Box({
      class_name: "applauncher",
      vertical: true,
      children: [
        search,

        Widget.Scrollable({
          class_name: "scrollable",
          hscroll: "never",
          child: list,
        }),
      ],
      setup: (self) =>
        self.hook(App, (_, windowName, visible) => {
          if (windowName !== windowName) return;

          if (visible) {
            repopulate();
            search.text = "";
            search.grab_focus();
          }
        }),
    }),
  });
};
