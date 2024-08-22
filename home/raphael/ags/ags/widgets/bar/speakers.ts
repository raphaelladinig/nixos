const audio = await Service.import("audio");

export default () => {
  return Widget.Box({
    class_name: "speakers",
    children: [
      Widget.Icon().hook(audio.speaker, (self) => {
        const vol = audio.speaker.is_muted ? 0 : audio.speaker.volume;
        const { muted, low, medium, high, overamplified } = {
          muted: "audio-volume-muted-symbolic",
          low: "audio-volume-low-symbolic",
          medium: "audio-volume-medium-symbolic",
          high: "audio-volume-high-symbolic",
          overamplified: "audio-volume-overamplified-symbolic",
        };
        const cons = [
          [101, overamplified],
          [67, high],
          [34, medium],
          [1, low],
          [0, muted],
        ] as const;
        self.icon = cons.find(([n]) => n <= vol * 100)?.[1] || "";
      }),
      Widget.Label().hook(audio.speaker, (self) => {
        self.label = String(Math.round(audio.speaker.volume * 100)) + "%";
      }),
    ],
  });
};
