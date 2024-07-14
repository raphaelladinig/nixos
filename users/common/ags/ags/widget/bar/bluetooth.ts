import icons from "icons";

const bluetooth = await Service.import("bluetooth");

export default () => {
  return Widget.Icon({
    class_name: "bluetooth",
  }).hook(bluetooth, (self) => {
    self.icon = bluetooth.enabled
      ? icons.bluetooth.enabled
      : icons.bluetooth.disabled;
  });
};
