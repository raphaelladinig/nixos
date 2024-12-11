const date = Variable("", {
  poll: [1000, 'date "+%H:%M - %A %d.%m"'],
});

export default () => {
  return Widget.Label({
    class_name: "date",
    label: date.bind(),
  });
};
