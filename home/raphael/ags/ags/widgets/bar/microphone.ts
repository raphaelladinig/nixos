const audio = await Service.import("audio");

export default () => {
  return Widget.Box({
    class_name: "microphone",
    children: [
      Widget.Icon().hook(audio.microphone, (self) => {
        const vol = audio.microphone.is_muted ? 0 : audio.microphone.volume;
        const { muted, low, medium, high } = {
          muted: "microphone-disabled-symbolic",
          low: "microphone-sensitivity-low-symbolic",
          medium: "microphone-sensitivity-medium-symbolic",
          high: "microphone-sensitivity-high-symbolic",
        };
        const cons = [
          [67, high],
          [34, medium],
          [1, low],
          [0, muted],
        ] as const;
        self.icon = cons.find(([n]) => n <= vol * 100)?.[1] || "";
      }),
      Widget.Label().hook(audio.microphone, (self) => {
        self.label = String(Math.round(audio.microphone.volume * 100)) + "%";
      }),
    ],
  });
};
