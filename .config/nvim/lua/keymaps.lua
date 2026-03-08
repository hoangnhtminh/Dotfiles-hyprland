local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ── General ───────────────────────────────────────────────────
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
map("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Force quit all" })

-- ── Navigation ────────────────────────────────────────────────
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize windows
map("n", "<C-Up>",    "<cmd>resize +2<CR>")
map("n", "<C-Down>",  "<cmd>resize -2<CR>")
map("n", "<C-Left>",  "<cmd>vertical resize -2<CR>")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>")

-- ── Buffers ───────────────────────────────────────────────────
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })
map("n", "<Tab>",   "<cmd>bnext<CR>",     { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Prev buffer" })

-- ── Splits ────────────────────────────────────────────────────
map("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Vertical split" })
map("n", "<leader>sh", "<cmd>split<CR>",  { desc = "Horizontal split" })

-- ── Move lines ────────────────────────────────────────────────
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- ── Better indent ─────────────────────────────────────────────
map("v", "<", "<gv")
map("v", ">", ">gv")

-- ── Paste without overwriting register ────────────────────────
map("v", "p", '"_dP')

-- ── Telescope ─────────────────────────────────────────────────
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>",  { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>",   { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>",     { desc = "Find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>",   { desc = "Help tags" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>",    { desc = "Recent files" })

-- ── File tree ─────────────────────────────────────────────────
map("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle file tree" })

-- ── LSP (set in lsp on_attach) ────────────────────────────────
map("n", "K",          vim.lsp.buf.hover,          { desc = "Hover docs" })
map("n", "gd",         vim.lsp.buf.definition,     { desc = "Go to definition" })
map("n", "gr",         vim.lsp.buf.references,     { desc = "References" })
map("n", "<leader>ca", vim.lsp.buf.code_action,    { desc = "Code action" })
map("n", "<leader>rn", vim.lsp.buf.rename,         { desc = "Rename" })
map("n", "<leader>d",  vim.diagnostic.open_float,  { desc = "Show diagnostic" })
map("n", "[d",         vim.diagnostic.goto_prev,   { desc = "Prev diagnostic" })
map("n", "]d",         vim.diagnostic.goto_next,   { desc = "Next diagnostic" })

-- ── Terminal ──────────────────────────────────────────────────
map("n", "<leader>t", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
