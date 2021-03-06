[layopt layer=0 visible=true index=1000500 left=400]
[macro name="showMessageBox3"]
	[position page=fore layer=message3 visible=true left=380 top=200 frame=dialog margint=0 marginb=0 marginl=0 marginr=0]
	[current layer=message3][er]
[endmacro]
*item
[eval exp="tf.total_items=15"]
[eval exp="tf.page=1"]
*initialize_item
[eval exp="f.item=[0,f.i_leisure, f.i_militia, f.i_uniform, f.i_declaration, f.i_letter1, f.i_letter2, f.i_gun1, f.i_gun2, f.i_sword, f.i_gunsword, f.i_book, f.i_common_sence, f.i_training_manual, f.i_dessert, f.i_medicine, f.i_training_manual]"]
[layopt layer=message3 visible=false]
[layopt layer=message2 visible=false]
[position layer=message1 visible=true left=40 top=50 frame=itemsbox margint=5 marginb=10 marginl=10 marginr=5]
[current layer=message1][delay speed=nowait]
;揭页的target
*page

[er]
[layopt layer=2 visible=false]
[font color=0x1F0F01 shadow=false]
[nowait][nowait][nowait][nowait][nowait][nowait][nowait]
[locate x=50]物品[locate x=175]数量[locate x=285 y=8][button graphic=close storage="game.ks"][r]
[eval exp="tf.i=0" cond="tf.page==1"]
[eval exp="tf.count=0"]
*itembox
	[eval exp="tf.i+=1"]
	[if exp="f.item[tf.i]!=0"]
		[eval exp="tf.count++"]
		[locate x=5 y=&(11+tf.count*30)]
		[eval exp="tf.string='*'+sf.itemName[tf.i]"]
		[drawButtonCaption_item]
		[locate x=185][emb exp="f.item[tf.i]"]
	[endif]
[jump target=*itembox cond="(tf.count<10)&&(tf.i<tf.total_items)"]
[if exp="(tf.page==2)"]
	[locate x=170 y=350][button graphic=button_schedule2 target=*page exp="tf.page=1"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '上一页', 20)"]
[elsif exp="(tf.page==1)&&(tf.count==10)&&(tf.i!=f.total_items)"]
	[locate x=170 y=350][button graphic=button_schedule2 target=*page exp="tf.page=2"][eval exp="drawButtonCaption(kag.current.links[kag.current.links.count-1].object, '下一页', 20)"]
[endif]
[endnowait][s]


*declaration
[position layer=message2 visible=true left=30 top=400 frame=dialog3 margint=5 marginb=10 marginl=10 marginr=5]
[current layer=message2][er]
[font size=15 color=0xFFFFFF edge=false]十三殖民地宣告自大不列颠王国独立，并宣明此举正当性之文告。
[showMessageBox3]
[locate x=205 y=2][button graphic=close target=*item]
[locate y=20]
[style align=center]
[font size=24]
[link target=*declaration1]阅读[endlink][s]
*declaration1
[layopt layer=message3 visible=false draggable=false]
[layopt layer=message2 visible=false]
[position layer=message1 visible=true left=30 top=0 frame="tinyOldPaper" marginb=24 marginl=28 marginr=11 margint=26]
[current layer=message1][er]
[font size=16]
　　我们认为下面这些真理是不言而喻的：造物者创造了平等的个人，并赋予他们若干不可剥夺的权利，其中包括生命权、自由权和追求幸福的权利。为了保障这些权利，人们才在他们之间建立政府，而政府之正当权力，则来自被统治者的同意。任何形式的政府，只要破坏上述目的，人民就有权利改变或废除它，并建立新政府；新政府赖以奠基的原则，得以组织权力的方式，都要最大可能地增进民众的安全和幸福。的确，从慎重考虑，不应当由于轻微和短暂的原因而改变成立多年的政府。过去的一切经验也都说明，任何苦难，只要尚能忍受，人类都宁愿容忍，而无意废除他们久已习惯了的政府来恢复自身的权益。但是，当政府一贯滥用职权、强取豪夺，一成不变地追逐这一目标，足以证明它旨在把人民置于绝对专制统治之下时，那么，人民就有权利，也有义务推翻这个政府，并为他们未来的安全建立新的保障。[r][r][r]
[style align=center]……[l]
[style align=left]
[jump target=*item]

