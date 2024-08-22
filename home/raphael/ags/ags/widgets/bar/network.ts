const network = await Service.import("network");

export default () => {
  return Widget.Box({
    class_name: "network",
    children: [
      Widget.Icon({}).hook(network, (self) => {
        const icon = network.wired.icon_name;
        self.icon = icon || "";
        self.visible = !!icon;
      }),
      Widget.Icon({}).hook(network, (self) => {
        const icon = network.wifi.icon_name;
        self.icon = icon || "";
        self.visible = !!icon;
      }),
      Widget.Label().hook(network, (self) => {
        const label = network.wifi.ssid;
        self.label = label || "";
        self.visible = !!label;
      }),
    ],
  });
};
