require("Comment").setup({})

local ft = require("Comment.ft")
ft.javascript = { "//%s", "/*%js/" }
ft.javascript = { "{/*%s*/}", "/*%jsx/" }
