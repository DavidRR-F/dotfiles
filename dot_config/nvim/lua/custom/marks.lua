local function cwd()
  local current_dir = vim.fn.getcwd()
  if vim.loop.os_uname().sysname == "Windows_NT" then
    return current_dir:gsub("\\", "/")
  else
    local home = os.getenv("HOME") or ""
    return current_dir:gsub("^" .. vim.pesc(home), "~")
  end
end

local M = {}

M.mark_state = {
  current_mark = nil,
  cwd = cwd(),
}

function M.is_in_cwd(file)
  return file:sub(1, #M.mark_state.cwd) == M.mark_state.cwd
end

function M.get_project_global_marks()
  local marks = vim.fn.getmarklist()
  local global_marks = {}

  for _, mark in ipairs(marks) do
    if mark.mark:match("%u") and mark.file and M.is_in_cwd(mark.file) then
      table.insert(global_marks, mark)
    end
  end

  return global_marks
end

function M.next_project_global_marks()
  local project_global_marks = M.get_project_global_marks()

  if #project_global_marks == 0 then
    return
  end

  if M.mark_state.current_mark == nil then
    vim.cmd(project_global_marks[1].mark)
    M.mark_state.current_mark = project_global_marks[1].mark
  else
    for index, mark in ipairs(project_global_marks) do
      if M.mark_state.current_mark == mark.mark then
        if index < #project_global_marks then
          vim.cmd(project_global_marks[index + 1].mark)
          M.mark_state.current_mark = project_global_marks[index + 1].mark
          break
        else
          vim.cmd(project_global_marks[1].mark)
          M.mark_state.current_mark = project_global_marks[1].mark
        end
      end
    end
  end
end

function M.prev_project_global_marks()
  local project_global_marks = M.get_project_global_marks()

  if #project_global_marks == 0 then
    return
  end

  if M.mark_state.current_mark == nil then
    vim.cmd(project_global_marks[#project_global_marks].mark)
    M.mark_state.current_mark = project_global_marks[#project_global_marks].mark
  else
    for index, mark in ipairs(project_global_marks) do
      if M.mark_state.current_mark == mark.mark then
        if index > 1 then
          vim.cmd(project_global_marks[index + 1].mark)
          M.mark_state.current_mark = project_global_marks[index + 1].mark
          break
        else
          vim.cmd(project_global_marks[#project_global_marks].mark)
          M.mark_state.current_mark = project_global_marks[#project_global_marks].mark
          break
        end
      end
    end
  end
end

function M.delete_mark_for_key(mark)
  vim.cmd("delmarks " .. mark)
  if M.mark_state.current_mark and mark == M.mark_state.current_mark:sub(2) then
    M.mark_state.current_mark = nil
  end
end

function M.delete_project_global_marks()
  local project_global_marks = M.get_project_global_marks()

  if #project_global_marks == 0 then
    return
  end

  for _, mark in ipairs(project_global_marks) do
    M.delete_mark_for_key(mark.mark:sub(2))
  end
  M.mark_state.current_mark = nil
end

function M.config()
  vim.api.nvim_create_autocmd("CursorMoved", {
    callback = function()
      local cur_pos = vim.api.nvim_win_get_cursor(0)
      local buf_id = vim.api.nvim_win_get_buf(0)
      for _, mark in ipairs(M.get_project_global_marks()) do
        if buf_id == mark.pos[1] and cur_pos[1] == mark.pos[2] then
          M.mark_state.current_mark = mark.mark
          break
        end
      end
    end,
  })

  vim.api.nvim_create_autocmd("DirChanged", {
    pattern = "*",
    callback = function()
      M.mark_state.cwd = cwd()
    end,
  })

  vim.keymap.set("n", "<Tab>", M.next_project_global_marks)
  vim.keymap.set("n", "<S-Tab>", M.prev_project_global_marks)
  vim.keymap.set("n", "<leader>dm", M.delete_project_global_marks)
  for _, mark in ipairs({
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z",
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
  }) do
    vim.api.nvim_set_keymap(
      "n",
      "dm" .. mark,
      '<cmd>lua require("david.custom.marks").delete_mark_for_key("' .. mark .. '")<CR>',
      { noremap = true, silent = true }
    )
  end

  vim.api.nvim_set_hl(0, "CurrentMark", { fg = "#cba6f7", bg = "NONE" })
  vim.api.nvim_set_hl(0, "NoMark", { fg = "#fab387", bg = "NONE" })
  vim.api.nvim_set_hl(0, "NormalMark", { fg = "#89b4fa", bg = "NONE" })
end

function M.lualine_marks()
  local marks = M.get_project_global_marks()
  local mark_list = {}

  if #marks == 0 then
    table.insert(mark_list, "%#NoMark#" .. "󰍑")
    return table.concat(mark_list, " ")
  end

  table.insert(mark_list, "%#NormalMark#" .. "󰍒")
  for _, mark in ipairs(marks) do
    local mark_display = mark.mark:sub(2)
    if M.mark_state.current_mark == mark.mark then
      table.insert(mark_list, "%#CurrentMark#" .. mark_display)
    else
      table.insert(mark_list, "%#NormalMark#" .. mark_display)
    end
  end

  return table.concat(mark_list, " ")
end

return M
