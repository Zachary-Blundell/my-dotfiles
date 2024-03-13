-- Set to true, Vim will open the preview window once you enter the markdown buffer
vim.g.mkdp_auto_start = vim.g.mkdp_auto_start or true

-- Set to true, Vim will auto open preview window when you edit the markdown file
vim.g.mkdp_auto_open = vim.g.mkdp_auto_open or false

-- Set to true, Vim will auto close current preview window when changing from markdown buffer to another buffer
vim.g.mkdp_auto_close = vim.g.mkdp_auto_close or true

-- Set to true, Vim will just refresh markdown when saving the buffer or leaving insert mode
vim.g.mkdp_refresh_slow = vim.g.mkdp_refresh_slow or false

-- Set to true, the MarkdownPreview command can be used for all files
vim.g.mkdp_command_for_global = vim.g.mkdp_command_for_global or false

-- Set to true, preview server available to others in your network
vim.g.mkdp_open_to_the_world = vim.g.mkdp_open_to_the_world or true

-- Use custom IP to open preview page, default empty
vim.g.mkdp_open_ip = vim.g.mkdp_open_ip or ''

-- Set to true, echo preview page URL in command line when opening preview page
vim.g.mkdp_echo_preview_url = vim.g.mkdp_echo_preview_url or true

-- Use custom Vim function to open preview page, this function will receive URL as parameter
vim.g.mkdp_browserfunc = vim.g.mkdp_browserfunc or ''

-- Specify browser to open preview page
vim.g.mkdp_browser = vim.g.mkdp_browser or ''

vim.g.mkdp_preview_options = vim.g.mkdp_preview_options or {
    mkit = {},
    katex = {},
    uml = {},
    maid = {},
    disable_sync_scroll = false,
    sync_scroll_type = 'middle',
    hide_yaml_meta = true,
    sequence_diagrams = {},
    flowchart_diagrams = {},
    content_editable = false,
    disable_filename = false,
    toc = {}
}

-- Markdown CSS file absolute path
vim.g.mkdp_markdown_css = vim.g.mkdp_markdown_css or ''

-- Highlight CSS file absolute path
vim.g.mkdp_highlight_css = vim.g.mkdp_highlight_css or ''

-- Preview page title, ${name} will be replaced with the file name
vim.g.mkdp_page_title = vim.g.mkdp_page_title or '「${name}」'

-- Recognized filetypes
vim.g.mkdp_filetypes = vim.g.mkdp_filetypes or {'markdown'}

-- Markdown images custom path
vim.g.mkdp_images_path = vim.g.mkdp_images_path or ''

-- Combine preview window
vim.g.mkdp_combine_preview = vim.g.mkdp_combine_preview or false

-- Auto refetch combine preview contents when changing markdown buffer
vim.g.mkdp_combine_preview_auto_refresh = vim.g.mkdp_combine_preview_auto_refresh or true

-- If there are any active preview client
vim.g.mkdp_clients_active = 0

