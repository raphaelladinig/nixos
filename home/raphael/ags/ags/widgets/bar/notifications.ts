const notifications = await Service.import("notifications");

export default () => {
  return Widget.Box({
    class_name: "notifications",
    children: [
      Widget.Icon().hook(notifications, (self) => {
        if (notifications.dnd) {
          self.icon = "notification-disabled-symbolic";
        } else {
          self.icon = "notification-symbolic";
        }
      }),
    ],
  });
};
