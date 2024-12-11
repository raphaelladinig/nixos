import Notification from "./notification";
import options from "options";

const notifications = await Service.import("notifications");
notifications.popupTimeout = options.notifications.popupTimeout;

const transition = 100;
const { timeout, idle } = Utils;

function popup(id: number) {
  const n = notifications.getNotification(id)!;

  const widget = Notification(n);

  const inner = Widget.Revealer({
    transition: "slide_left",
    transition_duration: transition,
    child: widget,
  });

  const outer = Widget.Revealer({
    transition: "slide_down",
    transition_duration: transition,
    child: inner,
  });

  const box = Widget.Box({
    hpack: "end",
    child: outer,
  });

  idle(() => {
    outer.reveal_child = true;
    timeout(transition, () => {
      inner.reveal_child = true;
    });
  });

  return Object.assign(box, {
    dismiss() {
      inner.reveal_child = false;
      timeout(transition, () => {
        outer.reveal_child = false;
        timeout(transition, () => {
          box.destroy();
        });
      });
    },
  });
}

export default () => {
  const map: Map<number, ReturnType<typeof popup>> = new Map();

  const list = Widget.Box({
    class_name: "notificationsList",
    vertical: true,
  });

  function remove(_: unknown, id: number) {
    map.get(id)?.dismiss();
    map.delete(id);
  }

  list
    .hook(
      notifications,
      (_: unknown, id: number) => {
        if (id !== undefined) {
          if (map.has(id)) remove(null, id);

          if (notifications.dnd) return;

          const w = popup(id);

          map.set(id, w);
          list.children = [w, ...list.children];
        }
      },
      "notified",
    )
    .hook(notifications, remove, "dismissed");

  return list;
};
