return {
	"mxsdev/nvim-dap-vscode-js",
	dependencies = { "mfussenegger/nvim-dap", "Joakker/lua-json5", build = "./install.sh" },
	ft = { "javascriptreact", "javascript", "typescript" },

	config = function()
		require("dap-vscode-js").setup({
			debugger_path = "/Users/saman/vscode-js-debug",
			-- debugger_cmd = { "npm test" },
			adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
		})

		for _, language in ipairs({ "typescript", "javascript" }) do
			require("dap").configurations[language] = {

				-- {
				-- 	type = "pwa-node",
				-- 	request = "launch",
				-- 	name = "Launch file",
				-- 	program = "${file}",
				-- 	-- port = 3002,
				-- 	cwd = "${workspaceFolder}",
				-- },
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach",
					processId = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
				},
			}
		end
	end,
}
