return {
  "lopi-py/luau-lsp.nvim",
  ft = "luau",
  config = function ()
    require("luau-lsp").setup({
      platform = {
        roblox = true,
      },
      sourcemap = {
        enabled = true,
        autogenerate = true,
        rojo_project_file = "default.project.json",
        sourcemap_file = "sourcemap.json",
      },
      plugin = {
        enabled = true,
        port = 3667,
      },
    })
    vim.lsp.config("luau-lsp", {
      settings = {
        ["luau-lsp"] = {
          completion = {
            fillCallArguments = false,
            addParentheses = false
          },
          hover = {
            multilineFunctionDefinitions = true,
            showTableKinds = true
          }
        },
      },
    })
  end
}
