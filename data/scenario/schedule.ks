[position layer=message2 left=0 top=0 visible=true frame=invisible margint=0 marginb=0 marginl=0 marginr=0]

;set x y
[eval exp="tf.locateX1=95, tf.locateX2=200, tf.locateY=200"]

*schedule_cancel
[eval exp="tf.sc= ['', '', '', '']"]
*schedule

;1783_4_11
[if exp="f.year==1783&&f.month==4&&f.day==11"]
	[layopt layer=message3 visible=false]
	[layopt layer=message2 visible=false]
	[position layer=message1 visible=true left=150 top=200 frame=dialog margint=0 marginb=0 marginl=10 marginr=10]
	[current layer=message1][er]
	[locate x=195 y=2][button graphic=close storage="game.ks"]
	[nowait][locate x=0 y=20]
	最终日。确定了吗?[r]
	[style align=center][link storage="ending.ks"]确认[endlink]　　[link storage="game.ks"]取消[endlink]
	[s]

;stageF
[elsif exp="f.stage=='F'"]
	;stageF
	[layopt layer=message3 visible=false]
	[layopt layer=message2 visible=false]
	[position layer=message1 visible=true left=150 top=200 frame=dialog margint=0 marginb=0 marginl=10 marginr=10]
	[current layer=message1][er]
	[locate x=195 y=2][button graphic=close storage="game.ks"]
	[nowait][locate x=0 y=20]
		被俘虏软禁，无法选取行程。[r]
	[style align=center][link storage="prison.ks"]确认[endlink]　　[link storage="game.ks"]取消[endlink][endnowait][s]

;stageE
[elsif exp="f.stage=='E'"]
	[if exp="(f.month==4)&&(f.doc!=0)"]
		[eval exp="tf.sc[1]='处理政务'"]
		[layopt layer=0 visible=false][layopt layer=message1 visible=false]
		[image storage="Washington" layer=1 visible=true pos='lc']
		[talk layer=message2 name="华盛顿"]
			在完成公文前哪都不能去。[l][er]
		[layopt layer=1 visible=false]
		[layopt layer=2 visible=false]
		[layopt layer=0 visible=true]
		[position layer=message2 visible=false]
	[endif]
	[scheduleDialog]
	[if exp="(f.month==4)"]
		[eval exp="tf.sc[2]='-', tf.sc[3]='-'"]
		[if exp="f.doc!=0"][locate x=125 y=30]处理政务
		[elsif exp="(tf.sc[1]!='')&&(f.doc==0)"][locate x=215 y=102][button graphic=button_schedule3 target=*schedule exp="tf.sc[1]=''"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, tf.sc[1], 24)"]
		[endif]
		[locate x=215 y=137]-
		[locate x=215 y=173]-	
	[else]
		[if exp="tf.sc[1]!=''"][locate x=215 y=102][button graphic=button_schedule3 target=*schedule exp="tf.sc[1]='';hideCommentOfSchedule()" onenter="showCommentOfSchedule('撤消')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, tf.sc[1], 24)"][endif]
		[if exp="tf.sc[2]!=''"][locate x=215 y=137][button graphic=button_schedule3 target=*schedule exp="tf.sc[2]='';hideCommentOfSchedule()" onenter="showCommentOfSchedule('撤消')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, tf.sc[2], 24)"][endif]
		[if exp="tf.sc[3]!=''"][locate x=215 y=173][button graphic=button_schedule3 target=*schedule exp="tf.sc[3]='';hideCommentOfSchedule()" onenter="showCommentOfSchedule('撤消')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, tf.sc[3], 24)"][endif]
	[endif]
	[locate x=&tf.locateX1 y=&(tf.locateY+30*1)][button graphic=button_schedule3 target=*action exp="tf.action='种植'" onenter="showCommentOfSchedule('种植')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '种植', 24)"]
	[locate x=&tf.locateX1 y=&(tf.locateY+30*2)][button graphic=button_schedule3 target=*action exp="tf.action='赚钱'" onenter="showCommentOfSchedule('赚钱')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '赚钱', 24)"]
	[locate x=&tf.locateX1 y=&(tf.locateY+30*3)][button graphic=button_schedule3 target=*action exp="tf.action='休息'" onenter="showCommentOfSchedule('休息')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '休息', 24)"]
	[if exp="f.state=='生病'"][locate x=&tf.locateX1 y=&(tf.locateY+30*4)][button graphic=button_schedule3 target=*action exp="tf.action='诊疗'"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '诊疗', 24)"][endif]
	[locate x=&tf.locateX2 y=&(tf.locateY+30*1)][button graphic=button_schedule4 target=*action exp="tf.action='处理政务'" onenter="showCommentOfSchedule('处理政务')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '处理政务', 24)"]
	[locate x=&tf.locateX2 y=&(tf.locateY+30*2)][button graphic=button_schedule3 target=*action exp="tf.action='外交课'" onenter="showCommentOfSchedule('外交课')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '外交课', 24)"]
	[if exp="(f.month!=4)||(f.doc==0)"][locate x=80 y=403][button graphic=button_schedule3 target=*schedule_cancel][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '撤回', 24)"][endif]
	[if exp="(tf.sc[1]!='')&&(tf.sc[2]!='')&&(tf.sc[3]!='')"][locate x=222 y=403][button graphic=button_schedule3 storage="work.ks"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '确认', 24)"][endif]
	[call target=*moneyAndFood]
	[endnowait][s]

