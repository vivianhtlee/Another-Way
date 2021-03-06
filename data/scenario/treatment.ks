*treatment_start
[showDate]
[workPicture work='treatment']
[america pos=l layer=1 feeling=normal]
[talk layer=message1 name="阿美利加"]
	[if exp="f.state=='生病'"]嗯...很热、难受...
	[else]感觉好很多了。[endif]
[l][er]
[layopt layer=1 visible=false][layopt layer=3 visible=false]
	[actionAttributes]
		[eval exp="attributeBar(100, f.health, 175, 400)"]
		[eval exp="attributeBar(200, f.fatigue, 380, 400)"]
		[locate x=120 y=390]健康
		[locate x=330 y=390]疲累
		[locate x=120 y=420]金钱
		[locate x=225 y=380][emb exp="Math.round(f.health)"]
		[locate x=430 y=380][emb exp="Math.round(f.fatigue)"]
		[locate x=225 y=420][emb exp="Math.round(f.money)"]
	[endnowait]
	[delay speed=nowait]
[if exp="!(f.year==1776&&f.month==7&&f.day==4)"]
	[call target=*treatment_dayly]
	[call target=*treatment_dayly]
	[call target=*treatment_dayly]
[endif]
[call target=*treatment_dayly]
[call target=*treatment_dayly]
[call target=*treatment_dayly]
[call target=*treatment_dayly]
[call target=*treatment_dayly]
[if exp="f.year==1780&&f.month==2&&f.day>20"]
	[call target=*treatment_dayly]
[endif]
[if exp="f.day<=20||f.month!=2||f.year!=1780"]
	[call target=*treatment_dayly]
	[call target=*treatment_dayly]
[endif]
[if exp="f.day>=30&&(f.month==1||f.month==3||f.month==5||f.month==7||f.month==8||f.month==10||f.month==12)"]
	[call target=*treatment_dayly]
[endif]
[if exp="f.day>=25"][eval exp="f.day-=1"][endif]
[layopt layer=message2 visible=false]
[bottom layer=message1]
;改变状态-生病
[if exp="f.state=='生病'&&f.health>=45&&f.fatigue<=f.health*1.5"]
;	[america pos='l' feeling='normal' layer=1]
	[talk layer=message1 name="阿美利加"]
	[eval exp="f.state='正常'"]
		身体恢复了。[l][er]
[endif]
[layopt layer=2 visible=false]
[return]
;return to work


*treatment_dayly
	[showDate]
	[delay speed=nowait]
	[actionDialog]安养中．．．
	[actionAttributes]
		[eval exp="attributeBar(100, f.health, 175, 400)"]
		[eval exp="attributeBar(200, f.fatigue, 380, 400)"]
		[locate x=120 y=390]健康
		[locate x=330 y=390]疲累
		[locate x=120 y=420]金钱
		[locate x=225 y=380][emb exp="Math.round(f.health)"]
		[locate x=430 y=380][emb exp="Math.round(f.fatigue)"]
		[locate x=225 y=420][emb exp="Math.round(f.money)"]
	[endnowait]
	[wait time=&tf.delayTime][er]
	[if exp="f.money>=40"]
		[actionDialog]在妥善治疗下，身体逐潮康复。
		[eval exp="f.money-=40"]
		[if exp="f.fatigue>=10"][eval exp="f.fatigue-=10"][else][eval exp="f.fatigue=0"][endif]
		[if exp="f.health<100"][eval exp="f.health+=1"][endif]
	[else]
		[actionDialog]不够钱，普通休息。
		[if exp="f.stage=='B'||f.stage=='D'"]
		[eval exp="f.fatigue-=5"]
		[else][eval exp="f.fatigue-=6"]
		[endif]
	[endif]
	[actionAttributes]
		[eval exp="attributeBar(100, f.health, 175, 400)"]
		[eval exp="attributeBar(200, f.fatigue, 380, 400)"]
		[locate x=120 y=390]健康
		[locate x=330 y=390]疲累
		[locate x=120 y=420]金钱
		[locate x=225 y=380][emb exp="Math.round(f.health)"]
		[locate x=430 y=380][emb exp="Math.round(f.fatigue)"]
		[locate x=225 y=420][emb exp="Math.round(f.money)"]
	[endnowait]
	[wait time=&tf.delayTime][er]
	[eval exp="f.day+=1"]
[return]
;return to treatment start