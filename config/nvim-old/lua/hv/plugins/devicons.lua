return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    local colors = require("onedark.colors")
    local icons = require("nvim-web-devicons").get_icons()

    -- Ruby
    local ruby_icons = vim.tbl_filter(function (icon)
      return icon.icon == "" or icon.name == "Erb"
    end, icons)
    for _, icon in ipairs(ruby_icons) do
      icon.color = colors.red
    end

    require("nvim-web-devicons").setup()
  end,
}