;已得知战役
[elsif exp="f.information==0"]
	[eval exp="tf.sc[1]='战争', tf.sc[2]='战争', tf.sc[3]='战争'"]
	[scheduleDialog]
	[eval exp="tf.i=1"]
	[locate x=&tf.locateX1 y=&(tf.locateY+30*tf.i)]
	[if exp="!(f.stage=='B'||f.stage=='D')||f.cultivation>=30"][button graphic=button_schedule3 target=*action exp="tf.action='种植'" onenter="showCommentOfSchedule('战役')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '种植', 24)"]
	[else][button graphic=button_schedule3 target=*action exp="tf.action='开垦'" onenter="showCommentOfSchedule('战役')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '开垦', 24)"][endif][eval exp="tf.i++"]
	[locate x=&tf.locateX1 y=&(tf.locateY+30*tf.i)][button graphic=button_schedule3 target=*action exp="tf.action='赚钱'" onenter="showCommentOfSchedule('战役')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '赚钱', 24)"][eval exp="tf.i++"]
	[if exp="f.stage=='B'||f.stage=='D'"]
		[locate x=&tf.locateX1 y=&(tf.locateY+30*tf.i)][button graphic=button_schedule3 target=*action exp="tf.action='购物'" onenter="showCommentOfSchedule('战役')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '购物', 24)"][eval exp="tf.i++"][endif]
	[locate x=&tf.locateX1 y=&(tf.locateY+30*tf.i)][button graphic=button_schedule3 target=*action exp="tf.action='休息'" onenter="showCommentOfSchedule('战役')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '休息', 24)"][eval exp="tf.i++"]
	[if exp="f.state=='生病'"][locate x=&tf.locateX1 y=&(tf.locateY+30*tf.i)][button graphic=button_schedule3 target=*action exp="tf.action='诊疗'" onenter="showCommentOfSchedule('战役')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '诊疗', 24)"][endif]
	[locate x=&tf.locateX2 y=&(tf.locateY+30*1)]
	[button graphic=button_schedule3 target=*action exp="tf.action='战略课'" onenter="showCommentOfSchedule('战役')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '战略课', 24)"]
	[locate x=&tf.locateX2 y=&(tf.locateY+30*2)]
	[button graphic=button_schedule3 target=*action exp="tf.action='军纪课'" onenter="showCommentOfSchedule('战役')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '军纪课', 24)"]
	[locate x=&tf.locateX2 y=&(tf.locateY+30*3)]
	[button graphic=button_schedule3 target=*action exp="tf.action='射击课'" onenter="showCommentOfSchedule('战役')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '射击课', 24)"]
	[locate x=&tf.locateX2 y=&(tf.locateY+30*4)]
	[button graphic=button_schedule3 target=*action exp="tf.action='外交课'" onenter="showCommentOfSchedule('战役')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '外交课', 24)"]
	[locate x=222 y=403][button graphic=button_schedule3 storage="work.ks"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '确认', 24)"]
	[call target=*moneyAndFood]
	[endnowait][s]



