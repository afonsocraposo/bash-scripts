#!/usr/bin/python

import subprocess
import gi

gi.require_version("Gtk", "3.0")
gi.require_version("AppIndicator3", "0.1")
from gi.repository import Gtk, GLib
from gi.repository import AppIndicator3 as appindicator

TIMEOUT = 60000
COMMAND = "/usr/bin/notmuch search tag:unread and folder:/INBOX/ -folder:/Junk/ | wc -l"


class MyIndicator:
    new_mail = 0

    def __init__(self, root):
        self.app = root
        self.ind = appindicator.Indicator.new(
            self.app.name,
            "indicator-messages",
            appindicator.IndicatorCategory.APPLICATION_STATUS,
        )
        self.ind.set_status(appindicator.IndicatorStatus.ACTIVE)
        self.menu = Gtk.Menu()

        item = Gtk.MenuItem()
        item.set_label("Quit")
        item.connect("activate", self.cb_exit, "")
        self.menu.append(item)

        self.menu.show_all()
        self.ind.set_menu(self.menu)
        GLib.timeout_add(TIMEOUT, self.read_notifications)

    def cb_exit(self, w, data):
        Gtk.main_quit()

    def read_notifications(self):
        sp = subprocess.Popen(COMMAND, shell=True, stdout=subprocess.PIPE)
        email_count = str(sp.stdout.read(), "ascii")

        if self.new_mail != email_count:
            self.new_mail = int(email_count)
            if self.new_mail > 0:
                self.ind.set_label(email_count, "")
                self.ind.set_icon_full("indicator-messages-red", "")
            else:
                self.ind.set_label("", "")
                self.ind.set_icon_full("indicator-messages", "")
        return True


class MyApp(Gtk.Application):
    def __init__(self, app_name):
        super().__init__()
        self.name = app_name
        self.indicator = MyIndicator(self)

    def run(self):
        Gtk.main()


if __name__ == "__main__":
    app = MyApp("Email Tray Indicator")
    app.run()
