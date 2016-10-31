*Treaty_of_Paris
	[if exp="f.win=='W'"]
		[eval exp="f.stage='E'"]
		[call target=*win_E]
	[else]
		[eval exp="f.stage='F'"]
		[call target=*lose_F]
	[endif]
[return]

*win_E
	[showDate]
	[image storage="Washington" visible=true page=fore pos=l layer=0]
	[america pos='r' feeling='normal' layer=1]
	[showDate event='巴黎条约书拟']

	[image storage="Hotel_d'York" layer=base page=back]
	[trans method=universal rule=universal_1 time=1000 children=false][wt canskip=true][wait time=100]
	[bottom layer=message1]
		整个夏天，我不得不和英国交涉会议的事宜。[l][er]
		两家的上司态度时缓时紧，即使是到了现在终于签署的日子，也丝毫没有改善。[r]……至于我和英国，尽管已经厌倦了恶语相向，也几乎没有多少让人愉快的交集。[l][er]
		西班牙，法国，德国，不时在走廊里进进出出。[r]英国则不动声色地坐在桌子的那一头。[r]他沉默的绿眼睛时不时出现在我的视线里。[l][er]
		看惯了愤怒和怨恨的眼神，从前那种和善的微笑反而成为遥远的回忆。[r]而现在的表情或许同这两种都不同。[r]是疲惫吗？无奈吗？还是只是单纯厌倦的眼神？[l][er]
	[image storage="France_normal_" visible=true pos=l layer=0]
	[america pos='r' feeling='normal' layer=1]
	[talk layer=message1 name="法国"]
		美国！恭喜你战胜了呢。[l][er]
	[talk name="阿美利加"]
		谢谢了。没有你的援助是达成不了的。[l][er]
	[talk name="法国"]
		这个啊...哥哥有个小小的要求呢...[r]
		关于多巴哥岛和...[l][er]
	[bottom layer=message1]在签约的事宜上，我和法国的利益产生矛盾了。[l][er]
	[image storage="England_uniform_normal" visible=true page=back pos=lc layer=0]
	[image storage="England_uniform_normal" visible=true page=back pos=l layer=2]
	[quake time=2000 timemode=ms]
	[talk name="英国" feeling="serious"]
		法国你这混蛋！[wait time=1500][l][er]
	[talk name="法国" feeling="shock"]
		啊！英国![l][er]
	[talk name="英国" feeling="normal"]
		阿美利加，我们能直接谈吗？[l][er]
	[talk name="阿美利加"]
		......[r]
		嗯。[l][er]
	[image storage="England_uniform_normal" visible=true page=fore pos=l layer=0]
	[layopt layer=2 visible=false]
	[talk name="阿美利加" feeling="frustrated"]
		这并不是我想要的全部。[l][er]
	[talk name="英国"]
		而你不能从我这里期待更多，阿美利加。[l][er]
	[talk name="阿美利加" feeling="serious"]
		只需要一只眼睛就能够觉察你的’诚意’——要是它能够被称为诚意的话！[l][er]
	[talk name="英国"]
		我想这是你我都期待的。你和你的朋友可以回家去，瘸了腿的，瞎了眼的，仍可以盖新房子。而你——我亲爱的阿美利加——你所日夜以求的独立就在眼前了。[l][er]
	[talk name="英国" feeling="wrySmile"]
		只要愿意，我的孩子，你仍然可以依靠我，像从前那样。[l][er]
	[talk name="阿美利加"]
		无论老人如何感叹过去，也只不过是无用的叹息。[l][er]
	[talk name="英国" feeling="wrySmile"]
		至少表现出对老人的敬意吧？[l][er]
	[talk name="阿美利加"]
		你该学会适可而止了。[l][er]
	[bottom layer=message1]我签下名字。——英国将会让出这样多的土地，我们的胜利着实越来越近了。[l][er]
	[showCG cg='CG_draftedOfTreatyOfParis']
	[image storage="independence_hall" layer=base]
	[wait time=1500]
	[image storage="Washington" layer=0 pos=l]
	[layopt layer=1 visible=false]
	[talk name="华盛顿"]
		终于谈妥了。[r][l]
	[talk name="阿美利加"]
		...嗯。[l][er]
	[talk name="华盛顿"]
		虽然战争大致结束，但仍有很多待处理战后重建，尽快恢复正常运作。[r]
		请你之后抽空处理政务。[l][er]
	[eval exp="f.doc=300"]
	[talk name="阿美利加"]
		知道了。[l][er]
	[talk name="华盛顿"]
		这里的文件，务必在4月前完成。[l][er]
	[setBasePlace]
	[talk history='F']
	[layopt layer=0 visible=false page=fore]
	[layopt layer=1 visible=false page=fore]
	[layopt layer=2 visible=false page=fore]
	[layopt layer=3 visible=false page=fore]
