-- Laravel extras on top of astrocommunity.pack.laravel
return {
  -- Larastan / PHPStan diagnostics, using each project's own vendor/bin/phpstan + phpstan.neon
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local null_ls = require "null-ls"
      local root_file = { "phpstan.neon", "phpstan.neon.dist", "phpstan.dist.neon" }
      local function root(bufname) return vim.fs.root(bufname, root_file) end

      opts.sources = require("astrocore").list_insert_unique(opts.sources, {
        null_ls.builtins.diagnostics.phpstan.with {
          -- run on save against the real file: a temp file would fall outside the neon `paths`
          method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
          to_temp_file = false,
          timeout = 60000,
          condition = function(utils)
            return utils.root_has_file(root_file) and utils.root_has_file { "vendor/bin/phpstan" }
          end,
          cwd = function(params) return root(params.bufname) end,
          -- vendor/bin/phpstan is often not +x, so run it through php
          command = "php",
          args = {
            "vendor/bin/phpstan",
            "analyze",
            "--error-format",
            "json",
            "--no-progress",
            "--memory-limit=2G",
            "$FILENAME",
          },
        },
      })
    end,
  },

  -- blade-nav: use its native blink.cmp source instead of the nvim-cmp integration.
  -- blink.compat exposes a fake `cmp` module, which made blade-nav try nvim-cmp's
  -- internal config API and warn "nvim-cmp internal config API unavailable".
  {
    "ricardoramirezr/blade-nav.nvim",
    opts = { integrations = { cmp = false } },
  },
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        per_filetype = {
          blade = { "blade-nav", inherit_defaults = true },
          php = { "blade-nav", inherit_defaults = true },
        },
        providers = {
          ["blade-nav"] = { name = "blade-nav", module = "blade-nav.integrations.blink", score_offset = 50 },
        },
      },
    },
  },

  -- extra parsers for Laravel projects (JS/TS/Vue come from their packs)
  {
    "AstroNvim/astrocore",
    opts = {
      treesitter = { ensure_installed = { "sql", "regex", "jsdoc", "php_only" } },
    },
  },
}
