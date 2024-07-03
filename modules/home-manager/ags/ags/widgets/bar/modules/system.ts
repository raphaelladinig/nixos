import icons from "icons";

const bluetooth = await Service.import("bluetooth");
const audio = await Service.import("audio");
const network = await Service.import("network");

const networkIndicator = () =>
  Widget.Icon().hook(network, (self) => {
    const icon = network[network.primary || "wifi"]?.icon_name;
    self.icon = icon || "";
    self.visible = !!icon;
  });

const audioIndicator = () =>
  Widget.Icon().hook(audio.speaker, (self) => {
    const vol = audio.speaker.is_muted ? 0 : audio.speaker.volume;
    const { muted, low, medium, high, overamplified } = icons.audio.volume;
    const cons = [
      [101, overamplified],
      [67, high],
      [34, medium],
      [1, low],
      [0, muted],
    ] as const;
    self.icon = cons.find(([n]) => n <= vol * 100)?.[1] || "";
  });

const bluetoothIndicator = () =>
  Widget.Icon().hook(bluetooth, (self) => {
    self.icon = bluetooth.enabled
      ? icons.bluetooth.enabled
      : icons.bluetooth.disabled;
  });

const microphoneIndicator = () =>
  Widget.Icon().hook(audio.microphone, (self) => {
    const vol = audio.microphone.is_muted ? 0 : audio.microphone.volume;
    const { muted, low, medium, high } = icons.audio.mic;
    const cons = [
      [67, high],
      [34, medium],
      [1, low],
      [0, muted],
    ] as const;
    self.icon = cons.find(([n]) => n <= vol * 100)?.[1] || "";
  });

export default () => {
  return Widget.Box({
    children: [
      bluetoothIndicator(),
      networkIndicator(),
      microphoneIndicator(),
      audioIndicator(),
    ],
  });
};
