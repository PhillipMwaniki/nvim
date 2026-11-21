-- Autocompletion tweaks on top of AstroNvim's blink.cmp defaults
-- Function/class/method completion itself comes from the LSP source
-- (intelephense for PHP, gopls for Go, rust-analyzer for Rust)

---@type LazySpec
return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 200 }, -- show docs next to the menu
      ghost_text = { enabled = true }, -- preview the selected item inline
      accept = { auto_brackets = { enabled = true } }, -- add `()` when accepting a function
    },
    signature = { enabled = true }, -- show parameter hints while typing function arguments
    -- Inside a snippet (e.g. gopls function args), <Tab> jumps to the next placeholder
    -- even when the completion menu is open; use <C-n>/<C-p> to move through the menu.
    -- AstroNvim's default runs select_next first, so <Tab> picked a menu item instead.
    keymap = {
      ["<Tab>"] = {
        "snippet_forward",
        "select_next",
        function(cmp)
          local col = vim.fn.col "." - 1
          local has_words_before = col > 0 and vim.fn.getline("."):sub(col, col):match "%s" == nil
          if has_words_before or vim.api.nvim_get_mode().mode == "c" then return cmp.show() end
        end,
        "fallback",
      },
      ["<S-Tab>"] = {
        "snippet_backward",
        "select_prev",
        function(cmp)
          if vim.api.nvim_get_mode().mode == "c" then return cmp.show() end
        end,
        "fallback",
      },
    },
  },
}
