;set prices
[if exp="f.printedMoney<=2500"][eval exp="tf.price=sf.price0"]
[elsif exp="f.printedMoney<=5000"][eval exp="tf.price=sf.price1"]
[elsif exp="f.printedMoney<=7500"][eval exp="tf.price=sf.price2"]
[elsif exp="f.printedMoney<=10000"][eval exp="tf.price=sf.price3"]
[else][eval exp="tf.price=sf.price4"]
[endif]

*marketing_start

[showDate]
[america pos='l' feeling='normal' layer=0]
[talk layer=message1 name="阿美利加"]
	到其他城镇附近的市集购物。[l][er]
[layopt layer=0 visible=false][layopt layer=3 visible=false]
[call target=*change_day]
[call target=*change_day]
[call target=*change_day]
[call target=*change_day]
[backlay][image storage="work_market" layer=base page=back][trans method=crossfade from=bottom stay=nostay time=750 children=false][wt canskip=true]
[call target=*change_day][jump target=*marketing1]
*marketing2
[delay speed=50]
[call target=*change_day]
[call target=*change_day]
[call target=*change_day]
[if exp="f.year==1780&&f.month==2&&f.day>20"]
	[call target=*change_day]
[endif]
[if exp="f.day<=20||f.month!=2||f.year!=1780"]
	[call target=*change_day]
	[call target=*change_day]
[endif]
[if exp="f.day>=30&&(f.month==1||f.month==3||f.month==5||f.month==7||f.month==8||f.month==10||f.month==12)"]
	[call target=*change_day]
[endif]
[if exp="f.day>=25"][eval exp="f.day-=1"][endif]
[setBasePlace]
[return]
;return to work

*change_day
	[showDate]
	[delay speed=nowait]
	[actionDialog]赶路中．．．[wait time=&tf.delayTime][er]
	[endif]
	[eval exp="f.day+=1"]
[return]
;return to marketing start

*marketing1
[delay speed=nowait]
[layopt layer=message3 visible=false]
[layopt layer=message2 visible=false]
[position layer=message1 visible=true left=100 top=40 frame=itemsbox margint=5 marginb=10 marginl=10 marginr=5][current layer=message1 page=fore][er]
;[layopt layer=0 visible=true index=1000500 left=400]
[macro name="showMessageBox3"]
	[position page=fore layer=message3 visible=true left=380 top=200 frame=dialog margint=0 marginb=0 marginl=0 marginr=0]
	[current layer=message3][er]
[endmacro]
[font color=0x1F0F01 shadow=false]
[locate x=50]物品[locate x=175]价格[locate x=285 y=8][button graphic=close target=*marketing2]
	[locate x=5 y=41][eval exp="tf.nameC='民兵服'"][drawButtonCaption_good target=*militia_m][locate x=186][emb exp="tf.price[0]"]
	[locate x=5 y=71][eval exp="tf.nameC='正式军服'"][drawButtonCaption_good target=*uniform_m][locate x=175][emb exp="tf.price[1]"]
	[locate x=5 y=101][eval exp="tf.nameC='书本'"][drawButtonCaption_good target=*book_m][locate x=186][emb exp="tf.price[2]"]
	[locate x=5 y=131][eval exp="tf.nameC='点心'"][drawButtonCaption_good target=*dessert_m][locate x=186][emb exp="tf.price[3]"]
	[locate x=5 y=161][eval exp="tf.nameC='药物'"][drawButtonCaption_good target=*medicine_m][locate x=186][emb exp="tf.price[4]"]
	[locate x=5 y=191][eval exp="tf.nameC='军备现货(100)'"][drawButtonCaption_good target=*arms_m][locate x=186][emb exp="tf.price[5]"]
	[locate x=5 y=221][eval exp="tf.nameC='军备订货(300)'"][drawButtonCaption_good target=*arms_m][locate x=175][emb exp="tf.price[6]"]
	[locate x=150 y=348]金钱:[emb exp="f.money"]
[s]

*militia_m
[position layer=message2 visible=true left=30 top=400 frame=dialog3 margint=5 marginb=10 marginl=10 marginr=5]
[current layer=message2][er]
[font size=15 color=0xFFFFFF edge=false]民兵自制的非正规军服。价格[emb exp="tf.price[0]"]
[showMessageBox3]
[locate x=205 y=2][button graphic=close target=*marketing1]
[locate y=20]
[style align=center][font size=24]
[link target=*militia_mm]购买[endlink][s]
*militia_mm
[if exp="f.money>=tf.price[0]"]
	[eval exp="f.money-=tf.price[0]"][eval exp="f.i_militia+=1"]
	[current layer=message3][er]
		[locate x=205 y=2][button graphic=close target=*marketing1]
		[locate x=5 y=20]购买民兵服x1。[s]
[else]
	[jump target=*unaffordable]
[endif]

*uniform_m
[position layer=message2 visible=true left=30 top=400 frame=dialog3 margint=5 marginb=10 marginl=10 marginr=5]
[current layer=message2][er]
[font size=15 color=0xFFFFFF edge=false]正规军装。价格[emb exp="tf.price[1]"]
[showMessageBox3]
[locate x=205 y=2][button graphic=close target=*marketing1]
[locate y=20]
[style align=center][font size=24]
[link target=*uniform_mm]购买[endlink][s]
*uniform_mm
[if exp="f.money>=tf.price[1]"]
	[eval exp="f.money-=tf.price[1]"][eval exp="f.i_uniform+=1"]
	[current layer=message3][er]
		[locate x=205 y=2][button graphic=close target=*marketing1]
		[locate x=5 y=20]购买独战服x1。[s]
