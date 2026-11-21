-- Dashboard header (moved out of user.lua, which is still disabled)

---@type LazySpec
return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            "██████  ██   ██ ██ ██      ██      ██ ██████ ",
            "██   ██ ██   ██ ██ ██      ██      ██ ██   ██",
            "██████  ███████ ██ ██      ██      ██ ██████ ",
            "██      ██   ██ ██ ██      ██      ██ ██     ",
            "██      ██   ██ ██ ███████ ███████ ██ ██     ",
          }, "\n"),
        },
      },
    },
  },
}
