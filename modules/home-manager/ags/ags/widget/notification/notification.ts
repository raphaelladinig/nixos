import { type Notification } from "types/service/notifications";
import icons from "icons";

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
    wrap: true,
    truncate: "end",
    max_width_chars: 24,
  });

  const body = Widget.Label({
    class_name: "body",
    label: n.body,
    xalign: 0,
    justification: "left",
    use_markup: true,
    wrap: true,
    max_width_chars: 24,
  });

  const actions = Widget.Box({
    class_name: "actions",
    children: n.actions.map(({ id, label }) =>
      Widget.Button({
        class_name: "action-button",
        on_clicked: () => {
          n.invoke(id);
          n.dismiss();
        },
        child: Widget.Label(label),
      }),
    ),
  });

  return Widget.Box({
    attribute: { id: n.id },
    hpack: "end",
    class_name: `notification ${n.urgency}`,
    child: Widget.EventBox({
      on_primary_click: n.dismiss,
      child: Widget.Box(
        {
          vertical: true,
        },
        Widget.Box([icon, Widget.Box({ vertical: true }, title, body)]),
        actions,
      ),
    }),
  });
}
