-- I put each section in separate files, loaded by Lazy
return {
	-- dap and dap-ui
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		event = "VeryLazy",
		config = function()
			require("dapui").setup({})
			-- add keymaps
		end,
	},
}
