local command = vim.api.nvim_create_user_command

command("Format", function()
  vim.lsp.buf.format({ async = true, timeout = 5000 })
end, {})

command("InsertTimestamp", function()
  local cursor_position = vim.api.nvim_win_get_cursor(0)
  local row = cursor_position[1] - 1
  local column = cursor_position[2]
  local timestamp = tostring(os.date("%Y%m%d%H%M%S"))

  vim.api.nvim_buf_set_text(0, row, column, row, column, { timestamp })
end, {})

command("SetAocMappings", function()
  local function run_file_in_tmux_pane()
    io.popen("tmux send -t 2 'ruby " .. vim.fn.expand("%") .. "' Enter")
  end

  vim.keymap.set("n", "<CR>", run_file_in_tmux_pane, { silent = true })
end, {})