*leisure
[position layer=message2 visible=true left=30 top=400 frame=dialog3 margint=5 marginb=10 marginl=10 marginr=5]
[current layer=message2][er]
[font size=15 color=0xFFFFFF edge=false]日常服饰。
[showMessageBox3]
[locate x=205 y=2][button graphic=close target=*item]
[locate y=20]
[style align=center]
[if exp="f.dress!='leisure'"]
	[font size=24][link target=*leisure1]穿上[endlink][s]
[else]
	已穿着该服饰。[l][jump target=*item]
[endif]
*leisure1
[eval exp="tf.beforeChange=f.dress"][eval exp="f.dress='leisure'"]
[layopt layer=message2 visible=true][layopt layer=message3 visible=false]
[america pos=l layer=0 feeling=normal][layopt layer=0 left=400]
	[if exp="tf.beforeChange=='militia'"]
		[attributesDialog x=150 y=180 layer=message2 line=2]
			[eval exp="attributeBar(1000, f.power, 102, 76, 120)"]
			[eval exp="attributeBar(1000, f.discipline, 102, 106, 120)"]
			[locate x=0 y=0]武力
			[locate x=0 y=30]军纪
			[locate x=88 y=-8][emb exp="Math.round(f.power)"]
			[locate x=86 y=22][emb exp="Math.round(f.discipline)"]
		[endnowait][current layer=message1][l]
		[eval exp="f.power-=25"][eval exp="f.discipline-=25"]
		[attributesDialog x=150 y=180 layer=message2 line=2]
			[eval exp="attributeBar(1000, f.power, 102, 76, 120)"]
			[eval exp="attributeBar(1000, f.discipline, 102, 106, 120)"]
			[locate x=0 y=0]武力
			[locate x=0 y=30]军纪
			[locate x=88 y=-8][emb exp="Math.round(f.power)"]
			[locate x=86 y=22][emb exp="Math.round(f.discipline)"]
		[endnowait][current layer=message1][l][er]
	[elsif exp="tf.beforeChange=='uniform'"]
		[attributesDialog x=150 y=180 layer=message2 line=2]
			[eval exp="attributeBar(1000, f.power, 102, 76, 120)"]
			[eval exp="attributeBar(1000, f.discipline, 102, 106, 120)"]
			[locate x=0 y=0]武力
			[locate x=0 y=30]军纪
			[locate x=88 y=-8][emb exp="Math.round(f.power)"]
			[locate x=86 y=22][emb exp="Math.round(f.discipline)"]
		[endnowait][current layer=message1][l]
		[eval exp="f.power-=25"][eval exp="f.discipline-=50"]
		[attributesDialog x=150 y=180 layer=message2 line=2]
			[eval exp="attributeBar(1000, f.power, 102, 76, 120)"]
			[eval exp="attributeBar(1000, f.discipline, 102, 106, 120)"]
			[locate x=0 y=0]武力
			[locate x=0 y=30]军纪
			[locate x=88 y=-8][emb exp="Math.round(f.power)"]
			[locate x=86 y=22][emb exp="Math.round(f.discipline)"]
		[endnowait][current layer=message1][l][er]
	[endif]
[jump target=*item]

*militia
[position layer=message2 visible=true left=30 top=400 frame=dialog3 margint=5 marginb=10 marginl=10 marginr=5]
[current layer=message2][er]
[font size=15 color=0xFFFFFF edge=false]民兵自制的非正规军服。
[showMessageBox3]
[locate x=205 y=2][button graphic=close target=*item]
[locate y=20]
[style align=center]
[if exp="f.dress!='militia'"][style align=center]
	[font size=24][link target=*militia1]穿上[endlink][s]
[else]
	已穿着该服饰。[l][jump target=*item]
