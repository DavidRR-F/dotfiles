local M = {}

local function create_daily_note()
  local directory = vim.fn.expand('~') .. '/notes/dailes'
  local filename = os.date('%y-%m-%d') .. '.md'
  local filepath = directory .. '/' .. filename

  if vim.fn.isdirectory(directory) == 0 then
    vim.fn.mkdir(directory, 'p')
  end

  if vim.fn.filereadable(filepath) == 0 then
    local file = io.open(filepath, 'w')
    if file then
      file:write('# ' .. os.date('%A, %B %d, %Y') .. '\n\n')
      file:close()
    end
  end

  return filepath
end

local function toggle_dailes()
  local note = create_daily_note()
  Snacks.scratch({
    file = note,
    width = 0.6,
    height = 0.6,
    ft = "markdown",
    border = "rounded",
    backdrop = 50,
    resize = true,
    fixbuf = true,
    wo = {
      spell = true,
      wrap = true,
    },
    keys = {
      q = "close"
    },
  })
end

function M.config()
  vim.api.nvim_create_user_command("DailyNoteToggle", toggle_dailes, { nargs = "?" })
  vim.api.nvim_set_keymap('n', '<leader>nd', '<cmd>DailyNoteToggle<CR>', { noremap = true, silent = true })
end

return M
