import Progress from "./progress";
import options from "options";
import icons from "icons";
import { icon } from "lib/utils";

const audio = await Service.import("audio");
const delay = options.osi.delay;

function progress() {
  const indicator = Widget.Icon({
    size: 42,
    vpack: "start",
  });
  const progress = Progress({
    vertical: true,
    width: 42,
    height: 300,
    child: indicator,
  });

  const revealer = Widget.Revealer({
    transition: "slide_left",
    child: progress,
  });

  let count = 0;
  function show(value: number, icon: string) {
    revealer.reveal_child = true;
    indicator.icon = icon;
    progress.setValue(value);
    count++;
    Utils.timeout(delay, () => {
      count--;

      if (count === 0) revealer.reveal_child = false;
    });
  }

  return revealer.hook(
    audio.speaker,
    () =>
      show(
        audio.speaker.volume,
        icon(audio.speaker.icon_name || "", icons.audio.type.speaker),
      ),
    "notify::volume",
  );
}

function microphone() {
  const icon = Widget.Icon({
    class_name: "microphone",
  });

  const revealer = Widget.Revealer({
    transition: "slide_up",
    child: icon,
  });

  let count = 0;
  let mute = audio.microphone.stream?.is_muted ?? false;

  return revealer.hook(audio.microphone, () =>
    Utils.idle(() => {
      if (mute !== audio.microphone.stream?.is_muted) {
        mute = audio.microphone.stream!.is_muted;
        icon.icon = icons.audio.mic[mute ? "muted" : "high"];
        revealer.reveal_child = true;
        count++;

        Utils.timeout(delay, () => {
          count--;
          if (count === 0) revealer.reveal_child = false;
        });
      }
    }),
  );
}

export default (monitor: number) =>
  Widget.Window({
    monitor,
    name: `osi-${monitor}`,
    class_name: "osi",
    layer: "overlay",
    click_through: true,
    anchor: ["right", "left", "top", "bottom"],
    child: Widget.Overlay({
      child: Widget.Box({ expand: true }),
      overlays: [
        Widget.Box({
          hpack: "end",
          vpack: "center",
          child: progress(),
        }),
        Widget.Box({
          hpack: "center",
          vpack: "end",
          child: microphone(),
        }),
      ],
    }),
  });
