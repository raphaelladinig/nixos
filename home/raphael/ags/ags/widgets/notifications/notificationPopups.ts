import NotificationList from "./notificationsList";

export default (monitor: number) => {
  return Widget.Window({
    monitor,
    name: `notificationPopups-${monitor}`,
    class_name: "notificationPopups",
    anchor: ["top", "right"],
    child: Widget.Box({
      css: "min-width: 1px; min-height: 1px;",
      vertical: true,
      child: NotificationList(),
    }),
  });
};
