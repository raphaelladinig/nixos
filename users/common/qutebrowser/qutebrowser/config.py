import os
from qutebrowser.config.configfiles import ConfigAPI
from qutebrowser.config.config import ConfigContainer
from urllib.request import urlopen

config: ConfigAPI = config  # type: ignore[name-defined]
c: ConfigContainer = c  # type: ignore[name-defined]

# disable autoconfig
config.load_autoconfig(False)

# general settings
c.backend = "webengine"
c.colors.webpage.preferred_color_scheme = "dark"
c.url.default_page = "about:blank"
c.url.start_pages = ["about:blank"]
c.window.title_format = "{current_title}"
c.tabs.title.format = "{index}: {audio}{current_title}"
c.auto_save.session = True
c.session.lazy_restore = True
c.content.pdfjs = True
c.scrolling.bar = "never"
c.tabs.tooltips = False
c.tabs.indicator.width = 0
c.fonts.default_family = "CaskaydiaCove Nerd Font Mono"
c.fonts.default_size = "15pt"
c.fonts.hints = "10pt CaskaydiaCove Nerd Font Mono"
c.prompt.radius = 0

# keybindings
config.bind(",v", "spawn mpv {url}")
config.bind(",V", "hint links spawn mpv {hint-url}")


# theme
if not os.path.exists(config.configdir / "theme.py"):
    theme = "https://raw.githubusercontent.com/catppuccin/qutebrowser/main/setup.py"
    with urlopen(theme) as themehtml:
        with open(config.configdir / "theme.py", "a") as file:
            file.writelines(themehtml.read().decode("utf-8"))
if os.path.exists(config.configdir / "theme.py"):
    import theme

    theme.setup(c, "mocha", True)
