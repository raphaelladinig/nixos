import Notification from "./notification";

const notifications = await Service.import("notifications");

export default (monitor: number) => {
  const list = Widget.Box({
    vertical: true,
    children: notifications.popups.map(Notification),
  });

  function onNotified(_: unknown, id: number) {
    const n = notifications.getNotification(id);
    if (n) list.children = [Notification(n), ...list.children];
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