[endif]
*militia1
[eval exp="tf.beforeChange=f.dress"][eval exp="f.dress='militia'"]
[layopt layer=message2 visible=true][layopt layer=message3 visible=false]
[america pos=l layer=0 feeling=normal][layopt layer=0 left=400]
	[if exp="tf.beforeChange=='leisure'"]
		[attributesDialog x=150 y=180 layer=message2 line=2]
			[eval exp="attributeBar(1000, f.power, 102, 76, 120)"]
			[eval exp="attributeBar(1000, f.discipline, 102, 106, 120)"]
			[locate x=0 y=0]武力
			[locate x=0 y=30]军纪
			[locate x=88 y=-8][emb exp="Math.round(f.power)"]
			[locate x=86 y=22][emb exp="Math.round(f.discipline)"]
		[endnowait][current layer=message1][l]
		[eval exp="f.power+=25"][eval exp="f.power=1000" cond="f.power>1000"]
		[eval exp="f.discipline+=25"][eval exp="f.discipline=1000" cond="f.discipline>1000"]
		[attributesDialog x=150 y=180 layer=message2 line=2]
			[eval exp="attributeBar(1000, f.power, 102, 76, 120)"]
			[eval exp="attributeBar(1000, f.discipline, 102, 106, 120)"]
			[locate x=0 y=0]武力
			[locate x=0 y=30]军纪
			[locate x=88 y=-8][emb exp="Math.round(f.power)"]
			[locate x=86 y=22][emb exp="Math.round(f.discipline)"]
		[endnowait][current layer=message1][l][er]
	[elsif exp="tf.beforeChange=='uniform'"]
		[attributesDialog x=150 y=180 layer=message2 line=1]
			[eval exp="attributeBar(1000, f.discipline, 102, 76, 120)"]
			[locate x=0 y=0]军纪
			[locate x=88 y=-8][emb exp="Math.round(f.discipliner)"]
		[endnowait][current layer=message1][l]
		[eval exp="f.discipline-=25"]
		[attributesDialog x=150 y=180 layer=message2 line=1]
			[eval exp="attributeBar(1000, f.discipline, 102, 76, 120)"]
			[locate x=0 y=0]军纪
			[locate x=88 y=-8][emb exp="Math.round(f.discipline)"]
		[endnowait][current layer=message1][l][er]
	[endif]
[jump target=*item]

*uniform
[position layer=message2 visible=true left=30 top=400 frame=dialog3 margint=5 marginb=10 marginl=10 marginr=5]
[current layer=message2][er]
[font size=15 color=0xFFFFFF edge=false]正规军装。
[showMessageBox3]
[locate x=205 y=2][button graphic=close target=*item]
[locate y=20]
[style align=center]
[if exp="f.dress!='uniform'"]
	[font size=24][link target=*uniform1]穿上[endlink][s]
[else]
	已穿着该服饰。[l][jump target=*item]
[endif]
*uniform1
[eval exp="tf.beforeChange=f.dress"][eval exp="f.dress='uniform'"]
[layopt layer=message2 visible=true][layopt layer=message3 visible=false]
[america pos=l layer=0 feeling=normal][layopt layer=0 left=400]
	[if exp="tf.beforeChange=='leisure'"]
		[attributesDialog x=150 y=180 layer=message2 line=2]
			[eval exp="attributeBar(1000, f.power, 102, 76, 120)"]
			[eval exp="attributeBar(1000, f.discipline, 102, 106, 120)"]
			[locate x=0 y=0]武力
			[locate x=0 y=30]军纪
			[locate x=88 y=-8][emb exp="Math.round(f.power)"]
			[locate x=86 y=22][emb exp="Math.round(f.discipline)"]
		[endnowait][current layer=message1][l]
		[eval exp="f.power+=25"][eval exp="f.power=1000" cond="f.power>1000"]
		[eval exp="f.discipline+=50"][eval exp="f.discipline=1000" cond="f.discipline>1000"]
		[attributesDialog x=150 y=180 layer=message2 line=2]
			[eval exp="attributeBar(1000, f.power, 102, 76, 120)"]
			[eval exp="attributeBar(1000, f.discipline, 102, 106, 120)"]
			[locate x=0 y=0]武力
			[locate x=0 y=30]军纪
			[locate x=88 y=-8][emb exp="Math.round(f.power)"]
			[locate x=86 y=22][emb exp="Math.round(f.discipline)"]
		[endnowait][current layer=message1][l][er]
	[elsif exp="tf.beforeChange=='militia'"]
		[attributesDialog x=150 y=180 layer=message2 line=1]
			[eval exp="attributeBar(1000, f.discipline, 102, 76, 120)"]
			[locate x=0 y=0]军纪
			[locate x=88 y=-8][emb exp="Math.round(f.discipliner)"]
		[endnowait][current layer=message1][l]
		[eval exp="f.discipline+=25"][eval exp="f.discipline=1000" cond="f.discipline>1000"]
		[attributesDialog x=150 y=180 layer=message2 line=1]
			[eval exp="attributeBar(1000, f.discipline, 102, 76, 120)"]
			[locate x=0 y=0]军纪
			[locate x=88 y=-8][emb exp="Math.round(f.discipline)"]
		[endnowait][current layer=message1][l][er]
	[endif]
