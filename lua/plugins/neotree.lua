return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "kyazdani42/nvim-web-devicons",
    "3rd/image.nvim",
  },
  window = {
    mappings = {
      ["P"] = { "toggle_preview", config = { use_image_nvim = true, use_loat = true } },
    },
  },
}
