import os
from urllib.request import urlopen
from qutebrowser.config.configfiles import ConfigAPI
from qutebrowser.config.config import ConfigContainer

config: ConfigAPI = config  # type: ignore[name-defined]
c: ConfigContainer = c  # type: ignore[name-defined]

config.load_autoconfig(False)

c.backend = "webengine"

c.colors.webpage.preferred_color_scheme = "dark"

c.auto_save.session = True
c.session.lazy_restore = True

c.content.pdfjs = True

c.scrolling.bar = "always"
c.scrolling.smooth = True

c.tabs.tooltips = False
c.tabs.favicons.show = "never"

c.fonts.default_family = "CaskaydiaCove Nerd Font Mono"
c.fonts.default_size = "14pt"
c.fonts.hints = "10pt CaskaydiaCove Nerd Font Mono"

if not os.path.exists(config.configdir / "theme.py"):
    theme = "https://raw.githubusercontent.com/catppuccin/qutebrowser/main/setup.py"
    with urlopen(theme) as themehtml:
        with open(config.configdir / "theme.py", "a") as file:
            file.writelines(themehtml.read().decode("utf-8"))
if os.path.exists(config.configdir / "theme.py"):
    import theme

    theme.setup(c, "mocha", True)
