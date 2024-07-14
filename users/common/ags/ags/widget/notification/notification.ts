import { type Notification } from "types/service/notifications";
import { wrap } from "lib/utils";
import icons from "icons";
import options from "options";

function notificationIcon({ app_entry, app_icon, image }: Notification) {
  if (image) {
    return Widget.Box({
      css:
        `background-image: url("${image}");` +
        "background-size: contain;" +
        "background-repeat: no-repeat;" +
        "background-position: center;",
    });
  }

  let icon = icons.fallback.notification;
  if (Utils.lookUpIcon(app_icon)) icon = app_icon;
  if (app_entry && Utils.lookUpIcon(app_entry)) icon = app_entry;

  return Widget.Box({
    child: Widget.Icon(icon),
  });
}

export default (n: Notification) => {
  const icon = Widget.Box({
    class_name: "icon",
    vpack: "start",
    children: [notificationIcon(n)],
  });

  const title = Widget.Label({
    class_name: "title",
    label: n.summary,
    xalign: 0,
    justification: "left",
    use_markup: true,
    truncate: "end",
  });

  const body = Widget.Label({
    class_name: "body",
    label: wrap(n.body, options.notifications.wrap), // HACK: better than ags wrap
    xalign: 0,
    justification: "left",
    use_markup: true,
  });

  const actions = Widget.Box({
    class_name: "actions",
    children: n.actions.map(({ id, label }) =>
      Widget.Button({
        class_name: "action-button",
        hexpand: true,
        on_clicked: () => {
          n.invoke(id);
          n.dismiss();
        },
        child: Widget.Label(label),
      }),
    ),
  });

  return Widget.EventBox({
    on_primary_click: n.dismiss,
    attribute: { id: n.id },
    child: Widget.Box(
      {
        class_name: `notification ${n.urgency}`,
        css: `min-width: ${options.notifications.width};`,
        vertical: true,
      },
      Widget.Box([icon, Widget.Box({ vertical: true }, title, body)]),
      actions,
    ),
  });
};