[jump target=*item]


*letter1
[position layer=message2 visible=true left=30 top=400 frame=dialog3 margint=5 marginb=10 marginl=10 marginr=5]
[current layer=message2][er]
[font size=15 color=0xFFFFFF edge=false]英国寄来的信件。
[showMessageBox3]
[locate x=205 y=2][button graphic=close target=*item]
[locate y=20][style align=center][font size=24]
[link target=*letter11]阅读[endlink][r]
[link target=*letter12]交予上司[endlink][s]
*letter11
	[position layer=message3 visible=false]
	[call storage='letter.ks' target=*readLetter1]
	[jump target=*item]
*letter12
	[position layer=message1 visible=false][layopt layer=message3 visible=false]
	[image storage='Washington' layer=1 pos=l][layopt layer=1 visible=true]
	[talk layer=message2 name='阿美利加']
		上司，还是你拿回去吧。[l][er]
	[talk name='华盛顿']
		你真的要这么做吗？[r]说不定会错过重要的事情喔。[l][er]
	[talk name='阿美利加' feeling='cute']
		那你去看好啦。[r]有什么消息，我才不在意。[r]我还没有那种闲工夫去看他的字呢。[l][er]
	[talk name='阿美利加' feeling='frustrated']
		或许是心里没有准备好面对他吧。[l][er]
	[layopt layer=2 visible=false]
	[eval exp="f.i_letter1=0"]
	[attributesDialog x=350 y=180 layer=message2 line=1]
		[eval exp="attributeBar(1000, f.discipline, 102, 76, 120)"]
		[locate x=0 y=0]军纪
		[locate x=88 y=-8][emb exp="Math.round(f.discipline)"]
	[endnowait][current layer=message1][l]
	[eval exp="f.discipline+=20"][eval exp="f.discipline=1000" cond="f.discipline>1000"]
	[attributesDialog x=350 y=180 layer=message2 line=1]
		[eval exp="attributeBar(1000, f.discipline, 102, 76, 120)"]
		[locate x=0 y=0]军纪
		[locate x=88 y=-8][emb exp="Math.round(f.discipline)"]
	[endnowait][current layer=message1][l]
	[layopt layer=1 visible=false]
	
[jump target=*item]

*letter2
[position layer=message2 visible=true left=30 top=400 frame=dialog3 margint=5 marginb=10 marginl=10 marginr=5]
[current layer=message2][er]
[font size=15 color=0xFFFFFF edge=false]英国寄来的第二封信件，还附送了点心作为引诱。
[showMessageBox3]
[locate x=205 y=2][button graphic=close target=*item]
[locate y=18]
[style align=center]
[font size=24]
[link target=*letter21]只阅读[endlink][r]
[link target=*letter22]阅读并吃掉点心[endlink][r]
[link target=*letter23]交予上司[endlink][s]
*letter21
	[call storage="letter.ks" target=*readLetter2withoutEating]
	[jump target=*item]
*letter22
	[call storage="letter.ks" target=*readLetter2withoutEating]
	[call storage="letter.ks" target=*readLetter2withEating]
	[jump target=*item]
*letter23
	[layopt layer=message2 visible=false][layopt layer=message3 visible=false]
	[image storage='Washington' layer=1 pos=l][layopt layer=1 visible=true]
	[talk layer=message1 portrait='America_normal']
		我对这封信的内容没有兴趣。[l][er]
	[talk portrait='Washington_']
		我很高兴你能下定决心。[l][er]
	[talk name='阿美利加' feeling='serious']
		事到如今，英国再说什么也不会影响到我了。[l][er]
	[layopt layer=2 visible=false]
	[bottom layer=message1]
	[eval exp="f.i_letter2=0"]
		交予上司了。[l]
	[attributesDialog x=350 y=180 layer=message2 line=1]
		[eval exp="attributeBar(1000, f.discipline, 102, 76, 120)"]
		[locate x=0 y=0]军纪
		[locate x=88 y=-8][emb exp="Math.round(f.discipline)"]
	[endnowait][current layer=message1][l]
	[eval exp="f.discipline+=25"][eval exp="f.discipline=1000" cond="f.discipline>1000"]
	[attributesDialog x=350 y=180 layer=message2 line=1]
		[eval exp="attributeBar(1000, f.discipline, 102, 76, 120)"]
		[locate x=0 y=0]军纪
		[locate x=88 y=-8][emb exp="Math.round(f.discipline)"]
	[endnowait][current layer=message1][l]
	[layopt layer=1 visible=false]
