return {
	-- change dashboard's banner
	{
		"goolord/alpha-nvim",
		opts = function(_, dashboard)
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
			dashboard.section.header.val = vim.split(logo, "\n", { trimempty = false })
		end,
	},
}
