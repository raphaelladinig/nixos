const battery = await Service.import("battery");

export default () => {
  return Widget.Box({
    class_name: "battery",
  }).hook(battery, (self) => {
    const { icon_name, percent } = battery;
    self.children = [
      Widget.Icon({ icon: icon_name }),
      Widget.Label({ label: `${percent}%` }),
    ];
  });
};