[jump target=*item]


*gun1
[position layer=message2 visible=true left=30 top=400 frame=dialog3 margint=5 marginb=10 marginl=10 marginr=5]
[current layer=message2][er]
[font size=15 color=0xFFFFFF edge=false]滑膛枪。[l]
[jump target=*item]

*gun2
[position layer=message2 visible=true left=30 top=400 frame=dialog3 margint=5 marginb=10 marginl=10 marginr=5]
[current layer=message2][er]
[font size=15 color=0xFFFFFF edge=false]来福枪。相较滑膛枪精准得多，在战役上能大派用场。[l]
[jump target=*item]

*sword
[position layer=message2 visible=true left=30 top=400 frame=dialog3 margint=5 marginb=10 marginl=10 marginr=5]
[current layer=message2][er]
[font size=15 color=0xFFFFFF edge=false]配剑。近战时就靠它攻击敌人了。[l]
[jump target=*item]


*gunsword
[position layer=message2 visible=true left=30 top=400 frame=dialog3 margint=5 marginb=10 marginl=10 marginr=5]
[current layer=message2][er]
[font size=15 color=0xFFFFFF edge=false]在普鲁士指导下改装的枪，大大改良了装备。[l]
[jump target=*item]

*book
[position layer=message2 visible=true left=30 top=400 frame=dialog3 margint=5 marginb=10 marginl=10 marginr=5]
[current layer=message2][er]
[font size=15 color=0xFFFFFF edge=false]书本。[l]
[showMessageBox3]
[locate x=205 y=2][button graphic=close target=*item]
[locate y=20]
[style align=center]
[font size=24]
[link target=*book1]阅读[endlink][s]
*book1
	[position layer=message3 visible=false]
	[eval exp="f.i_book-=1"]
	[attributesDialog x=350 y=180 layer=message2 line=1]
		[eval exp="attributeBar(1000, f.intelligence, 102, 76, 120)"]
		[locate x=0 y=0]智力
		[locate x=88 y=-8][emb exp="Math.round(f.intelligence)"]
	[endnowait][current layer=message1][l]
	[eval exp="f.intelligence+=25"][eval exp="f.intelligence=1000" cond="f.intelligence>1000"]
	[attributesDialog x=350 y=180 layer=message2 line=1]
		[eval exp="attributeBar(1000, f.intelligence, 102, 76, 120)"]
		[locate x=0 y=0]智力
		[locate x=88 y=-8][emb exp="Math.round(f.intelligence)"]
	[endnowait][current layer=message1][l]
[jump target=*item]

*common_sence
[position layer=message2 visible=true left=30 top=400 frame=dialog3 margint=5 marginb=10 marginl=10 marginr=5]
[current layer=message2][er]
[font size=15 color=0xFFFFFF edge=false]50页小册子，论证北美洲十三个英国殖民地独立的合理性和必要性。[l]
[showMessageBox3]
[locate y=20][style align=center][font size=24]
[link target=*common_sence1]阅读[endlink][s]
*common_sence1
[layopt layer=message1 visible=false][layopt layer=message3 visible=false]
[talk layer=message2 name='阿美利加' feeling='serious']
	人的自然权利先于政府存在，即使是亚瑟也不能干预！[l][er]
[eval exp="f.intelligence+=35"][eval exp="f.intelligence=1000" cond="f.intelligence>1000"][eval exp="f.AB-=10"][eval exp="f.i_common_sence=0"]
[layopt layer=2 visible=false]
[bottom layer=message2]
	智力+35[l]
[jump target=*item]

*dessert
[position layer=message2 visible=true left=30 top=400 frame=dialog3 margint=5 marginb=10 marginl=10 marginr=5]
[current layer=message2][er]
[font size=15 color=0xFFFFFF edge=false]让人放松心情的点心。
[showMessageBox3]
[locate x=205 y=2][button graphic=close target=*item]
[locate y=20][style align=center][font size=24]
	[link target=*dessert1]吃掉[endlink][s]