;普通状况
[else]
	[scheduleDialog]
	[if exp="tf.sc[1]!=''"][locate x=215 y=102][button graphic=button_schedule3 target=*schedule exp="tf.sc[1]='';hideCommentOfSchedule()" onenter="showCommentOfSchedule('撤消')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, tf.sc[1], 20)"][endif]
	[if exp="tf.sc[2]!=''"][locate x=215 y=137][button graphic=button_schedule3 target=*schedule exp="tf.sc[2]='';hideCommentOfSchedule()" onenter="showCommentOfSchedule('撤消')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, tf.sc[2], 20)"][endif]
	[if exp="tf.sc[3]!=''"][locate x=215 y=173][button graphic=button_schedule3 target=*schedule exp="tf.sc[3]='';hideCommentOfSchedule()" onenter="showCommentOfSchedule('撤消')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, tf.sc[3], 20)"][endif]
	[eval exp="tf.i=1"]
	[locate x=&tf.locateX1 y=&(tf.locateY+30*tf.i)]
	[if exp="!(f.stage=='B'||f.stage=='D')||f.cultivation>=30"][button graphic=button_schedule3 target=*action exp="tf.action='种植'" onenter="showCommentOfSchedule('种植')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '种植', 24)"]
	[else][button graphic=button_schedule3 target=*action exp="tf.action='开垦'" onenter="showCommentOfSchedule('开垦')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '开垦', 24)"][endif][eval exp="tf.i++"]
	[locate x=&tf.locateX1 y=&(tf.locateY+30*tf.i)][button graphic=button_schedule3 target=*action exp="tf.action='赚钱'" onenter="showCommentOfSchedule('赚钱')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '赚钱', 24)"][eval exp="tf.i++"]
	[if exp="f.stage=='B'||f.stage=='D'"]
		[locate x=&tf.locateX1 y=&(tf.locateY+30*tf.i)][button graphic=button_schedule3 target=*action exp="tf.action='购物'" onenter="showCommentOfSchedule('购物')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '购物', 24)"][eval exp="tf.i++"][endif]
	[locate x=&tf.locateX1 y=&(tf.locateY+30*tf.i)][button graphic=button_schedule3 target=*action exp="tf.action='休息'" onenter="showCommentOfSchedule('休息')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '休息', 24)"][eval exp="tf.i++"]
	[if exp="f.state=='生病'"][locate x=&tf.locateX1 y=&(tf.locateY+30*tf.i)][button graphic=button_schedule3 target=*action exp="tf.action='诊疗'" onenter="showCommentOfSchedule('诊疗')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '诊疗', 24)"][endif]
	[locate x=&tf.locateX2 y=&(tf.locateY+30*1)]
	[button graphic=button_schedule3 target=*action exp="tf.action='战略课'" onenter="showCommentOfSchedule('战略课')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '战略课', 24)"]
	[locate x=&tf.locateX2 y=&(tf.locateY+30*2)]
	[button graphic=button_schedule3 target=*action exp="tf.action='军纪课'" onenter="showCommentOfSchedule('军纪课')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '军纪课', 24)"]
	[locate x=&tf.locateX2 y=&(tf.locateY+30*3)]
	[button graphic=button_schedule3 target=*action exp="tf.action='射击课'" onenter="showCommentOfSchedule('射击课')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '射击课', 24)"]
	[locate x=&tf.locateX2 y=&(tf.locateY+30*4)]
	[button graphic=button_schedule3 target=*action exp="tf.action='外交课'" onenter="showCommentOfSchedule('外交课')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '外交课', 24)"]
	[locate x=80 y=403][button graphic=button_schedule3 target=*schedule_cancel][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '撤回', 20)"]
	[if exp="(tf.sc[1]!='')&&(tf.sc[2]!='')&&(tf.sc[3]!='')"][locate x=222 y=403][button graphic=button_schedule3 storage="work.ks"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '确认', 20)"][endif]
	[call target=*moneyAndFood]
	[endnowait][s]
[endif]



*action
[if exp="tf.sc[1]==''"][eval exp="tf.sc[1]=tf.action"]
[elsif exp="tf.sc[2]==''"][eval exp="tf.sc[2]=tf.action"]
[elsif exp="tf.sc[3]==''"][eval exp="tf.sc[3]=tf.action"]
[endif]
[jump target=*schedule]


*moneyAndFood
[font size=20]
	[locate x=410 y=248]财政：[locate x=475 y=252]
[button graphic=button_schedule3 target=*finance onenter="showCommentOfSchedule('财政')" onleave="hideCommentOfSchedule()"]
[eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, f.finance, 20)"][endif]
	[locate x=410 y=280]粮食：[locate x=475 y=285][button graphic=button_schedule3 target=*diet onenter="showCommentOfSchedule('粮食')" onleave="hideCommentOfSchedule()"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, f.diet, 20)"][endif]
[return]

*finance
[if exp="f.finance=='维持现状'"]
	[eval exp="f.finance='增发纸币'"]
[else]
	[eval exp="f.finance='维持现状'"]
[endif]
[jump target=*schedule]

*diet
[if exp="f.diet=='一般'"]
	[eval exp="f.diet='丰富'"]
[elsif exp="f.diet=='丰富'"]
	[eval exp="f.diet='节约'"]
[elsif exp="f.diet=='节约'"]
	[eval exp="f.diet='一般'"]
[endif]
[jump target=*schedule]


