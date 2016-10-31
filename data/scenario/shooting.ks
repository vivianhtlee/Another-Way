*shooting_start
[showDate]
[workPicture work='shooting']
[if exp="( (f.Prussia==0) && ((f.year<1778)||(f.year==1778&&f.month==1)) )"]
	[image storage="Washington" visible=true pos=l layer=1]
	[talk layer=message1 name='华盛顿']
		没有好技术，再好的工具也是没用的。[l][er]
[elsif exp="f.Prussia!=0"]
	[eval exp="f.Prussia+=1"]
	[image storage="Prussia_serious_" visible=true pos=l layer=1]
	[talk layer=message1 name='普鲁士']
		我家的训练可是很严格的！[l][er]
[else]
	[call storage="Prussia.ks" target=*come]
	[workPicture work='shooting']
[endif]
[layopt layer=1 visible=false][layopt layer=3 visible=false]
[eval exp="tf.tfMarksmanship=0"]
	[actionAttributes]
		[eval exp="attributeBar(1000, f.marksmanship, 175, 400)"]
		[eval exp="attributeBar(200, f.fatigue, 380, 400)"]
		[locate x=120 y=390]枪法
		[locate x=330 y=390]疲累
		[locate x=225 y=380][emb exp="Math.round(f.marksmanship)"]
		[locate x=430 y=380][emb exp="Math.round(f.fatigue)"]
	[endnowait]
[if exp="!(f.year==1776&&f.month==7&&f.day==4)"]
	[call target=*shooting_dayly]
	[call target=*shooting_dayly]
	[call target=*shooting_dayly]
[endif]
[call target=*shooting_dayly]
[call target=*shooting_dayly]
[call target=*shooting_dayly]
[call target=*shooting_dayly]
[call target=*shooting_dayly]
[if exp="f.year==1780&&f.month==2&&f.day>20"]
	[call target=*shooting_dayly]
[endif]
[if exp="f.day<=20||f.month!=2||f.year!=1780"]
	[call target=*shooting_dayly]
	[call target=*shooting_dayly]
[endif]
[if exp="f.day>=30&&(f.month==1||f.month==3||f.month==5||f.month==7||f.month==8||f.month==10||f.month==12)"]
	[call target=*shooting_dayly]
[endif]
[if exp="f.day>=25"][eval exp="f.day-=1"][endif]
[layopt layer=message2 visible=false]
[bottom layer=message1][delay speed=user]
枪法提升了[emb exp="tf.tfMarksmanship"]。[l]
[position layer=message1 visible=false]
[if exp="f.Prussia==3"][call storage="Prussia.ks" target=*3th]
[elsif exp="f.Prussia==10"][call storage="Prussia.ks" target=*10th]
[elsif exp="f.Prussia==20"][call storage="Prussia.ks" target=*20th]
[endif]
[return]
;return to work


*shooting_dayly
	[showDate]
	[actionAttributes]
		[eval exp="attributeBar(1000, f.marksmanship, 175, 400)"]
		[eval exp="attributeBar(200, f.fatigue, 380, 400)"]
		[locate x=120 y=390]枪法
		[locate x=330 y=390]疲累
		[locate x=225 y=380][emb exp="Math.round(f.marksmanship)"]
		[locate x=430 y=380][emb exp="Math.round(f.fatigue)"]
	[endnowait]
	[delay speed=nowait]
	[actionDialog]射击训练中．．．[wait time=&tf.delayTime][er]
	[actionDialog]
	[if exp="f.fatigue<=f.health*1.2"]
		[if exp="f.year<1778||(f.year==1778&&f.month==1)"]
			[if exp="f.state!='思乡'"]
				射击训练顺利。
				[eval exp="f.fatigue+=1.5"]
				[eval exp="f.marksmanship+=1.5"][eval exp="tf.tfMarksmanship+=1.5"]
			[else]
				没有心情好好练习。
				[eval exp="f.fatigue+=1.5"]
				[eval exp="f.marksmanship+=1"][eval exp="tf.tfMarksmanship+=1"]
			[endif]
		[else]
			[if exp="f.state!='思乡'"]
				射击训练尚算顺利。
				[eval exp="f.fatigue+=3"]
				[eval exp="f.marksmanship+=4"][eval exp="tf.tfMarksmanship+=4"]
			[else]
				没有心情好好练习。
				[eval exp="f.fatigue+=4"]
				[eval exp="f.marksmanship+=2"][eval exp="tf.tfMarksmanship+=2"]
			[endif]
		[endif]
	[else]
		太累了，没有好好练习。[wait time=&tf.delayTime][er]
		[eval exp="f.fatigue+=1"]
	[endif]
	[actionAttributes]
		[eval exp="attributeBar(1000, f.marksmanship, 175, 400)"]
		[eval exp="attributeBar(200, f.fatigue, 380, 400)"]
		[locate x=120 y=390]枪法
		[locate x=330 y=390]疲累
		[locate x=225 y=380][emb exp="Math.round(f.marksmanship)"]
		[locate x=430 y=380][emb exp="Math.round(f.fatigue)"]
	[endnowait]
	[wait time=&tf.delayTime][er]
	[eval exp="f.day+=1"]
[return]
;return to shooting start