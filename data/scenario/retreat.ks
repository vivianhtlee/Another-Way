;英军侵占费城
[showDate]
[america pos='r' feeling='normal' layer=0]
[image storage="Washington" pos=l visible=true layer=1]
[talk layer=message1 name="华盛顿"]
	英军要攻来这里。大概是冲着大陆议会而来吧。[l][er]
[talk layer=message1 name="阿美利加"]
	怎样应付?[l][er]
[talk layer=message1 name="华盛顿"]
	我主张撤退，以我们的军力无法死守费城。[r]
	但大多数将军希望留守……[l][er]
[layopt layer=0 visible=false]
[layopt layer=1 visible=false]
[layopt layer=2 visible=false]
[eval exp="tf.i=1"]
*next_day
[call target=*preparing1]
[eval exp="tf.i++"]
[jump target=*next_day cond="tf.i<6"]
[call target=*26]
[call target=*preparing2][call target=*preparing2][call target=*preparing2][call target=*preparing2]
[jump storage="work.ks" target=*endwork]

*preparing1
;change_day
	[showDate]
	[delay speed=nowait]
	[actionDialog]防守中．．．[wait time=&tf.delayTime][er]
	[endif]
	[eval exp="f.day+=1"]
[return]

*preparing2
;change_day
	[showDate]
	[delay speed=nowait]
	[actionDialog]撤退中．．．．．．[wait time=&tf.delayTime][er]
	[endif]
	[eval exp="f.day+=1"]
[return]

*26
	[showDate]
[america pos='r' feeling='normal' layer=0]
[image storage="Washington" pos=l visible=true layer=1]
[talk layer=message1 name="华盛顿"]
	英军占领了费城。我们撤退至内陆地区吧。[l][er]
[talk layer=message1 name="阿美利加"]
	明白了。[l][er]
[layopt layer=0 visible=false]
[layopt layer=1 visible=false]
[layopt layer=2 visible=false]
[layopt layer=message1 visible=false]
;转背景+特效
	[backlay]
	[image storage="Couder_Yorktown_Versailles" layer=base page=back]
	[trans method=universal rule=universal_1 time=1000 children=false][wt canskip=true][wait time=100]
[eval exp="f.stage='B'"]

[layopt layer=0 visible=false]
[layopt layer=1 visible=false]
[layopt layer=2 visible=false]
	[eval exp="f.day+=1"]
[return]
