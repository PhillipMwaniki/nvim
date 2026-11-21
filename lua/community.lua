-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- PHP + Laravel (laravel pack also pulls in php, blade and html-css packs)
  { import = "astrocommunity.pack.php" },
  { import = "astrocommunity.pack.laravel" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.tailwindcss" },
  -- Go
  { import = "astrocommunity.pack.go" },
  -- Rust (rustaceanvim + crates.nvim + toml)
  { import = "astrocommunity.pack.rust" },
  -- Common file types in these projects
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.docker" },
  -- Emmet --
  { import = "astrocommunity.pack.html-css" },
  -- import/override with your plugins folder
}