[jump storage="work.ks" target=*endmonth]

*lose_F
	[showDate]
	[image storage="Washington" visible=true page=fore pos=l layer=0]
	[america pos='r' feeling='normal' layer=1]
	[image storage="Hotel_d'York" layer=base]
	[showDate event='伦敦条约书拟']
	[bottom layer=message1]条约的签订定在了伦敦。那天一整天都是阴雨。[l][er]
	[america pos='r' feeling='normal' layer=1]
	[image storage="England_uniform_normal" visible=true pos=l layer=0]
	[talk name="阿美利加"]
		老实说，要来到伦敦真是让人不快。[l][er]
	[talk name="英国"]
		可你不会有其他的选择，阿美利加。[r]选择以战争方式开始的事情，总会有这样一个令人不快的结尾。[r]在将来你呆在我身边的时候会加增，在疏忽对你的关爱这一点上，我已经意识到了自己的失策。[l][er]
		你会悲伤，撕了你的热血宣言；可是你会留在我身边。[l][r]
		别无选择。[l][er]
	[talk name="英国"]
		你现在心情怎样？[l][er]
	[talk name="阿美利加"]
		没什么比伦敦的雨更伤感了。[l][er]
	[talk name="英国"]
		或许。[r]此刻我也感到悲伤。[l][er]我为你准备的房间，原先用来堆放各样没能送出的礼物。[r]它们尽管让我内疚，也同时是我的慰籍。[l][er]
	[talk name="阿美利加"]
		......[l][er]
	[talk name="英国"]
		如今也不再需要它们；你一个人所散发的光，足够温暖我的国度。[l][er]
	[bottom layer=message1]
		[nowait][cleanStar]
		[starLink string='这真是你所希望的吗？' target='*reply1' number=1][r]
		[starLink string='我已经厌倦了你的施与。' target='*reply2' number=2]
		[endnowait][s]
*reply1
	[talk name="阿美利加"]
		这真是你所希望的吗？[l][er]
	[talk name="英国"]
		当然。[l][er]
	[talk name="阿美利加" feeling="shy"]
		要是你真的在意，那么别再以这样居高临下的的眼神看着我。[r]...或许我会乐意妥协。[l][er]
	[eval exp="f.BA+=8, f.AB+=8"]
	[jump targer=*reply3]
*reply2
	[talk name="阿美利加" feeling="serious"]
		我已经厌倦了你的施与。[l][er]我曾经那么渴望，可是瞧瞧吧，那是多么自私的、自作主张的感情？[l][er]
	[talk name="英国"]
　		可是，我的阿美利加，我已经赢得了你。[r]曾经我因为发现你而拥有你，如今是因为胜利。[l][er]
	[eval exp="f.BA-=8, f.AB-=8"]
*reply3
	[showCG cg='CG_draftedOfTreatyOfLondon']
	[talk history='F']
	[bottom layer=message1]在4月正式条约完成前，将被软禁。[l]
	[layopt layer=0 visible=false]
	[layopt layer=1 visible=false]
	[layopt layer=2 visible=false]
	[layopt layer=3 visible=false]
[jump storage="work.ks" target=*endmonth]
