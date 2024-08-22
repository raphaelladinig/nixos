const notifications = await Service.import("notifications");

notifications.dnd = !notifications.dnd;
