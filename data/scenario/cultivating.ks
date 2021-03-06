*cultivating_start
[showDate]
[workPicture work='farming']
[america pos=l layer=1 feeling=normal]
[talk layer=message1 name="阿美利加"]
[if exp="f.cultivation==0"]内陆的农地要先开垦才能开始种植。[r][endif]
	开始干活了！[l][er]
[eval exp="tf.tfCultivation=0"]
[layopt layer=1 visible=false][layopt layer=3 visible=false]
[call target=*cultivating_dayly]
[call target=*cultivating_dayly]
[call target=*cultivating_dayly]
[call target=*cultivating_dayly]
[call target=*cultivating_dayly]
[call target=*cultivating_dayly]
[call target=*cultivating_dayly]
[call target=*cultivating_dayly]
[if exp="f.year==1780&&f.month==2&&f.day>20"]
	[call target=*cultivating_dayly]
[endif]
[if exp="f.day<=20||f.month!=2||f.year!=1780"]
	[call target=*cultivating_dayly]
	[call target=*cultivating_dayly]
[endif]
[if exp="f.day>=30&&(f.month==1||f.month==3||f.month==5||f.month==7||f.month==8||f.month==10||f.month==12)"]
	[call target=*cultivating_dayly]
[endif]
[if exp="f.day>=25"][eval exp="f.day-=1"][endif]
[layopt layer=message2 visible=false]
[bottom layer=message1][delay speed=user]
[if exp="f.cultivation<30"]已开垦农田的[emb exp="Math.round(f.cultivation/30*100)"]%。
[else]农田开垦完成。
[endif][l]
[return]
;return to work


*cultivating_dayly
	[showDate]
	[delay speed=nowait]
	[if exp="f.cultivation!=30"]
		[actionAttributes]
			[eval exp="attributeBar(30, f.cultivation, 175, 400)"]
			[eval exp="attributeBar(200, f.fatigue, 380, 400)"]
			[locate x=60 y=390]农田开发度
			[locate x=330 y=390]疲累
			[locate x=225 y=380][emb exp="Math.round(f.cultivation/30*100)"]%
			[locate x=430 y=380][emb exp="Math.round(f.fatigue)"]
		[endnowait]
		[actionDialog]开垦土地中．．．[wait time=&tf.delayTime][er]
		[if exp="f.fatigue<=f.health*1.3"]
			开垦土地进展不错。
			[eval exp="f.fatigue+=4"][eval exp="f.cultivation+=1"][eval exp="tf.tfCultivation+=1"]
		[else]
			开垦土地进展受阻济。
			[eval exp="f.fatigue+=2"]
		[endif]
		[actionAttributes]
			[eval exp="attributeBar(30, f.cultivation, 175, 400)"]
			[eval exp="attributeBar(200, f.fatigue, 380, 400)"]
			[locate x=60 y=390]农田开发度
			[locate x=330 y=390]疲累
			[locate x=225 y=380][emb exp="Math.round(f.cultivation/30*100)"]%
			[locate x=430 y=380][emb exp="Math.round(f.fatigue)"]
		[endnowait]
	[else]
		[actionAttributes]
			[eval exp="attributeBar(200, f.fatigue, 175, 400)"]
			[locate x=120 y=390]疲累
			[locate x=225 y=380][emb exp="Math.round(f.fatigue)"]
		[endnowait]
		[actionDialog]
			开垦已经完成了，休息一下吧。
		[if exp="f.diet=='节约'"][eval exp="f.fatigue-=4"]
		[else][eval exp="f.fatigue-=5"]
		[endif][eval exp="f.fatigue=0" cond="f.fatigue<0"]
		[actionAttributes]
			[eval exp="attributeBar(200, f.fatigue, 175, 400)"]
			[locate x=120 y=390]疲累
			[locate x=225 y=380][emb exp="Math.round(f.fatigue)"]
		[endnowait]
	[endif]
	[endnowait]
	[wait time=&tf.delayTime][er]
	[eval exp="f.day+=1"]
[return]
;return to cultivating start