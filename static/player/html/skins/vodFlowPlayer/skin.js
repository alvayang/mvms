/*
 * Name: VodFlowPlayer SewisePlayerSkin framework V1.0.0
 * Author: Jack Zhang
 * Website: http://www.sewise.com/
 * Date: 12th June 2014
 * Copyright: 2014, Sewise
 * 
 */


(function(a){a.SewisePlayerSkin={version:"1.0.0"};a.SewisePlayer=a.SewisePlayer||{}})(window);(function(a){a.SewisePlayer.IVodPlayer=a.SewisePlayer.IVodPlayer||{play:function(){},pause:function(){},stop:function(){},seek:function(){},changeClarity:function(){},setVolume:function(){},toPlay:function(){},duration:function(){},playTime:function(){},type:function(){},showTextTip:function(){},hideTextTip:function(){},muted:function(){}}})(window);(function(a){a.SewisePlayerSkin.IVodSkin=a.SewisePlayerSkin.IVodSkin||{player:function(){},started:function(){},paused:function(){},stopped:function(){},seeking:function(){},buffering:function(){},bufferProgress:function(){},loadedProgress:function(){},programTitle:function(){},duration:function(){},playTime:function(){},startTime:function(){},loadSpeed:function(){},initialClarity:function(){},lang:function(){},logo:function(){},timeUpdate:function(){},volume:function(){},clarityButton:function(){},
timeDisplay:function(){},controlBarDisplay:function(){},topBarDisplay:function(){},customStrings:function(){}}})(window);(function(){SewisePlayerSkin.Utils={stringer:{time2FigFill:function(a){var c,a=Math.floor(a);10>a?c="0"+a:c=""+a;return c},secondsToHMS:function(a){if(!(0>a)){var c=this.time2FigFill(Math.floor(a/3600)),d=this.time2FigFill(a/60%60),a=this.time2FigFill(a%60);return c+":"+d+":"+a}},secondsToMS:function(a){if(!(0>a)){var c=this.time2FigFill(a/60),a=this.time2FigFill(a%60);return c+":"+a}},dateToTimeString:function(a){var c;c=a?a:new Date;var a=c.getFullYear(),d=c.getMonth()+1,h=c.getDate(),n=this.time2FigFill(c.getHours()),
f=this.time2FigFill(c.getMinutes());c=this.time2FigFill(c.getSeconds());return a+"-"+d+"-"+h+" "+n+":"+f+":"+c},dateToTimeStr14:function(a){var c=a.getFullYear(),d=this.time2FigFill(a.getMonth()+1),h=this.time2FigFill(a.getDate()),n=this.time2FigFill(a.getHours()),f=this.time2FigFill(a.getMinutes()),a=this.time2FigFill(a.getSeconds());return c+d+h+n+f+a},dateToStrHMS:function(a){var c=this.time2FigFill(a.getHours()),d=this.time2FigFill(a.getMinutes()),a=this.time2FigFill(a.getSeconds());return c+
":"+d+":"+a}}}})();(function(a){SewisePlayerSkin.ElementObject=function(){this.$sewisePlayerUi=a(".sewise-player-ui");this.$container=this.$sewisePlayerUi.parent();this.$video=this.$container.find("video").get(0);this.$controlbar=this.$sewisePlayerUi.find(".controlbar");this.$playBtn=this.$sewisePlayerUi.find(".controlbar-btns-play");this.$pauseBtn=this.$sewisePlayerUi.find(".controlbar-btns-pause");this.$stopBtn=this.$sewisePlayerUi.find(".controlbar-btns-stop");this.$fullscreenBtn=this.$sewisePlayerUi.find(".controlbar-btns-fullscreen");
this.$normalscreenBtn=this.$sewisePlayerUi.find(".controlbar-btns-normalscreen");this.$soundopenBtn=this.$sewisePlayerUi.find(".controlbar-btns-soundopen");this.$soundcloseBtn=this.$sewisePlayerUi.find(".controlbar-btns-soundclose");this.$volumelineVolume=this.$sewisePlayerUi.find(".controlbar-volumeline-volume");this.$volumelineDragger=this.$sewisePlayerUi.find(".controlbar-volumeline-dragger");this.$volumelinePoint=this.$sewisePlayerUi.find(".controlbar-volumeline-point");this.$playtime=this.$sewisePlayerUi.find(".controlbar-playtime");
this.$totaltime=this.$sewisePlayerUi.find(".controlbar-totaltime");this.$controlBarProgress=this.$sewisePlayerUi.find(".controlbar-progress");this.$progressPlayedLine=this.$sewisePlayerUi.find(".controlbar-progress-playedline");this.$progressPlayedPoint=this.$sewisePlayerUi.find(".controlbar-progress-playpoint");this.$progressLoadedLine=this.$sewisePlayerUi.find(".controlbar-progress-loadedline");this.$progressSeekLine=this.$sewisePlayerUi.find(".controlbar-progress-seekline");this.$logo=this.$sewisePlayerUi.find(".logo");
this.$logoIcon=this.$sewisePlayerUi.find(".logo-icon");this.$topbar=this.$sewisePlayerUi.find(".topbar");this.$programTitle=this.$sewisePlayerUi.find(".topbar-program-title");this.$topbarClock=this.$sewisePlayerUi.find(".topbar-clock");this.$buffer=this.$sewisePlayerUi.find(".buffer");this.$bigPlayBtn=this.$sewisePlayerUi.find(".big-play-btn");this.defStageWidth=this.$container.width();this.defStageHeight=this.$container.height()}})(window.jQuery);(function(a){SewisePlayerSkin.ElementLayout=function(c){function d(){null!=document.fullscreenElement||null!=document.msFullscreenElement||null!=document.mozFullScreenElement||null!=document.webkitFullscreenElement?r.fullScreen():r.normalScreen()}var h=c.$container,n=c.$controlBarProgress,f=c.$playtime,r=this,i=c.defStageWidth,C=c.defStageHeight,k=parseInt(i)-265;0>k&&(k+=f.width(),f.hide());n.css("width",k);document.addEventListener("fullscreenchange",d);document.addEventListener("MSFullscreenChange",
d);document.addEventListener("mozfullscreenchange",d);document.addEventListener("webkitfullscreenchange",d);this.fullScreen=function(c){if("not-support"==c){var c=a(window).width()-15,k=a(window).height()-15;h.css("width",c);h.css("height",k)}else h.css("width","100%"),h.css("height","100%");c=parseInt(h.width())-265;0>c?(c+=f.width(),f.hide()):f.show();n.css("width",c)};this.normalScreen=function(){h.css("width",i);h.css("height",C);k=parseInt(i)-265;0>k?(k+=f.width(),f.hide()):f.show();n.css("width",
k)}}})(window.jQuery);(function(){SewisePlayerSkin.LogoBox=function(a){var c=a.$logoIcon;this.setLogo=function(a){c.css("background","url("+a+") 0px 0px no-repeat");c.attr("href","http://www.sewise.com/")}}})(window.jQuery);(function(){SewisePlayerSkin.TopBar=function(a){var c=a.$topbar,d=a.$programTitle,h=a.$topbarClock;setInterval(function(){var a=SewisePlayerSkin.Utils.stringer.dateToTimeString();h.text(a)},1E3);this.setTitle=function(a){d.text(a)};this.show=function(){c.css("visibility","visible")};this.hide=function(){c.css("visibility","hidden")};this.hide2=function(){c.hide()}}})(window.jQuery);(function(a){SewisePlayerSkin.ControlBar=function(c,d,h){function n(b){b=l+(b.pageX-w);0<b&&b<s&&(t.css("width",b),o.css("left",b-D/2))}function f(b){x.unbind("mousemove",n);a(document).unbind("mouseup",f);K=b.pageX;w!=K&&(l=t.width(),y=l/s,j.seek(y*z));E=!1}function r(b){e=b.originalEvent;1==e.targetTouches.length&&(e.preventDefault(),b=l+(e.targetTouches[0].pageX-w),0<b&&b<s&&(t.css("width",b),o.css("left",b-D/2)))}function i(b){e=b.originalEvent;o.unbind("touchmove",r);o.unbind("touchend",i);if(1==
e.changedTouches.length)K=e.changedTouches[0].pageX,w!=K&&(l=t.width(),y=l/s,j.seek(y*z));E=!1}function C(b){b=g+(b.pageX-A);0<b&&b<p&&(q.css("width",b),m.css("left",b-v/2))}function k(b){x.unbind("mousemove",C);a(document).unbind("mouseup",k);L=b.pageX;A!=L&&(g=q.width(),u=g/p,j.setVolume(u),M())}function U(b){e=b.originalEvent;1==e.targetTouches.length&&(e.preventDefault(),b=g+(e.targetTouches[0].pageX-A),0<b&&b<p&&(q.css("width",b),m.css("left",b-v/2)))}function V(b){e=b.originalEvent;m.unbind("touchmove",
U);m.unbind("touchend",V);if(1==e.changedTouches.length)L=e.changedTouches[0].pageX,A!=L&&(g=q.width(),u=g/p,j.setVolume(u),M())}function M(){0<u?(j.muted(!1),F.show(),B.hide()):(j.muted(!0),F.hide(),B.show())}var x=c.$container,R=c.$video,N=c.$controlbar,O=c.$playBtn,G=c.$pauseBtn,Y=c.$stopBtn,P=c.$fullscreenBtn,H=c.$normalscreenBtn,F=c.$soundopenBtn,B=c.$soundcloseBtn,q=c.$volumelineVolume,I=c.$volumelineDragger,m=c.$volumelinePoint,Z=c.$playtime,$=c.$totaltime,t=c.$progressPlayedLine,o=c.$progressPlayedPoint,
aa=c.$progressLoadedLine,J=c.$progressSeekLine,ba=c.$buffer,Q=c.$bigPlayBtn,j,z=0.1,S=0,W="00:00:00",X="00:00:00",D=0,E=!1,w=0,K=0,l=0,s=0,y=0,T=!0,v=0,p=0,g=0,u=0,A=0,L=0,D=o.width(),s=J.width(),v=m.width(),p=I.width();G.hide();H.hide();B.hide();ba.hide();N.click(function(b){b.originalEvent.stopPropagation()});x.click(function(){T?(N.css("visibility","hidden"),h.hide(),T=!1):(N.css("visibility","visible"),h.show(),T=!0)});O.click(function(){j.play()});G.click(function(){j.pause()});Y.click(function(){j.stop()});
Q.click(function(b){b.originalEvent.stopPropagation();j.play()});P.click(function(){P.hide();H.show();var b=x.get(0);b.requestFullscreen?b.requestFullscreen():b.msRequestFullscreen?b.msRequestFullscreen():b.mozRequestFullScreen?b.mozRequestFullScreen():b.webkitRequestFullscreen?b.webkitRequestFullscreen():R.webkitEnterFullscreen?(R.play(),R.webkitEnterFullscreen(),P.show(),H.hide()):d.fullScreen("not-support")});H.click(function(){P.show();H.hide();document.exitFullscreen?document.exitFullscreen():
document.msExitFullscreen?document.msExitFullscreen():document.mozCancelFullScreen?document.mozCancelFullScreen():document.webkitCancelFullScreen?document.webkitCancelFullScreen():d.normalScreen()});F.click(function(){j.muted(!0);F.hide();B.show();q.css("width",0);m.css("left",-v/2)});B.click(function(){j.muted(!1);F.show();B.hide();q.css("width",g);m.css("left",g-v/2)});J.mousedown(function(b){l=b.pageX-b.target.getBoundingClientRect().left;s=J.width();t.css("width",l);o.css("left",l-D/2);y=l/s;
j.seek(y*z)});o.mousedown(function(b){this.blur();E=!0;w=b.pageX;l=t.width();s=J.width();x.bind("mousemove",n);a(document).bind("mouseup",f)});o.bind("touchstart",function(b){e=b.originalEvent;o.blur();b=e.targetTouches[0];E=!0;w=b.pageX;l=t.width();s=J.width();o.bind("touchmove",r);o.bind("touchend",i)});I.mousedown(function(b){g=b.pageX-b.target.getBoundingClientRect().left;p=I.width();q.css("width",g);m.css("left",g-v/2);u=g/p;j.setVolume(u);M()});m.mousedown(function(b){this.blur();A=b.pageX;
g=q.width();p=I.width();x.bind("mousemove",C);a(document).bind("mouseup",k)});m.bind("touchstart",function(b){e=b.originalEvent;m.blur();A=e.targetTouches[0].pageX;g=q.width();p=I.width();m.bind("touchmove",U);m.bind("touchend",V)});this.setPlayer=function(b){j=b};this.started=function(){O.hide();G.show();Q.hide()};this.paused=function(){O.show();G.hide();Q.show()};this.stopped=function(){O.show();G.hide();Q.show()};this.setDuration=function(b){z=b;X=SewisePlayerSkin.Utils.stringer.secondsToMS(z);
$.text(X)};this.timeUpdate=function(b){S=b;W=SewisePlayerSkin.Utils.stringer.secondsToMS(S);Z.text(W);E||(l=100*(S/z)+"%",t.css("width",l),b=t.width()-D/2,o.css("left",b))};this.loadProgress=function(b){aa.css("width",100*b+"%")};this.initVolume=function(b){u=b;g=p*u;q.css("width",g);m.css("left",g-v/2);M()};this.hide2=function(){N.hide()}}})(window.jQuery);(function(a,c){c(document).ready(function(){var a=SewisePlayer.IVodPlayer,c=new SewisePlayerSkin.ElementObject,n=new SewisePlayerSkin.ElementLayout(c),f=new SewisePlayerSkin.LogoBox(c),r=new SewisePlayerSkin.TopBar(c),i=new SewisePlayerSkin.ControlBar(c,n,r);SewisePlayerSkin.IVodSkin.player=function(c){a=c;i.setPlayer(a)};SewisePlayerSkin.IVodSkin.started=function(){i.started()};SewisePlayerSkin.IVodSkin.paused=function(){i.paused()};SewisePlayerSkin.IVodSkin.stopped=function(){i.stopped()};SewisePlayerSkin.IVodSkin.duration=
function(a){i.setDuration(a)};SewisePlayerSkin.IVodSkin.timeUpdate=function(a){i.timeUpdate(a)};SewisePlayerSkin.IVodSkin.loadedProgress=function(a){i.loadProgress(a)};SewisePlayerSkin.IVodSkin.programTitle=function(a){r.setTitle(a)};SewisePlayerSkin.IVodSkin.logo=function(a){f.setLogo(a)};SewisePlayerSkin.IVodSkin.volume=function(a){i.initVolume(a)};SewisePlayerSkin.IVodSkin.initialClarity=function(){};SewisePlayerSkin.IVodSkin.clarityButton=function(){};SewisePlayerSkin.IVodSkin.timeDisplay=function(){};
SewisePlayerSkin.IVodSkin.controlBarDisplay=function(a){"enable"!=a&&i.hide2()};SewisePlayerSkin.IVodSkin.topBarDisplay=function(a){"enable"!=a&&r.hide2()};SewisePlayerSkin.IVodSkin.customStrings=function(){};try{SewisePlayer.CommandDispatcher.dispatchEvent({type:SewisePlayer.Events.PLAYER_SKIN_LOADED,playerSkin:SewisePlayerSkin.IVodSkin})}catch(C){console.log("No Main Player")}})})(window,window.jQuery);
