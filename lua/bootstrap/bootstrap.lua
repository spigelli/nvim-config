-- Sets a mapping for the specific buffer.
local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end

return (function()
  require("bootstrap.packer")

  require('github-theme').setup({
    theme_style = 'dark_default',
  })

  require('neoscroll').setup({
    -- All these keys will be mapped to their corresponding default scrolling animation
    mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
                '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
    hide_cursor = true,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
    respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil,       -- Default easing function
    pre_hook = nil,              -- Function to run before the scrolling animation starts
    post_hook = nil,             -- Function to run after the scrolling animation ends
    performance_mode = false,    -- Disable "Performance Mode" on all buffers.
  })

  require('nvim-web-devicons').setup {
  -- your personnal icons can go here (to override)
  -- you can specify color or cterm_color instead of specifying both of them
  -- DevIcon will be appended to `name`
  override = {
    zsh = {
      icon = "",
      color = "#428850",
      cterm_color = "65",
      name = "Zsh"
    }
  };
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true;
  }

  require('telescope').setup{
    defaults = {
      -- Default configuration for telescope goes here:
      -- config_key = value,
      mappings = {
        -- i = {
        --   -- map actions.which_key to <C-h> (default: <C-/>)
        --   -- actions.which_key shows the mappings for your picker,
        --   -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        --   ["<C-h>"] = "which_key"
        -- }
      }
    },
    pickers = {
      -- Default configuration for builtin pickers goes here:
      -- picker_name = {
      --   picker_config_key = value,
      --   ...
      -- }
      -- Now the picker_config_key will be applied every time you call this
      -- builtin picker
    },
    extensions = {
      -- Your extension configuration goes here:
      -- extension_name = {
      --   extension_config_key = value,
      -- }
      -- please take a look at the readme of the extension you want to configure
    }
  }

  -- setup with all defaults
  -- each of these are documented in `:help nvim-tree.OPTION_NAME`
  require('nvim-tree').setup { -- BEGIN_DEFAULT_OPTS
    auto_reload_on_write = true,
    disable_netrw = false,
    hide_root_folder = false,
    hijack_cursor = false,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup = false,
    open_on_setup = false,
    open_on_setup_file = false,
    open_on_tab = false,
    sort_by = "name",
    update_cwd = false,
    view = {
      width = 30,
      height = 30,
      side = "left",
      preserve_window_proportions = false,
      number = false,
      relativenumber = false,
      signcolumn = "yes",
      mappings = {
        custom_only = false,
        list = {
          -- user mappings go here
        },
      },
    },
    renderer = {
      indent_markers = {
        enable = false,
        icons = {
          corner = "└ ",
          edge = "│ ",
          none = "  ",
        },
      },
    },
    hijack_directories = {
      enable = true,
      auto_open = true,
    },
    update_focused_file = {
      enable = false,
      update_cwd = false,
      ignore_list = {},
    },
    ignore_ft_on_setup = {},
    system_open = {
      cmd = nil,
      args = {},
    },
    diagnostics = {
      enable = false,
      show_on_dirs = false,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    filters = {
      dotfiles = false,
      custom = {},
      exclude = {},
    },
    git = {
      enable = true,
      ignore = true,
      timeout = 400,
    },
    actions = {
      use_system_clipboard = true,
      change_dir = {
        enable = true,
        global = false,
      },
      open_file = {
        quit_on_open = false,
        resize_window = false,
        window_picker = {
          enable = true,
          chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
          exclude = {
            filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
            buftype = { "nofile", "terminal", "help" },
          },
        },
      },
    },
    trash = {
      cmd = "trash",
      require_confirm = true,
    },
    log = {
      enable = false,
      truncate = false,
      types = {
        all = false,
        config = false,
        copy_paste = false,
        git = false,
        profile = false,
      },
    },
  } -- END_DEFAULT_OPTS

  require('which-key').setup{
    -- Default configuration for which-key goes here:
    -- config_key = value,
    -- ...
  }

  require('octo').setup({
    default_remote = {"upstream", "origin"}; -- order to try remotes
    reaction_viewer_hint_icon = "";         -- marker for user reactions
    user_icon = " ";                        -- user icon
    timeline_marker = "";                   -- timeline marker
    timeline_indent = "2";                   -- timeline indentation
    right_bubble_delimiter = "";            -- Bubble delimiter
    left_bubble_delimiter = "";             -- Bubble delimiter
    github_hostname = "";                    -- GitHub Enterprise host
    snippet_context_lines = 4;               -- number or lines around commented lines
    file_panel = {
      size = 10,                             -- changed files panel rows
      use_icons = true                       -- use web-devicons in file panel
    },
    mappings = {
      issue = {
        close_issue = "<space>ic",           -- close issue
        reopen_issue = "<space>io",          -- reopen issue
        list_issues = "<space>il",           -- list open issues on same repo
        reload = "<C-r>",                    -- reload issue
        open_in_browser = "<C-b>",           -- open issue in browser
        copy_url = "<C-y>",                  -- copy url to system clipboard
        add_assignee = "<space>aa",          -- add assignee
        remove_assignee = "<space>ad",       -- remove assignee
        create_label = "<space>lc",          -- create label
        add_label = "<space>la",             -- add label
        remove_label = "<space>ld",          -- remove label
        goto_issue = "<space>gi",            -- navigate to a local repo issue
        add_comment = "<space>ca",           -- add comment
        delete_comment = "<space>cd",        -- delete comment
        next_comment = "]c",                 -- go to next comment
        prev_comment = "[c",                 -- go to previous comment
        react_hooray = "<space>rp",          -- add/remove 🎉 reaction
        react_heart = "<space>rh",           -- add/remove ❤️ reaction
        react_eyes = "<space>re",            -- add/remove 👀 reaction
        react_thumbs_up = "<space>r+",       -- add/remove 👍 reaction
        react_thumbs_down = "<space>r-",     -- add/remove 👎 reaction
        react_rocket = "<space>rr",          -- add/remove 🚀 reaction
        react_laugh = "<space>rl",           -- add/remove 😄 reaction
        react_confused = "<space>rc",        -- add/remove 😕 reaction
      },
      pull_request = {
        checkout_pr = "<space>po",           -- checkout PR
        merge_pr = "<space>pm",              -- merge commit PR
        squash_and_merge_pr = "<space>psm",  -- squash and merge PR
        list_commits = "<space>pc",          -- list PR commits
        list_changed_files = "<space>pf",    -- list PR changed files
        show_pr_diff = "<space>pd",          -- show PR diff
        add_reviewer = "<space>va",          -- add reviewer
        remove_reviewer = "<space>vd",       -- remove reviewer request
        close_issue = "<space>ic",           -- close PR
        reopen_issue = "<space>io",          -- reopen PR
        list_issues = "<space>il",           -- list open issues on same repo
        reload = "<C-r>",                    -- reload PR
        open_in_browser = "<C-b>",           -- open PR in browser
        copy_url = "<C-y>",                  -- copy url to system clipboard
        add_assignee = "<space>aa",          -- add assignee
        remove_assignee = "<space>ad",       -- remove assignee
        create_label = "<space>lc",          -- create label
        add_label = "<space>la",             -- add label
        remove_label = "<space>ld",          -- remove label
        goto_issue = "<space>gi",            -- navigate to a local repo issue
        add_comment = "<space>ca",           -- add comment
        delete_comment = "<space>cd",        -- delete comment
        next_comment = "]c",                 -- go to next comment
        prev_comment = "[c",                 -- go to previous comment
        react_hooray = "<space>rp",          -- add/remove 🎉 reaction
        react_heart = "<space>rh",           -- add/remove ❤️ reaction
        react_eyes = "<space>re",            -- add/remove 👀 reaction
        react_thumbs_up = "<space>r+",       -- add/remove 👍 reaction
        react_thumbs_down = "<space>r-",     -- add/remove 👎 reaction
        react_rocket = "<space>rr",          -- add/remove 🚀 reaction
        react_laugh = "<space>rl",           -- add/remove 😄 reaction
        react_confused = "<space>rc",        -- add/remove 😕 reaction
      },
      review_thread = {
        goto_issue = "<space>gi",            -- navigate to a local repo issue
        add_comment = "<space>ca",           -- add comment
        add_suggestion = "<space>sa",        -- add suggestion
        delete_comment = "<space>cd",        -- delete comment
        next_comment = "]c",                 -- go to next comment
        prev_comment = "[c",                 -- go to previous comment
        select_next_entry = "]q",            -- move to previous changed file
        select_prev_entry = "[q",            -- move to next changed file
        close_review_tab = "<C-c>",          -- close review tab
        react_hooray = "<space>rp",          -- add/remove 🎉 reaction
        react_heart = "<space>rh",           -- add/remove ❤️ reaction
        react_eyes = "<space>re",            -- add/remove 👀 reaction
        react_thumbs_up = "<space>r+",       -- add/remove 👍 reaction
        react_thumbs_down = "<space>r-",     -- add/remove 👎 reaction
        react_rocket = "<space>rr",          -- add/remove 🚀 reaction
        react_laugh = "<space>rl",           -- add/remove 😄 reaction
        react_confused = "<space>rc",        -- add/remove 😕 reaction
      },
      submit_win = {
        approve_review = "<C-a>",            -- approve review
        comment_review = "<C-m>",            -- comment review
        request_changes = "<C-r>",           -- request changes review
        close_review_tab = "<C-c>",          -- close review tab
      },
      review_diff = {
        add_review_comment = "<space>ca",    -- add a new review comment
        add_review_suggestion = "<space>sa", -- add a new review suggestion
        focus_files = "<leader>e",           -- move focus to changed file panel
        toggle_files = "<leader>b",          -- hide/show changed files panel
        next_thread = "]t",                  -- move to next thread
        prev_thread = "[t",                  -- move to previous thread
        select_next_entry = "]q",            -- move to previous changed file
        select_prev_entry = "[q",            -- move to next changed file
        close_review_tab = "<C-c>",          -- close review tab
        toggle_viewed = "<leader><space>",   -- toggle viewer viewed state
      },
      file_panel = {
        next_entry = "j",                    -- move to next changed file
        prev_entry = "k",                    -- move to previous changed file
        select_entry = "<cr>",               -- show selected changed file diffs
        refresh_files = "R",                 -- refresh changed files panel
        focus_files = "<leader>e",           -- move focus to changed file panel
        toggle_files = "<leader>b",          -- hide/show changed files panel
        select_next_entry = "]q",            -- move to previous changed file
        select_prev_entry = "[q",            -- move to next changed file
        close_review_tab = "<C-c>",          -- close review tab
        toggle_viewed = "<leader><space>",   -- toggle viewer viewed state
      }
    }
  })

  local on_attach = function(client, bufnr)
      vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
      vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
      vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
      vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
      vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
      vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
      vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
      vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
      vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
      vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
      vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
      vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
      buf_map(bufnr, "n", "gd", ":LspDef<CR>")
      buf_map(bufnr, "n", "gr", ":LspRename<CR>")
      buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
      buf_map(bufnr, "n", "K", ":LspHover<CR>")
      buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>")
      buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>")
      buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>")
      buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>")
      buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")
      if client.resolved_capabilities.document_formatting then
          vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
      end
  end

  require('lspconfig').tsserver.setup({
    on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
      local ts_utils = require("nvim-lsp-ts-utils")
      ts_utils.setup({})
      ts_utils.setup_client(client)
      buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
      buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
      buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
      on_attach(client, bufnr)
    end,
  })

  local null_ls = require('null-ls')
  require("null-ls").setup({
      sources = {
          null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.code_actions.eslint,
          null_ls.builtins.formatting.prettier
      },
      on_attach = on_attach
  })
end)()