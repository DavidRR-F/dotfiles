from __future__ import (absolute_import, division, print_function)

# You can import any python module as needed.
import os

# You always need to import ranger.api.commands here to get the Command class:
from ranger.api.commands import Command
from ranger.ext.img_display import ImageDisplayer, register_image_displayer
import subprocess
from shlex import quote

@register_image_displayer("wezterm-image-display-method")
class WeztermImageDisplayer(ImageDisplayer):
    def draw(self, path, start_x, start_y, width, height):
        print("\033[%d;%dH" % (start_y, start_x + 1))
        path = quote(path)
        draw_cmd = "wezterm imgcat {} --width {} --height {}".format(path, width, height)
        subprocess.run(draw_cmd.split(" "))

    def clear(self, start_x, start_y, width, height):
        cleaner = " " * width
        for i in range(height):
            print("\033[%d;%dH" % (start_y + i, start_x + 1))
            print(cleaner)


class my_edit(Command):
    """:my_edit <filename>

    A sample command for demonstration purposes that opens a file in an editor.
    """
    def execute(self):
        if self.arg(1):
            target_filename = self.rest(1)
        else:
            target_filename = self.fm.thisfile.path

        self.fm.notify("Let's edit the file " + target_filename + "!")

        if not os.path.exists(target_filename):
            self.fm.notify("The given file does not exist!", bad=True)
            return

        self.fm.edit_file(target_filename)

    def tab(self, tabnum):
        return self._tab_directory_content()
