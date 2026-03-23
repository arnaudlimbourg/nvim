local status_ok, todo = pcall(require, "todo-txt")
if not status_ok then
	return
end

todo.setup({
    todo_file = vim.fn.expand("~/todo.txt"), -- Path to your todo.txt file
    done_file = vim.fn.expand("~/done.txt"), -- Optional: Path to your done.txt file (defaults to done.txt in the same directory as todo.txt)
    window = {
        width = 60,     -- Width of the floating window
        height = 10,    -- Height of the floating window
        border = "rounded", -- Border style of windows
    },
    -- Sorting configuration (order of criteria). Supported keys: 'priority', 'due'
    sort = {
        by = { 'priority', 'due' }, -- default order
    },
    disable_default_mappings = true -- Disable default key mappings
})
