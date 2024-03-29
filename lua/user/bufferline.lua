local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    -- numbers = "ordinal", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    numbers = function(opts)
        return string.format('%s', opts.ordinal)
    end,
    -- number_style = "",
    close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    -- indicator_icon = "▎",
    indicator = { style = "icon", icon = "" },
    buffer_close_icon = "",
    -- buffer_close_icon = '',
    modified_icon = "●",
    close_icon = "",
    -- close_icon = '',
    left_trunc_marker = "",
    right_trunc_marker = "",
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    -- name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
    --   -- remove extension from markdown files for example
    --   if buf.name:match('%.md') then
    --     return vim.fn.fnamemodify(buf.name, ':t:r')
    --   end
    -- end,
    max_name_length = 30,
    max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
    tab_size = 21,
    diagnostics = "", -- | "nvim_lsp" | "coc",
    diagnostics_update_in_insert = true,
    -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
    --   return "("..count..")"
    -- end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    -- custom_filter = function(buf_number)
    --   -- filter out filetypes you don't want to see
    --   if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
    --     return true
    --   end
    --   -- filter out by buffer name
    --   if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
    --     return true
    --   end
    --   -- filter out based on arbitrary rules
    --   -- e.g. filter out vim wiki buffer from tabline in your work repo
    --   if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
    --     return true
    --   end
    -- end,
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    -- separator_style = "slant", -- | "thick" | "thin" | { 'any', 'any' },
    separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    -- sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
    --   -- add custom logic
    --   return buffer_a.modified > buffer_b.modified
    -- end

    -- USEFULE EXTRA TO NOT SHOW BUFFERS WHILE SHOWING TABS : START::::::::::::::::::::::::::::
    -- custom_filter = function(buf)
    --   local tab_num = 0
    --   for _ in pairs(vim.api.nvim_list_tabpages()) do tab_num = tab_num + 1 end
    --   if tab_num > 4 then
    --       return false
    --   else
    --       return true
    --   end
    -- end,
    -- END ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

    -- USEFUL EXTRA TO SHOW LSP DIAGNOSTIC ICON ON BUFFER : START::::::::::::::::::::::::::::::
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      -- local icon = level:match("error") and "" or "" or ""
      local icon = level:match("error") and "" or ""
      return "" .. icon
    end,
    -- END :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

    -- USELESS EXTRA TO DISPLAY LSP DIAGNOSTICS ON RIGHT OF BUFFERLINE : START::::::::::::::::::
--     custom_areas = {
--       right = function()
--         local result = {}
--         local error = vim.lsp.diagnostic.get_count(0, [[Error]])
--         local warning = vim.lsp.diagnostic.get_count(0, [[Warning]])
--         local info = vim.lsp.diagnostic.get_count(0, [[Information]])
--         local hint = vim.lsp.diagnostic.get_count(0, [[Hint]])
-- 
--         if error ~= 0 then
--           table.insert(result, {text = " " .. error, fg = "#EC5241"})
--         end
-- 
--         if warning ~= 0 then
--           table.insert(result, {text = " " .. warning, fg = "#EFB839"})
--         end
-- 
--         if hint ~= 0 then
--           table.insert(result, {text = " " .. hint, fg = "#A3BA5E"})
--         end
-- 
--         if info ~= 0 then
--           table.insert(result, {text = " " .. info, fg = "#7EA9A7"})
--         end
--         return result
--       end,
--     }
    -- : END::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  },

-- THEME SETTINGS:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  highlights = {
    fill = {
      fg = { attribute = "fg", highlight = "#ff0000" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },
    background = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },

    buffer_selected = {
      fg = {attribute='fg',highlight='#ff0000'},
      bg = {attribute='bg',highlight='#0000ff'},
      -- gui = 'none'
      underline = false, undercurl = false, italic = false
      },
    buffer_visible = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },

    close_button = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },
    close_button_visible = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },
    -- close_button_selected = {
    --   fg = {attribute='fg',highlight='TabLineSel'},
    --   bg ={attribute='bg',highlight='TabLineSel'}
    --   },

    tab_selected = {
      fg = { attribute = "fg", highlight = "Normal" },
      bg = { attribute = "bg", highlight = "Normal" },
    },
    tab = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },
    tab_close = {
      -- fg = {attribute='fg',highlight='LspDiagnosticsDefaultError'},
      fg = { attribute = "fg", highlight = "TabLineSel" },
      bg = { attribute = "bg", highlight = "Normal" },
    },

    duplicate_selected = {
      fg = { attribute = "fg", highlight = "TabLineSel" },
      bg = { attribute = "bg", highlight = "TabLineSel" },
      -- gui = "italic",
      underline = false, undercurl = false, italic = true
    },
    duplicate_visible = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
      -- gui = "italic",
      underline = false, undercurl = false, italic = true
    },
    duplicate = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
      -- gui = "italic",
      underline = false, undercurl = false, italic = false
    },

    modified = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },
    modified_selected = {
      fg = { attribute = "fg", highlight = "Normal" },
      bg = { attribute = "bg", highlight = "Normal" },
    },
    modified_visible = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },

    separator = {
      fg = { attribute = "bg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },
    separator_selected = {
      fg = { attribute = "bg", highlight = "Normal" },
      bg = { attribute = "bg", highlight = "Normal" },
    },
    -- separator_visible = {
    --   fg = {attribute='bg',highlight='TabLine'},
    --   bg = {attribute='bg',highlight='TabLine'}
    --   },
    indicator_selected = {
      fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
      bg = { attribute = "bg", highlight = "Normal" },
    },
  },
  -- THEME SETTINGS END::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
}