*dessert1
	[eval exp="f.i_dessert-=1"]
	[layopt layer=message2 visible=false][layopt layer=message3 visible=false]
	[talk layer=message1 portrait='America_normal']
		感觉轻松多了。
	[attributesDialog x=350 y=180 layer=message2 line=2]
		[eval exp="attributeBar(200, f.fatigue, 102, 76, 120)"]
		[eval exp="attributeBar(100, f.health, 102, 106, 120)"]
		[locate x=0 y=0]疲累
		[locate x=0 y=30]健康
		[locate x=88 y=-8][emb exp="Math.round(f.fatigue)"]
		[locate x=86 y=22][emb exp="Math.round(f.health)"]
	[endnowait][current layer=message1][l]
	[eval exp="f.fatigue-=75"][eval exp="f.fatigue=0" cond="f.fatigue<0"][eval exp="f.health-=5"]
	[attributesDialog x=350 y=180 layer=message2 line=2]
		[eval exp="attributeBar(200, f.fatigue, 102, 76, 120)"]
		[eval exp="attributeBar(100, f.health, 102, 106, 120)"]
		[locate x=0 y=0]疲累
		[locate x=0 y=30]健康
		[locate x=88 y=-8][emb exp="Math.round(f.fatigue)"]
		[locate x=86 y=22][emb exp="Math.round(f.health)"]
	[endnowait][current layer=message1][l][er]
[jump target=*item]

*medicine
[position layer=message2 visible=true left=30 top=400 frame=dialog3 margint=5 marginb=10 marginl=10 marginr=5]
[current layer=message2][er]
[font size=15 color=0xFFFFFF edge=false]治疗用的药物，能提升体魄。
[showMessageBox3]
[locate x=205 y=2][button graphic=close target=*item]
[locate y=20][style align=center][font size=24]
[link target=*medicine1]吃掉[endlink][s]
*medicine1
[eval exp="f.i_medicine-=1"]
[layopt layer=message2 visible=false][layopt layer=message3 visible=false]
[talk layer=message1 portrait='America_normal']
	我讨厌吃药...[l]
[if exp="f.state=='生病'"]
	[attributesDialog x=350 y=180 layer=message2 line=2]
		[eval exp="attributeBar(200, f.fatigue, 102, 76, 120)"]
		[eval exp="attributeBar(100, f.health, 102, 106, 120)"]
		[locate x=0 y=0]疲累
		[locate x=0 y=30]健康
		[locate x=88 y=-8][emb exp="Math.round(f.fatigue)"]
		[locate x=86 y=22][emb exp="Math.round(f.health)"]
	[endnowait][current layer=message1][l]
	[eval exp="f.fatigue-=30"][eval exp="f.fatigue=0" cond="f.fatigue<30"]
	[eval exp="f.health+=10"][eval exp="f.health=100" cond="f.health>100"]
	[attributesDialog x=350 y=180 layer=message2 line=2]
		[eval exp="attributeBar(200, f.fatigue, 102, 76, 120)"]
		[eval exp="attributeBar(100, f.health, 102, 106, 120)"]
		[locate x=0 y=0]疲累
		[locate x=0 y=30]健康
		[locate x=88 y=-8][emb exp="Math.round(f.fatigue)"]
		[locate x=86 y=22][emb exp="Math.round(f.health)"]
	[endnowait][current layer=message1][l][er]
[else]
	[attributesDialog x=350 y=180 layer=message2 line=1]
		[eval exp="attributeBar(100, f.health, 102, 76, 120)"]
		[locate x=0 y=0]健康
		[locate x=88 y=-8][emb exp="Math.round(f.health)"]
	[endnowait][current layer=message1][l]
	[eval exp="f.health+=5"][eval exp="f.health=100" cond="f.health>100"]
	[attributesDialog x=350 y=180 layer=message2 line=1]
		[eval exp="attributeBar(100, f.health, 102, 76, 120)"]
		[locate x=0 y=0]健康
		[locate x=88 y=-8][emb exp="Math.round(f.health)"]
	[endnowait][current layer=message1][l][er]
[endif]
[layopt layer=2 visible=false]
[jump target=*item]

*training_manual
[position layer=message2 visible=true left=30 top=400 frame=dialog3 margint=5 marginb=10 marginl=10 marginr=5]
[current layer=message2][er]
[font size=15 color=0xFFFFFF edge=false]普鲁士撰写的训练手册。[l]
[jump target=*item]