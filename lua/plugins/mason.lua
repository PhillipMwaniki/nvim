-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = function(_, opts)
      -- Make sure to use the names found in `:Mason`
      -- language packs in `community.lua` add their own tools on top of these
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        -- install language servers
        "lua-language-server",
        "intelephense", -- PHP / Laravel completion, go-to-definition, diagnostics

        -- install formatters
        "stylua",

        -- install any other package
        "tree-sitter-cli", -- required by nvim-treesitter to compile parsers
      })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      handlers = {
        -- the php pack installs php-cs-fixer, but pint (Laravel's formatter) is used instead
        php_cs_fixer = function() end,
        -- the go pack installs goimports, but it resolves imports by scanning the module cache and
        -- picks wrong versions (e.g. jackc/pgx v3 instead of pgx/v5); gopls organizes imports on save instead
        goimports = function() end,
      },
    },
  },
}
