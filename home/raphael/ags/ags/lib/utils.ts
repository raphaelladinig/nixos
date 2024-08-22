import Gtk from "gi://Gtk?version=3.0";
import Gdk from "gi://Gdk";
import GLib from "gi://GLib";

export function forMonitors(widget: (monitor: number) => Gtk.Window) {
  const n = Gdk.Display.get_default()?.get_n_monitors() || 1;
  return range(n, 0).flatMap(widget);
}

export function range(length: number, start = 1) {
  return Array.from({ length }, (_, i) => i + start);
}

export function icon(name: string | null, fallback = "image-missing-symbolic") {
  if (!name) return fallback;

  if (GLib.file_test(name, GLib.FileTest.EXISTS)) return name;

  if (Utils.lookUpIcon(name)) return name;

  return fallback;
}
