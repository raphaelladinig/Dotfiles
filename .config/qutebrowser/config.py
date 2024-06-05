import os
from urllib.request import urlopen
from qutebrowser.config.configfiles import ConfigAPI
from qutebrowser.config.config import ConfigContainer

config: ConfigAPI = config  # type: ignore[name-defined]
c: ConfigContainer = c  # type: ignore[name-defined]

config.load_autoconfig(False)

if not os.path.exists(config.configdir / "theme.py"):
    theme = "https://raw.githubusercontent.com/catppuccin/qutebrowser/main/setup.py"
    with urlopen(theme) as themehtml:
        with open(config.configdir / "theme.py", "a") as file:
            file.writelines(themehtml.read().decode("utf-8"))
if os.path.exists(config.configdir / "theme.py"):
    import theme

    theme.setup(c, "mocha", True)

c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.darkmode.enabled = True

c.auto_save.session = True
c.session.lazy_restore = True

c.content.pdfjs = True

c.scrolling.bar = "always"

c.tabs.tooltips = False

c.fonts.default_family = "CaskaydiaCove Nerd Font Mono"
c.fonts.default_size = "14pt"
c.fonts.hints = "10pt CaskaydiaCove Nerd Font Mono"
