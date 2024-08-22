import { type Notification } from "types/service/notifications";
import { icon } from "lib/utils";
import options from "options";
import Pango from "gi://Pango?version=1.0";

export default (n: Notification) => {
  const title = Widget.Label({
    class_name: "title",
    xalign: 0,
    justification: "left",
    max_width_chars: options.notifications.max_width_chars,
    truncate: "end",
    label: n.summary,
    use_markup: true,
  });

  const body = Widget.Label({
    class_name: "body",
    xalign: 0,
    justification: "left",
    max_width_chars: options.notifications.max_width_chars * 1.5,
    wrapMode: Pango.WrapMode.WORD_CHAR,
    use_markup: true,
    label: n.body,
    wrap: true,
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
        vertical: true,
      },
      Widget.Box([
        Widget.Icon({
          class_name: "icon",
          icon: icon(n.app_icon, "dialog-information-symbolic"),
          vpack: "start",
        }),

        Widget.Box({ vertical: true }, title, body),
      ]),
      actions,
    ),
  });
};
