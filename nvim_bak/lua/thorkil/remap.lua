bind = vim.keymap.set


bind("n", "<leader>w", ":w<CR>")
bind("n", "<C-q>", ":q!<CR>")
bind("n", "<leader>e", vim.cmd.Ex)

-- Move line up/down in visual mode
bind("v", "J", ":m '>+1<CR>gv=gv")
bind("v", "K", ":m '<-2<CR>gv=gv")

-- Half page jump, keep cursor in middle of screen
bind("n", "<C-u>", "<C-u>zz")
bind("n", "<C-d>", "<C-d>zz")

-- Cursor in middle when searching
bind("n", "n", "nzzzv")
bind("n", "N", "Nzzzv")

-- Paste without losing copied word from replaced text
 bind("x", "<leader>p", "\"_dP")

-- Copy to system clipboard with leader y
bind("n", "<leader>y", "\"+y") --?
bind("v", "<leader>y", "\"+y")
bind("n", "<leader>Y", "\"+Y")

-- Buffers
bind("n", "<leader>l", ":bnext<CR>")
bind("n", "<leader>h", ":bprev<CR>")


-- Auto format file
bind("n", "<leader>f", function()
  vim.lsp.buf.format()
end)

-- Quickfix navigation
bind("n", "<C-k>", "<cmd>cnext<CR>zz")
bind("n", "<C-j>", "<cmd>cprev<CR>zz")
bind("n", "<leader>k", "<cmd>lnext<CR>zz")
bind("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace all occurences of current word
bind("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make current file executable
bind("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
