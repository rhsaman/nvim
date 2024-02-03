return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = function()
		require("flutter-tools").setup({
			decorations = {
				statusline = {
					-- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
					-- this will show the current version of the flutter app from the pubspec.yaml file
					app_version = false,
					-- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
					-- this will show the currently running device if an application was started with a specific
					-- device
					device = true,
					-- set to true to be able use the 'flutter_tools_decorations.project_config' in your statusline
					-- this will show the currently selected project configuration
					project_config = false,
				},
			},

			debugger = {
				-- make these two params true to enable debug mode
				enabled = true,
				run_via_dap = false,
				register_configurations = function(_)
					require("saman.plugins.dapsp.dap").adapters.dart = {
						type = "executable",
						command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
						args = { "flutter" },
					}

					require("saman.plugins.dapsp.dap").configurations.dart = {
						{
							type = "dart",
							request = "launch",
							name = "Launch flutter",
							dartSdkPath = "home/flutter/bin/cache/dart-sdk/",
							flutterSdkPath = "home/flutter",
							program = "${workspaceFolder}/lib/main.dart",
							cwd = "${workspaceFolder}",
						},
					}
					-- uncomment below line if you've launch.json file already in your vscode setup
					-- require("dap.ext.vscode").load_launchjs()
				end,
			},
			-- flutter_path = "<full/path/if/needed>", -- <-- this takes priority over the lookup
			flutter_lookup_cmd = nil, -- example "dirname $(which flutter)" or "asdf where flutter"
			root_patterns = { ".git", "pubspec.yaml" }, -- patterns to find the root of your flutter project
			fvm = false, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
			widget_guides = {
				enabled = false,
			},
			closing_tags = {
				-- highlight = "ErrorMsg", -- highlight for the closing tag
				prefix = "//", -- character to use for close tag e.g. > Widget
				enabled = true, -- set to false to disable
			},
			dev_log = {
				enabled = true,
				notify_errors = false, -- if there is an error whilst running then notify the user
				open_cmd = "vsplit", -- command to use to open the log buffer
			},
			dev_tools = {
				autostart = true, -- autostart devtools server if not detected
				auto_open_browser = false, -- Automatically opens devtools in the browser
			},
			outline = {
				open_cmd = "30vnew", -- command to use to open the outline buffer
				auto_open = false, -- if true this will open the outline automatically when it is first populated
			},
			lsp = {
				color = { -- show the derived colours for dart variables
					enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
					background = false, -- highlight the background
					background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
					foreground = false, -- highlight the foreground
					virtual_text = true, -- show the highlight using virtual text
					virtual_text_str = "■", -- the virtual text character to highlight
				},
				settings = {
					showTodos = true,
					completeFunctionCalls = true,
					analysisExcludedFolders = { nil },
					renameFilesWithClasses = "always", -- "always"
					enableSnippets = true,
					updateImportsOnRename = true, -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
				},
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action), -- see available code actions, in visual mode will apply to selection
			},
		})
	end,
}
