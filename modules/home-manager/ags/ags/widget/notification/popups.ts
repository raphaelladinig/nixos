import { type Notification } from "types/service/notifications";
import icons from "icons";

const notifications = await Service.import("notifications");

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

function notification(n: Notification) {
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

  return Widget.EventBox(
    {
      attribute: { id: n.id },
      on_primary_click: n.dismiss,
    },
    Widget.Box(
      {
        class_name: `notification ${n.urgency}`,
        vertical: true,
      },
      Widget.Box([icon, Widget.Box({ vertical: true }, title, body)]),
      actions,
    ),
  );
}

export default (monitor: number) => {
  const list = Widget.Box({
    vertical: true,
    children: notifications.popups.map(notification),
  });

  function onNotified(_: unknown, id: number) {
    const n = notifications.getNotification(id);
    if (n) list.children = [notification(n), ...list.children];
  }

  function onDismissed(_: unknown, id: number) {
    list.children.find((n) => n.attribute.id === id)?.destroy();
  }

  list
    .hook(notifications, onNotified, "notified")
    .hook(notifications, onDismissed, "dismissed");

  return Widget.Window({
    monitor,
    name: `notifications-${monitor}`,
    class_name: "notification-popups",
    anchor: ["top", "right"],
    child: Widget.Box({
      class_name: "notifications",
      vertical: true,
      child: list,
    }),
  });
};
