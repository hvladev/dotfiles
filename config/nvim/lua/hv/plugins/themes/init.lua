return {
  vim.tbl_deep_extend(
    "error",
    require("hv.plugins.themes.onedark"),
    { cond = true }
  ),
}
