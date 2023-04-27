local wezterm = require 'wezterm';

return {
  font = wezterm.font("Ubuntu Mono derivative Powerline"),
  use_ime = true, 
  font_size = 14.0,
  color_scheme = "nightfox", -- find your favorite theme, https://wezfurlong.org/wezterm/colorschemes/index.html
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
  audible_bell = "Disabled",
  disable_default_key_bindings = true,
  window_background_opacity = 0.8,
  -- defaultだとvimを開いたときなどに余白が生じる
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
  },
  -- keymap
  keys = {
    {
        key = 't',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.SpawnCommandInNewTab {
            domain = 'CurrentPaneDomain'
        },
    },
    {
        key = 'w',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.CloseCurrentTab {
            confirm = false
        },
    },
    {
        key = 'q',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.CloseCurrentPane {
            confirm = false
        }
    },
    {
        key = 'j',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.SplitVertical {
            domain = 'CurrentPaneDomain'
        }
    },
    {
        key = 'l',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.SplitHorizontal {
            domain = 'CurrentPaneDomain'
        }
    },
    {
        key = 's',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.PaneSelect {
            mode = 'Activate'
        }
    },
    {
        key = '{',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ActivateTabRelative(-1)
    },
    {
        key = '}',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ActivateTabRelative(1)
    },
    -- TODO: Copy clipboard text, Google search, translate, etc.
    {
        key = 'c',
        mods = 'CTRL|SHIFT',
        action = wezterm.action_callback(function(window, pane)
                local word = window:get_selection_escapes_for_pane(pane)
                window:copy_to_clipboard(word)
            end) 
    },
    {
        key = 'g',
        mods = 'CTRL|SHIFT',
        action = wezterm.action_callback(function(window, pane)
                local word = window:get_selection_escapes_for_pane(pane)
                local search_text, idx = string.gsub(word, ' ','+')
                window:copy_to_clipboard(word)
                os.execute("open https://google.com/search?q=" .. 'a')
            end) 
    }
  }
}
