const network = await Service.import("network");

export default () => {
  return Widget.Icon({
    class_name: "network",
  }).hook(network, (self) => {
    const icon = network[network.primary || "wifi"]?.icon_name;
    self.icon = icon || "";
    self.visible = !!icon;
  });
};
