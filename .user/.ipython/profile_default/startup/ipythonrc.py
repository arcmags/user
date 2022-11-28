#!/usr/bin/env python
## ~/.ipython/profile_default/startup/ipythonrc.py ::

from IPython import get_ipython
from prompt_toolkit.enums import DEFAULT_BUFFER
from prompt_toolkit.filters import HasFocus, ViInsertMode
from prompt_toolkit.key_binding.vi_state import InputMode
from prompt_toolkit.key_binding.bindings import named_commands

ip = get_ipython()

def switch_to_navigation_mode(event):
    vi_state = event.cli.vi_state
    vi_state.input_mode = InputMode.NAVIGATION

if getattr(ip, 'pt_app', None):
    registry = ip.pt_app.key_bindings
    registry.add_binding('c-k', filter=(HasFocus(DEFAULT_BUFFER)))(named_commands.previous_history)
    registry.add_binding('c-j', filter=(HasFocus(DEFAULT_BUFFER)))(named_commands.next_history)
    registry.add_binding('c-n', filter=(HasFocus(DEFAULT_BUFFER)))(named_commands.menu_complete)
    registry.add_binding('c-p', filter=(HasFocus(DEFAULT_BUFFER)))(named_commands.menu_complete_backward)
    registry.add_binding('escape', 'h', filter=(HasFocus(DEFAULT_BUFFER)))(named_commands.backward_char)
    registry.add_binding('escape', 'l', filter=(HasFocus(DEFAULT_BUFFER)))(named_commands.forward_char)
