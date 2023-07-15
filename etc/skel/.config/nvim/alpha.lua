return {
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		opts = function(_, opts)
			local dashboard = require("alpha.themes.dashboard")
			local logo = [[
          _..--¯¯¯¯--.._
      ,-''              `-.
    ,'                     `.
   ,                         \
  /                           \
 /          ′.                 \
'          /  ││                ;
;       n /│  │/         │      │
│      / v    /\/`-'v√\'.│\     ,
:    /v`,———         ————.^.    ;
'   │  /′@@`,        ,@@ `\│    ;
│  n│  '.@@/         \@@  /│\  │;
` │ `    ¯¯¯          ¯¯¯  │ \/││
 \ \ \                     │ /\/
 '; `-\          `′       /│/ │′
  `    \       —          /│  │
   `    `.              .' │  │
    v,_   `;._     _.-;    │  /
       `'`\│-_`'-''__/^'^' │ │        
              ¯¯¯¯¯        │ │
    ____ ____ ____ ____    │ /
   ||l |||a |||i |||n ||   ││
   ||__|||__|||__|||__||   ││
   |/__\|/__\|/__\|/__\|   │,
        ]]
			opts.section.header.val = vim.split(logo, "\n", { trimempty = false })
		end,
	},
}
