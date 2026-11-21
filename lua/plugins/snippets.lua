-- Stop <Tab> from jumping back into snippets you've already left.
-- AstroNvim sets LuaSnip `history = true` with region checks only on normal-mode
-- CursorMoved, so a half-finished snippet stays "jumpable" and <Tab> (blink's
-- snippet_forward) teleports the cursor back to its old placeholder.
return {
  "L3MON4D3/LuaSnip",
  opts = {
    history = false,
    region_check_events = { "CursorMoved", "CursorMovedI", "InsertEnter" },
    delete_check_events = { "TextChanged", "InsertLeave" },
  },
}
