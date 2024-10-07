#!/bin/sh

if [ "$(id -u)" -ne 0 ]; then
  echo 'This script must be run by root' >&2
  #echo "You may need to be root to run this BriefTiel 💼🐦script properly."
  exit 1
fi

if [ $# -lt 1 ]; then
  echo 1>&2 "$0: not enough arguments"
  exit 2
elif [ $# -gt 1 ]; then
  echo 1>&2 "$0: too many arguments"
  exit 2
fi

#https://textfancy.com/text-art/
mkdir ~/.flxworkdir
cd ~/.flxworkdir
#                   ▄▄             ▄▄▄▄           ▄▄            ▄▄
#▀███▀▀▀██▄         ██           ▄█▀ ▀▀ ▄▄█▀▀▀█▄█ ██          ▀███
#  ██    ██                      ██▀  ▄██▀     ▀█               ██
#  ██    █████▄███▀███   ▄▄█▀██ █████ ██▀       ▀███   ▄▄█▀██   ██
#  ██▀▀▀█▄▄ ██▀ ▀▀  ██  ▄█▀   ██ ██   ██          ██  ▄█▀   ██  ██
#  ██    ▀█ ██      ██  ██▀▀▀▀▀▀ ██   ██▄         ██  ██▀▀▀▀▀▀  ██
#  ██    ▄█ ██      ██  ██▄    ▄ ██   ▀██▄     ▄▀ ██  ██▄    ▄  ██
#▄████████▄████▄  ▄████▄ ▀█████▀████▄   ▀▀█████▀▄████▄ ▀█████▀▄████▄
#
# -By Flx DL_______
#▒▄▀▄░█▒░▒█▀▄░█▄█▒▄▀▄░░░█▀█░░░█▀█░▄█
#░█▀█▒█▄▄░█▀▒▒█▒█░█▀█▒░░█▄█░▄░█▄█░░█
#█▓▒▒░░░(Zone 0: Base and generics)░░░▒▒▓█
#
#8@@8@@@@8@8@@8@@@@@@@@@@@@@@@@X@XXXXXXXXXXXXXXXXXXXXSXXXXXXXXXX@XX@X@X@XX@XXX@X@X@X@@X@X@XX@X@XXXX@XXXXXXXXXXXXXXXXXXSXXSXXXSXSXXXSXSXSXXSXSXSXSXSSS%%
#8@8@88@8@8@8@@@@8@@@@@@@@@X@XX@XXXX@XXXXXXXXXXXXXXXXXXXXXXXXX@XXX@X@XX@@XX@XX@X@X@@@X@@@@@@X@X@X@XXX@X@XX@XXXXXXXXXXXXXXXXSXXXXXSXXXSXXSXXXXXXSSXSSSS%
#8@8@8@8@88@88@8@@8@@@@@@@@@@@@X@X@@X@XXXXXXXX@XXXXXXXXXXXXXXXXX@XXXX@@XX@X@@@X@@@@@@@@@X@@@@X@X@X@X@XXX@XXXXXXXXXXXXXXXXXXXXXXXSXXSXXXXXSXXSXSXSSSSSSS
#8888@8@88@88@888@8888@88@8@@@@@@@X@@X@@X@@X@XXXX@XXXXXXXXXXXX@XX@X@XXXX@X@XX@X@@X@@@X@@@@@@@@@@@X@@@@X@X@@X@XX@XX@XXXXXXXXXXXXXXXXXXXXSXXSXXXXXXXSSSS%
#88@888888888@8888@8@8@@8@@@@@@@@@@X@@@X@X@X@X@@XXXXXX@X@XX@XX@@XX@XX@XXXXX@X@@X@@@@@@@@@@@@@@@@@@@XX@@@@X@X@X@XXXX@X@XXXXXXXXXXXXXXXXXXXXXXSXXSSXSXSS%
#888888@88@8888@888@888@@88@8@@8@@@@@X@@@@@X@X@X@@X@X@XXXXXX@XXXXXX@@X@@@@@@X@@@X@@@@@@@@@@@@@@@@@X@@@X@@@X@X@X@X@@@XXXXX@XXXXXXXXXXXSXXXXSXXSXXSXSSSS%
#88888888888888888888@8888@8@8@@@@@@@@@@X@@@@@@@@X@X@X@@X@@@XX@@S:t@88SXX88S:@@@@@@@@@@8@@8@8@@@@@@@@@@@X@@@X@X@X@XX@@X@XX@X@X@XXXX@XXXXXXXXXXXXXSXSSSS
#88888888888888@888888888@8@88@8@8@@@@@X@@@@@@@@X@X@@@@X@@XXX8S:8;%S%%t;;::. XS8@@8@88@8@8@8@8@@8@@@8@@@@@@@X@X@@X@@XX@X@XX@X@X@XXXXXXXXXXXXXXXXSXSSSS%
#8888888@88@88@8@888888888888@8@8@@@@@@@@@@@@@@@@@@@@@X@@@@@X 8@@8X@XS%t:;;;::; 8X88@88@8@8@8@8@8@@@@@@@@@@@@@@@@@X@@XX@X@XX@XX@XXXXXXXXXXXXXXXXXSXSSS%
#88888888@888@8@8@888888888888@88@@8@8@8@@@@@@@@@@@@@@@@@@8;StSt:;;%tS8XSXX@8@8Xt8@88@88888888@8@8@8@8@@8@@@@@@@X@@X@@@X@X@@X@X@X@XXXXXXXXXXXXXXSXSSSS%
#888888@88@8X888888@8@8@8888@888888@@8@@@@8@@@@@@@@@@@@@@8S..t8@:@ @@:t;St.8 ;8.S8@8@888888888888@8@@88@8@@@@@@@@@X@@@@@@@X@X@XX@XX@X@XXX@XXXXXXXXSSSSS
#88888@88888888@8@88@8X8@8888@88888888@88@@@@@@8@@@@@8@@88X.8SX8: %S..:  :8;X8; @88@8@88@8888888@8X88@@8@@8@@@@@@@@@@@@X@@X@@@@@X@X@XX@XXXXX@XXXSXSXSSS
#88888888888888888@8@88@8@8@@8888@888@8@8@8@8@8@8@@8@8@8X 8: 888%@8@ S8  X::;. 8888@888@8@8@8@888@88888@88@8@8@8@@@@@@@@@@@XX@X@X@@X@XX@XXX@XXXXXXXSXS%
#88888888@8@88888@8@8@8888@888888@8888888@8@8@88@8@88888%@@t88888%S;.8X%88@88tt8S8888@888888@8@8@8888888@88@8@8@@@@8@@8@@@@@@@@@@@X@X@@X@X@XXX@XXXSXSSS
#88888888888@888@8@8@888@88@88@8888@8@888888@8@88@88@88X:SX@@8@888%:.;@%%%@SXX8 8888@8888888@@8@88@888888@88@8@8@8@@8@@8@@@@@@@@@@X@@X@X@X@X@XXXXXXSXSS
#8888888888888@8888@888@8@888@8888X8@8@88888888888888@8t8XS888@888888 S ;8S@; %.88888@88888888888@8@88888@@8888@8@8@@8@@8@8@@@@@@@@@@@@@X@X@@X@XXXXSSSS
#8888888888888888888888888@8@8@8888888888888888888888@@@SSt@88@8888%8..8: .  8:@888888888888@88888888@88@888@@88@8@88@88@@@@8@@@@@@@@@X@@XX@XXXXXXXXXSS
#88888888888888888888888888888@88888@8@8@88888888888888tS;@@;8888@88::. 8.8;88X88888@88@888888888@8@@8@88888888888@8@88@8@8@@@@@@@@@@@@@X@@X@@X@XXXXSSS
#888888888888888888888888888@8@8888@8@8@8@888888888@8@X@.X%t8.8%X88.:...:8;tt:XX%;@88@88@888@8888888888@8@888888@88888@8@@@88@@@@@@@@@@@@@@@X@@XXXXXXSX
#8888888888888@8888888888888888888@8@888888@8@8@8@@888X. XS8X%:..:...:::t88@.tS@:8% @8@888888@8@8888@8@8888@8@8888888888@8@@8@8@@@@8@@@@@@@@@@X@@XXXXSS
#88888888888888888888888888888888@8@88888@88@8@8@888@@@  X88  X8Xtttt;;ttX8t S@8X.:: X8888888888@8@88@8@8@@8@8@8888@8@88@8@8@@8@8@8@@@@@@@@@X@@X@XXXXXS
#888888888888888888888888888888888@88@8888@8@88@8@8XS8: 88@8X 8X .t@@888XSXX 88St8 XSt88888888888@8@8888@8@88@88888888888@8888@@8@@@@@@@@@@@@@@@X@XXXXS
#88888888888888888888888888888888888888888888888@88tt.t.@@@888 .; ..S@@@8@tXXt 8 8t. 888888888888888@8@8@@8@8@8@8888@8888888@88@88@8@8@@@@@@@@@@@@@@XXS
#88888888888888888888888888888888@8888888@8@8@888; .XS::888 @8  .:%X@@@@Xt@S8X; 888t.. 888888888@8@88@8@8@88@8@8@8@8888888888888@88@8@8@8@@8@@@@@XXXXXX
#888888888888888888888888888888888@88888@8@8X88@X8 @@:.S.8 8::.t;SSX@%XX888@8:;t; X.;Xtt.8@8888@8@8@888888@8@8@@8@8@888@@8888@888@8@8@8@@8@@@@@@@@@XXXX
#888888888888888888888888888888888888888888@88@8 8@StSX8X; @X .%8@888888@SS@@X8%%S8;:t8@;t8@8@8@88@88888@88@8@8@888888@88888888888888@888@88@@@@@@@@XXX
#8888888888888888888888888888888888888888@888@8 X8X@8 8%:S :. .t%tt%@88XSX88S@X@8@8;:tS@88 %88888@8@8@8@8@88888888888@8@88888888888888@88@8@8@8@@@@@@XX
#88888888888888888888888888888888888888888@8@8 888888 .S ttS%XX@XS8888888@888888X888:::;XX S88888888888@88888888@88@8888@8@88@8@888888888@88@8@8@@@@@@X
#@888888888888888888888888888888888888888888@ @.%888  .8.:@88X88888888888@@88888@XX8:.;t%8t888888888888888@888888@88888@888@8888@8@8@8@888@888888@@@@XX
#@88@88888 @ @ @888888888888888888888888@8@8X: @ 8@..::..;@8888888@X@X@88@@88888@t%8..;X;Xt8888888888888@888888888888888888888@88@888888@@888888@88@@@@
#@@88@@ 8888888 @ @ @88888888888888888888@8X ; .X.:.t88 :S8888888888888@888888@SXX:8 ..::8S8888888888888888888888888888888888@888888@8@88@8@8@888@@8@@@
#@@@8@888 8 @ X88888 @ @ X @888888888888888X  .  ;t888:.:S8888888@@@888X@88888S@@  8.....8S@8888888888888888888888888888888888@888@8888@88@8@88X88888@@
#@@@@888888888 @ 8 X8888888 @ @ @8888888888S@X@;@%888@..;S888888888888888888@8@@:  ..  . X%888888888888888888888888888888888888888@88888888@8@88@888@8@
#@@@@@ 8 8 @ X88888 @ 8 8 X88888 @ @8888888@:888@88tS:.:SX88@X8@888888888888@SX; S8...  .8 88888 @ @ @ @ @ @ @888888888888888888888888888888@8@8888888@
#@@@@88888888 @ 8 X8888888 @ 8 X888 @ @ X888 %X88S88;::S8@88@X8X@888888X8888@XX.@% .. . .:8@X@ 8888888888888@ @ X888888888888888888888@888888@8@8@8@@88
#@@@X@@@8 8 X88888 8 8 8 X88888 @ X88888 @88S@@X8X8@..;@88888@@88888888S@@88SX8;t@S @ X XSSX 88 8 8 8 8 8 8 8888 @ @ X888888888888888888888888@8@8@8@88
#X@X@ 8 @888 8 8 @8 X X X 8 8 88 @.8 8 @8 @8S%@88;8:..;%X;..;888888XXXS:;@;t;;.::t8t%S:8; SS@ 8 8 88 @ @ @ @.8 @88888 @ @ X88888888888888888888888@88@8
#XXX8888 8 @88888 88 X X @ X @.88 @ @ @.88 @ S8@@t@. .:.8 SX%Xtt@@ttt;::::::.....;8;X:888:    8 8 8 8 8: 8 88S%8 8 8 8 @88 @ @ @8888888888888888888888@
#XXX 8@8888 8 8 88 88 X @ @ 8.8 88 8 8 8 888 S%8;t:   ...88@;.:@.:;;t%XX@88@@StXX@X88SS S.%%888X8 8 8 % %t88888..: ;XSS.;X88888888888888888888888888888
#XX@8 8 8 888888.88 8 8 88 8 8 8.8 8 8 8 8.8 8;;:..    ..S8X8  %.8..tX@88@%S:.@ S@8tS%@8SS8%.S ;%:;..   .:;t%%SS8@S%ttt;S8%% @ @ 8 @ @88888888888888888
#SX 888888 8 8 88 8 8 88 8 8 8  8.8 8 8 8 8@;X...... .X8;;8 %8%%S%8  .::.888 :S8;X. ;@%.@8S;;.tX@@88XSSt;::... ;X: .::;%%SX:X X888888 @ X88888888888@8@
#SX@ 8 8 88 @ @ 88 8 @.8 88.8 8  8.8. 8 8  @X:.....X@XX88St...8S;.@8:;;;tt;t%t888@: 88t;@@S8%t;::.   . .::;t%%X@ SS;:.:;t%%@%8 8 @ 88888 @8888888888888
#S 8@ 8 8 88 @ 8 88 8 8 8: 8.  8. 8 8. @ %88 .      88t@SSS@X8@S8S8S8XSSS:  88S.t88%;:..::;tt%X@88X%t: .;tSX8888;88: .:.::;:% X8888 8 888 @888888888888
#S@ 8@ 8 8 8 88 8.88 8 8:@ 88;;8S. : 8%X8      SS888 XX88@8@X. ::; 8SX@8XS: .   :;tS@8@S%:..;%X8888 8     :.... % @;;%%SXXSXX 8 8 @888 @88 @ X X8888888
#SXX 88 8 88 8 8 8 8 88t;S8:8X888t.:;8888%tt;:. .;;S@@888@X%@;;::  .:;t%X@88X%: .;%X@888@@ X      . : ...:::::::8: t@SXSSSXX 88888 8 X8 @88888@ X888888
# @ 8 8 8 8 8 8 8 8 88.;@@%:.;;;;;. 8:%8@X%%;;:...  . ..:t%X@88X%: :%SX888@ @      .....:.......::;;;%;;;tSSXXSS8S@SX@@@S@@t8SX@ 8888 X8 8 @ @88 X88888
# @@ 8 8 8 8 8 8 8 8t:88t:.tX8X%;::.t@.  . . ..:;tSX88Xt..tS888XS S    ..:.... .:.::t%SSXSSXSSSXXSSSS@@%XXXSXSX%88@SXSXS@SSS8XX@8 8 @8 @88888 @88888888
# X 8 8@ 8 8 8 8 8 8%SS;8::..  . . .:tt%X888St: :tS@88@S S     .  ...::;%%S%:;tSSX@8SSSSSSSSSSSXXXX@SXX@SSSS@SX@888.:...  S@@SXX8888 @8 8 @ @8 @8 X8888
# @X 8 8 8 88 8 8 8  % @8%SX@888St:  .S88X @     ..::;:::::;:ttSSXSXXSXXXSXXX@SXXXXSX8XXS@t@SS@8X8S%XXXXXSSXXXXS88@88@S   .; @XX 8 88 88 X X X8 X888888
# X 8 8 8 8 8 8 8 88  X %:tS@888@ 8 8X ;:..;.:::;tSX@8@@%@SXSSXSSXSXX8SS@@SXSX@S@S@S@S8SXSXSXS@@@%@X@SSXSSSS8SSS88.8888888@S8SS@888 88 88 X X @8 @ @888
# @ 8 8 8 8 8 8 8  8 8X8      .:..:.:@ SX@SSSSSSSXXXXXXSXSXSS@%@%X%X@S8XXSS8SSS@S@SXX@SS8@SSS@XSX@SXSXXSSSX@SSX@XX X@@X@@X8S8%S 8 88 8 888 X X @888 @88
# @ 8 8 8 8 8 8 88 8 @ 8  :t%XSXXSSS@.X88@X@@XXSXSSSSS%SSSSXXS@S@S8S8@SSSX@SSXS@X8SS8S@XXSX@XSS8S@SXXXSSS8SXS@X8S8 t8@@X@X8SX 8@ 8 88 @.888 X X 8888 @8
# @ 8 8 8  8 8.8: 8 8 8@; S8@@@@8XXX@.S88XXXSXXX@SSXSXX@SSX8SXX@SSXXXSSSXSXXXSSXSXX@S@SSXXXXS@8%@S@S8SXXXXS@S@SSS8X@@X@X@X8X8S 8@ 8 8 88.8 @ @ X 888888
# @ @ @  8 8 8  8 8 8 8%S@%8XSXXSSSSSt t@XXXXXXSXXXSXX@SX@@SSXXSXX@S8XXSSSXSSXSSX@8S@X8S@SS@SXX@X@SS@@SXSXXX8S@SS8SSX@X@XX8S8 8 8@ 8 @.8 8 8 8 @8 88 @8
# X 8  8 8  8.8 8 8  8  X@:8X@XXXXXSX% .8@@@X@XXXXXXXSXXSXSXSXXSXSX@XSSSSSSXXXX8S@SSSS@@%SS@SSX8X@X@88SX@%SSSSSSS8SX8@XX@X8S8 8  8 8 8 8 88 8 @.88 @8 8
# X @ 8 8 8  8 8.@.8 @t XX 8XXSSX%;  @XSX8X@@@X@XXXXXXXXSXSXSSXXSXXSSSSSSS8SSXS8XXXXX@88S8XSSXSS@S@S@SX@SX@8%@SSX8S8@XXXXX8S8 8@ 8 8 8 8 8 8 8 8 88 @88
# X @ 8  8 8  8.  8.@8  :8X@8@X@8@@X@88 S8@@@@@@XXXXXXXXXSXXSSXXXXSSSSSSX@SXX@XXXSSSSX@SX@8S8SX@S8SS8S@@@S@X8S@XS8 S8XXX@X8%8  @ 8 8 8 8 8 8 88 8.88 8@
# X @  8  8.8  8 8.  . .8 X .;@S@88888SS%@88@@@X@@X@X@XXXXXXXSSXXSSXSSSSSSSXSSXX@X@S@SXX@@8XX@XX@88X@XX@%@SX%@S8S88SXXSXXS8;8 @   8.  8.8.8 8.8 8 8 8 8
# S  8  8    8  8: 8    8t@X;88888@@@8St%88@@@@@@XXXX@XXXXXSXSXXSSSSSSSSSSSSXSX@SSXXS@X8S@S@@88@8@S@SXSSSSXS@%X%X8X@8SSSXS8.@  @ @. 8  8. 8  8 8 8 8 8
# SX  8  8 8  8. @  8..88X8 8888888888X 88@8@@@X@@X@XXXXXXXXSXSSXSXSSSSSSS8%8XXX@@S@S@XX@@8XS@S@X@XXSX%XSXS@XSXXS@SSSSSSS%8 S      8. 8: 8.8  8.8 8 8 8
#   8  8  8.8. @. @   :SS88S8888888888SX88@8@@@@XX@XXXXXXXXSXSSSSSSSSSS8X@S@%@%@SX@SXS8XSXS@SX%@XSXSXSSS@S8SXSS@X88%X%@@8@8 ;. S        @:  8. @. 8 8 8
# X  8  8.      @.  8 ; ;8@888888888@@@ ;S@@@@@X@XXXXXXXXSXSSSSSSSSSSX@S8S@S@%@SX%XS@SSX8@SXXSXtXSXXSXt@SSX8@SXXX@8tXSSSSSXXt    X   8    @. @. 8  8.8
#  X     8 8 8    @   .S.8S8@888888@@@X .X@@@@X@XXXXXSXSSSSSSSSSSS8SSS8@SXS@SXSX%XSXtXSSSXXSXS@XtXSX%SS@XSSS88SS@88;X%%;%;X@;:       .           8. 8.@
#    8 8:      8    @ :  8 %:@@88@@@@XX  8@@XXXXXXSSXSSSSSSSS8S8SSSS@SSXSSXSXSXSSXXS@@XSSSS%X@8SSSS@@@XtXX%XSttSt88.;:... %8.t:..              8:    @
#  X      8. 8:  8      88 S 8X@@@@@XSX X88X@XXXSXSXSSSSSSS8@X@@8SS@S88%@S@SXSSSSS88S8XSSXXSSX@@XSXXXSSX%S%;;%%%t8@    S S X.X%t;::..          .  8
#    X  @..          @: 88.S@8X@@XXXXSX:X88XXXSXSSSSS%S%@X@SX8SXS@X@SXSSXXtX%SS%X@88@%XSX@%XS%S%SS%%%SStt;t;;;;:.SX@X8@X@X ;.XtSS%tt;:.....       . @ @
#                       XXS%S8XXXXXSXSS%XX8XXSSSSSS%@%XX88tXXS@@S@X@XS88SS@SX;SX@SS@S@XSStS%%ttttt;;;;..        S%S@@@@@@8X; XSS@8SXXX%ttt;;.:..    @ 8
#                       8;8S;X@XXXSSS%@S  8SSSS%S%8@%X@SXSX%@SSXXSSS88%XX@XX%S%XStS%SS%%%%tt:::.       S X 8XX@X :t@888888S:.8XXS@t.  8@8@t:.tX88Xttt..
#                       8 8@ %8XSSSSS@SX  8SS%@%X@@8SXtX@SS8SXSSSS%@@%SSSX%%t%%%%;;t:..::.      S XSSXXXX@@ 8X 8@.;8888888@;XtXXX88@XSXXXSSS%S%%%%%ttt;
#...        .......:.:..8@88; 8%8%S%@SS% 88SSX%@@8XtStX%XS@SXt%%S%tttttt;::...:        S S @XX@@X@SXXXXXXX88X88@X.:8888888@t8X88888888888@@@XXXXSS%S%%t
#:;;;t;;.::....:::::.::.X8@@S88XS@SXSS%X 8@SXSX%@%SXSS%S%%%%tt;;:..:...       S X @SX@X 8X@X 8XX 8XXXX@X@@@@@@@@X  8888888@;@S@8888888888@@@@@SXXSXS%%t
#t@SXSXSS@%XSSt;:.   XS8@8 SXt@X8XSX@SS% S%@SXSX%SXSt%t%;;;:..       S X @XX@X 8S@ @SS@8 8X@8XX88@@X@@@@@@@8@8@88 ;88888888;8SX@888888888888X@XXXSSSS%%
#. ;;t%SX888888@XS%t%%8t@.% @%;St%tt;:.  ; t%ttt;:.:...      S XSSXXX 8XX 8 8X8 8@8XXXX@8@XX@X@@@@@@@8@88888888888;88888888:XtSS@888888888@@XXXXXXSSS%%
#X@@8@8@@@@8@8@@@@@@XXXt8X8 S8 :. .   SXSt8%::       S X @SXSSX @ @ 8@ 8X@X8 8@8X 8@ 8@@@ 88@@@@@88888888888888@88;88888888 %:%SX@8888888@@X@XXXXSXSSS%
#X@@@@@8@@@@8@88@@8@@@@88@tX X8  S @XXXXStXt  S S @X @ 8X @ @ 8XXXX@ 88 8XX@8 8@88@888@@8888@88888888888@88888888@;888@8@@8.;.%S@88888@@@@XXXXXXXXSSS%%
#@@8@888888@8888888@88888StXXt  8X8X@@@88X:.S XS 8 @XXX 8XX@X@ 8 8 88 88X@@@8888@8888888888888888888@88@8888888@8S;SS%%S88XX8;S888@@@@@X@X@X@XXXXSSSSS%
#@@8888888@8888888888888X;S.8SXS@@@@88888@: SX @X 8 @ 8@ 8 8 88@888@88@8@@888888888888888@888@888@8@8@@@@88@@X%tS%.8 %%t%t8.@@XX@X@@@@@X@XXXXXXXXXXSS%%
#@8888888888@8@8@8@88888@.tS@X8@@888888888;X XX%X@X@X8 88@888@@@@@8888888888888888888@888888@88@@@8@XXSXX@8  ;X88XSt 8 X8@XSXXX@@@@@@X@@@@@@XX@XXXXSSS%
#8@8888888888@8@888@88888t8t8@t88888888888:@ @XSXXXX@8888888888888888888@88888888888@88@@@@XXS@88  ;S@88@S 8% S8XSX%%%XSXXSSXXXXXXX@X@@XXXX@XXX@XXXXXS%
#8888888888888888888@8888X8S8;;%@888888888..S@@@@@88888888888888@888888888888888888@XS%t%S8 %S..:@S %t8Sttt%SXSSXSSSSXSXSXXSXXXX@@@@X@@@@X@XXXXXXXXSSS%
#88888888888888@8@8@888888%@X:; @888888888::X8888888888888888@888888888888@XXXX@88 .t@888@; XS.S8Xt;%%SSSXXXXSXXSXXXXXXXXXXXXXXX@X@@X@X@XX@XX@XXXXXSX%%
#8888@88888888@8@8@8888888%8XS%S888888@@@@tS8888888888888@88@88@@XXXX@88 :%8888Xt 8S S8X%t%t%SSSSSSSSSSXXXXXX@@@XXXXXXXXXXXXXX@X@@X@@X@X@XXXXXXXXXSSSSS
#8888888888888888@8@8@88888:X8888@8@@@@XXX%S%88888888888@8@X%ttS8  Xt:.:8t ;%@tt;:t%%SS%S%S%%SSSXXXX@XXXXX@@@@@@@@@@@@@X@@X@@X@@X@@XX@@XXXXXXXXXXSSSSS%
#888888@888@8@88@888@888888tt8@XS@X@XXSSSS%X 88@@@XSSX@8  :S@888S: 8t:X8@S;;tt%%S%S%SSSSSSSSXXXXX@@XX@@@@@@@@@@@@@@@@@@@@X@X@@X@XX@@@X@X@XXXXXXXXSXSS%%
#@8@88888888@8@8888@8@@88888;8SS.@SSS%tt::;@;8X .S8888S.X8t;8@%%%;:tt%%%%%%S%SSSSSSXXXXXXX@X@X@@@@@@@@@@@@@@@@@@@@8@@@@@@@X@XX@X@X@XX@XXXXXXXXSSSSS%S%%
#@888888@8@8@888@88@@8888@88% SS@t.  :S@.XX;:.;S 8 8S;:::;ttt%t%%t%%%%SSSSSSSXSXXXXXXXX@@X@@@@@@@@@@@@@@@@@@@@@@@@@@@@@X@X@XX@XXX@XXXXXXXXXSSSSSSS%%%%t
#@@@88@@@@@@8@88@8@8@8@@8@@8@@;:.SX8888t:SX.%8SStt;tt%%%%%%%%%%%%S%SSSSSSSXXSXXXXXXXX@XX@@X@X@@@@@@@@@@@@X@@@X@XX@X@XX@XXXXXXXXXXXXXXXXXXSXSSSSSS%SS%tt
#X@@@@8888@8@@@@@@@@@X@X@@X@@8::..%88SSX%t%t%t%%%%%%%%%%%S%SSSSSXSXSXXXXXXXXXXXXX@X@XXX@XXXX@XXX@X@XXX@XXXXXXXXXXXXXXXXXXSXSSSSXSSSXXSSSSSSSSS%%%%%%tt;

dnf -y —refresh upgrade

### Shell parts 01010101 XO
## Making sure everything is there...
dnf -y install adduser git wget ranger eza zsh htop btop ripgrep vifm

adduser flx
# https://stackoverflow.com/questions/714915/using-the-passwd-command-from-within-a-shell-script
passwd flx

## NEOVIM Instalation section ###
# Sources:
# https://fedoramagazine.org/configuring-neovim-on-fedora-as-an-ide-and-using-lazyvim/
# https://www.lazyvim.org/installation
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
#
# Main installation
dnf -y install neovim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

## Installing kitty (my fav' terminal) <^-^>
# Source: https://sw.kovidgoyal.net/kitty/binary/
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

## desktop integration on Linux part...
# Create symbolic links to add kitty and kitten to PATH (assuming ~/.local/bin is in
# your system-wide PATH)
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
# Place the kitty.desktop file somewhere it can be found by the OS
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
# If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
# Update the paths to the kitty and its icon in the kitty desktop file(s)
sed -i "s|Icon=kitty|Icon=$(readlink -f ~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
# Make xdg-terminal-exec (and hence desktop environments that support it use kitty)
echo 'kitty.desktop' >~/.config/xdg-terminals.list
## End of kitty installation <^-^>
#
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## oh-my-zsh config: load my powerlevel10k config ;)
# Source: https://github.com/romkatv/powerlevel10k
#
wget https://raw.githubusercontent.com/felixdumaslavoie/BriefTielScripts/refs/heads/main/pl10kconf/.p10k.zsh
wget https://raw.githubusercontent.com/felixdumaslavoie/BriefTielScripts/refs/heads/main/pl10kconf/.zshrc
cp -f .zshrc .p10k.zsh ~/.
## Extensive aliases section ;)
alias gaa="git add --all"
alias gc="git commit -am "
alias gpm="git push origin main"
alias gs="git status"
alias ls="eza --icons"
#disable virtuals desktops option called "overview" in KDE desktop effects settings page. Just turn it off...

## ENDDDING!!!
rm -rf ~/.flxworkdir
