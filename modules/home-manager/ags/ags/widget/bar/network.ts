const network = await Service.import("network");

export default () => {
  return Widget.Box({
    class_name: "network",
    children: [
      Widget.Icon({}).hook(network, (self) => {
        const icon = network[network.primary || "wifi"]?.icon_name;
        self.icon = icon || "";
        self.visible = !!icon;
      }),
      Widget.Label().hook(network, (self) => {
        self.label = network.wifi.ssid || "";
      }),
    ],
  });
};
