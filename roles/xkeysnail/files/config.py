# -*- coding: utf-8 -*-

import re
from xkeysnail.transform import *

define_keymap(None, {
    K('C-h'): Key.LEFT,
    K('C-j'): Key.DOWN,
    K('C-k'): Key.UP,
    K('C-l'): Key.RIGHT,
}, "Vim-like cursor")

define_multipurpose_modmap({
    Key.LEFT_META: [Key.LEFT_META, Key.LEFT_ALT],
    Key.RIGHT_META: [Key.RIGHT_META, Key.RIGHT_ALT],
    Key.SPACE: [Key.SPACE, Key.LEFT_SHIFT],
    Key.CAPSLOCK: [Key.ESC, Key.LEFT_CTRL],
    Key.LEFT_ALT: [Key.MUHENKAN, Key.LEFT_CTRL],
    Key.RIGHT_ALT: [Key.HENKAN, Key.RIGHT_CTRL]
})

define_keymap(re.compile('Terminator'),{
    K('esc'): [K('muhenkan'), K('esc')]
}, "Esc and IME off")