[else]
	[jump target=*unaffordable]
[endif]

*book_m
[position layer=message2 visible=true left=30 top=400 frame=dialog3 margint=5 marginb=10 marginl=10 marginr=5]
[current layer=message2][er]
[font size=15 color=0xFFFFFF edge=false]书本。价格[emb exp="tf.price[2]"]
[showMessageBox3]
[locate x=205 y=2][button graphic=close target=*marketing1]
[locate y=20]
[style align=center][font size=24]
[link target=*book_mm]购买[endlink][s]
*book_mm
[if exp="f.money>=tf.price[2]"]
	[eval exp="f.bbook+=1"][eval exp="f.money-=tf.price[2]"]
	[if exp="f.bbook==2"]
		[eval exp="f.i_common_sence+=1"]
		[current layer=message3][er]
			[locate x=205 y=2][button graphic=close target=*marketing1]
			[locate x=5 y=20]购买《常识》。[s]
	[else]
		[eval exp="f.i_book+=1"]
		[current layer=message3][er]
			[locate x=205 y=2][button graphic=close target=*marketing1]
			[locate x=5 y=20]购买书本x1。[s]
	[endif]
[else]
	[jump target=*unaffordable]
[endif]


*dessert_m
[position layer=message2 visible=true left=30 top=400 frame=dialog3 margint=5 marginb=10 marginl=10 marginr=5]
[current layer=message2][er]
[font size=15 color=0xFFFFFF edge=false]让人放松心情的点心。价格[emb exp="tf.price[3]"]
[showMessageBox3]
[locate x=205 y=2][button graphic=close target=*marketing1]
[locate y=20]
[style align=center][font size=24]
[link target=*dessert_mm]购买[endlink][s]
*dessert_mm
[if exp="f.money>=tf.price[3]"]
	[eval exp="f.money-=tf.price[3]"][eval exp="f.i_dessert+=1"]
	[current layer=message3][er]
		[locate x=205 y=2][button graphic=close target=*marketing1]
		[locate x=5 y=20]购买点心x1。[s]
	[jump target=*marketing1]
[else]
	[jump target=*unaffordable]
[endif]

*medicine_m
[position layer=message2 visible=true left=30 top=400 frame=dialog3 margint=5 marginb=10 marginl=10 marginr=5]
[current layer=message2][er]
[font size=15 color=0xFFFFFF edge=false]治疗用的药物，能提升体魄。价格[emb exp="tf.price[4]"]
[showMessageBox3]
[locate x=205 y=2][button graphic=close target=*marketing1]
[locate y=20]
[style align=center][font size=24]
[link target=*medicine_mm]购买[endlink][s]
*medicine_mm
[if exp="f.money>=tf.price[4]"]
	[eval exp="f.money-=tf.price[4]"][eval exp="f.i_medicine+=1"]
	[current layer=message3][er]
		[locate x=205 y=2][button graphic=close target=*marketing1]
		[locate x=5 y=20]购买药物x1。[s]
[else]
	[jump target=*unaffordable]
[endif]


*arms_m
[position layer=message2 visible=true left=30 top=400 frame=dialog3 margint=0 marginb=10 marginl=10 marginr=0]
[current layer=message2][er]
[font size=15 color=0xFFFFFF edge=false]军备(包括枪枝、炮火)。现货每100点价格[emb exp="tf.price[5]"]，无购买限额。订货300点价格[emb exp="tf.price[6]"]。订货3个月后运至。
[showMessageBox3]
[locate x=205 y=2][button graphic=close target=*marketing1]
[locate y=20]
[style align=center][font size=24]
[link target=*arms_mm]购买现货[endlink][r]
[link target=*arms_mmm]订货[endlink][s]
*arms_mm
	[if exp="f.money>=tf.price[5]"]
		[eval exp="f.money-=tf.price[5]"][eval exp="f.arms+=100"]
		[current layer=message3][er]
			[locate x=205 y=2][button graphic=close target=*marketing1]
			[locate x=5 y=20]购买军备x100。[s]
	[else]
		[jump target=*unaffordable]
	[endif]
*arms_mmm
	[if exp="f.buy_arms==0"]
		[if exp="f.money>=tf.price[6]"]
			[eval exp="f.money-=tf.price[6]"][eval exp="f.buy_arms=3"]
		[current layer=message3][er]
			[locate x=205 y=2][button graphic=close target=*marketing1]
			[locate x=5 y=20]订购军备x300，将于3个月后运至。[s]
		[else]
			[jump target=*unaffordable]
		[endif]
	[else]
		[position layer=message3 visible=true left=380 top=160 frame=dialog margint=0 marginb=0 marginl=5 marginr=0]
		[current layer=message3][er]
			[locate x=200 y=2][button graphic=close target=*marketing1]
			[locate x=0 y=20]抱歉，正在赶上一批货，无法再下订单。[s]
	[endif]

*unaffordable
[showMessageBox3]
[current layer=message3][er]
	[locate x=205 y=2][button graphic=close target=*marketing1]
	[locate x=5 y=20]没有足够金钱付款。[s]
