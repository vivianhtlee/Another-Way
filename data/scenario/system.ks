[if exp="sf.gvolume_bgm==void"]
	[eval exp="sf.gvolume_bgm=75"]
	[eval exp="sf.gvolume_se=75"]
[endif]

*system
[position layer=message1 visible=true left=80 top=100 frame=systemBase margint=0 marginb=0 marginl=60 marginr=25]
[current layer=message1][er][font bold=false][nowait]
[locate x=10 y=30]对话显示速度: 快
[locate x=165 y=30][slider value="global.kag.userChSpeed" width=100 height=15 normal=sliderTab max=60 min=20]
[locate x=270 y=30]慢
[locate x=10 y=65]行程显示速度: 快
[locate x=164 y=65][slider value="global.kag.delayTimeOfDialyWork" width=100 height=15 normal=sliderTab max=50 min=10]
[locate x=270 y=65]慢

[locate x=10 y=110]音效音量: [locate x=140]小
[locate x=165 y=110][slider name="seSlider" value="sf.gvolume_se" width=100 height=15 normal=sliderTab max=100 min=0]
[locate x=270 y=110]大
[locate x=10 y=140]背景音量: [locate x=140]小
[locate x=165 y=140]
[slider name="bgmSlider" value="sf.gvolume_bgm" width=100 height=15 max=100 min=0 normal=sliderTab]
[locate x=270 y=140]大
[locate x=75 y=195][link storage="game.ks"]返回[endlink]　　　　[link storage="first.ks"]返回主界面[endlink]
[endnowait][s]

*set_bgm
[bgmopt gvolume=&sf.gvolume_bgm]
[return]

*set_se
[seopt gvolume=&sf.gvolume_se]
[jump target=*system]