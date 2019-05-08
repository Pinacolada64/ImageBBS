C64List	filename	C64 filename	Purpose			Starting
								line number
`plus_*`		`+.*`		System command		3000
`plus_XX_YY*`		`+.XX.YY*`	Sub-module YY of XX	4000
`plus_XXslashYY*`	`+.XX/YY*`	Sub-module YY of XX	3000
`plusslashlo_*`		`+/lo.*`	Idle command		4000
`plusslashlo-*`		`+/lo-*`	Login module		4000
`plusslashloslash*`	`+/lo/*`	Automaint module	4000
`plusslashXX_YY*`	`+/XX.YY*`	Sub-module YY of XX	4000
`im_xx*`		`im.xx*`	im sub-module		60000

- sd2iec devices interpret `/` in filenames to an invalid pathname
