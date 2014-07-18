/*
 * Name: VodWhite SewisePlayerSkin framework V1.0.0
 * Author: Jack Zhang
 * Website: http://www.sewise.com/
 * Date: 24th March 2014
 * Copyright: 2014, Sewise
 * 
 */


(function(a){a.SewisePlayerSkin={version:"1.0.0"};a.SewisePlayer=a.SewisePlayer||{}})(window);(function(a){a.SewisePlayer.IVodPlayer=a.SewisePlayer.IVodPlayer||{play:function(){},pause:function(){},stop:function(){},seek:function(){},changeClarity:function(){},setVolume:function(){},toPlay:function(){},duration:function(){},playTime:function(){},type:function(){},showTextTip:function(){},hideTextTip:function(){},muted:function(){}}})(window);(function(a){a.SewisePlayerSkin.IVodSkin=a.SewisePlayerSkin.IVodSkin||{player:function(){},started:function(){},paused:function(){},stopped:function(){},seeking:function(){},buffering:function(){},bufferProgress:function(){},loadedProgress:function(){},programTitle:function(){},duration:function(){},playTime:function(){},startTime:function(){},loadSpeed:function(){},initialClarity:function(){},lang:function(){},logo:function(){},timeUpdate:function(){},volume:function(){},clarityButton:function(){},
timeDisplay:function(){},controlBarDisplay:function(){},topBarDisplay:function(){},customStrings:function(){}}})(window);(function(){SewisePlayerSkin.Utils={stringer:{time2FigFill:function(a){var b,a=Math.floor(a);10>a?b="0"+a:b=""+a;return b},secondsToHMS:function(a){if(!(0>a)){var b=this.time2FigFill(Math.floor(a/3600)),c=this.time2FigFill(a/60%60),a=this.time2FigFill(a%60);return b+":"+c+":"+a}},secondsToMS:function(a){if(!(0>a)){var b=this.time2FigFill(a/60),a=this.time2FigFill(a%60);return b+":"+a}},dateToTimeString:function(a){var b;b=a?a:new Date;var a=b.getFullYear(),c=b.getMonth()+1,f=b.getDate(),j=this.time2FigFill(b.getHours()),
d=this.time2FigFill(b.getMinutes());b=this.time2FigFill(b.getSeconds());return a+"-"+c+"-"+f+" "+j+":"+d+":"+b},dateToTimeStr14:function(a){var b=a.getFullYear(),c=this.time2FigFill(a.getMonth()+1),f=this.time2FigFill(a.getDate()),j=this.time2FigFill(a.getHours()),d=this.time2FigFill(a.getMinutes()),a=this.time2FigFill(a.getSeconds());return b+c+f+j+d+a},dateToStrHMS:function(a){var b=this.time2FigFill(a.getHours()),c=this.time2FigFill(a.getMinutes()),a=this.time2FigFill(a.getSeconds());return b+
":"+c+":"+a}}}})();(function(a){SewisePlayerSkin.ElementObject=function(){this.$sewisePlayerUi=a(".sewise-player-ui");this.$container=this.$sewisePlayerUi.parent();this.$video=this.$container.find("video").get(0);this.$controlbar=this.$sewisePlayerUi.find(".controlbar");this.$playBtn=this.$sewisePlayerUi.find(".controlbar-btns-play");this.$pauseBtn=this.$sewisePlayerUi.find(".controlbar-btns-pause");this.$stopBtn=this.$sewisePlayerUi.find(".controlbar-btns-stop");this.$fullscreenBtn=this.$sewisePlayerUi.find(".controlbar-btns-fullscreen");
this.$normalscreenBtn=this.$sewisePlayerUi.find(".controlbar-btns-normalscreen");this.$soundopenBtn=this.$sewisePlayerUi.find(".controlbar-btns-soundopen");this.$soundcloseBtn=this.$sewisePlayerUi.find(".controlbar-btns-soundclose");this.$playtime=this.$sewisePlayerUi.find(".controlbar-playtime");this.$controlBarProgress=this.$sewisePlayerUi.find(".controlbar-progress");this.$progressPlayedLine=this.$sewisePlayerUi.find(".controlbar-progress-playedline");this.$progressPlayedPoint=this.$sewisePlayerUi.find(".controlbar-progress-playpoint");
this.$progressLoadedLine=this.$sewisePlayerUi.find(".controlbar-progress-loadedline");this.$progressSeekLine=this.$sewisePlayerUi.find(".controlbar-progress-seekline");this.$logo=this.$sewisePlayerUi.find(".logo");this.$logoIcon=this.$sewisePlayerUi.find(".logo-icon");this.$topbar=this.$sewisePlayerUi.find(".topbar");this.$programTitle=this.$sewisePlayerUi.find(".topbar-program-title");this.$topbarClock=this.$sewisePlayerUi.find(".topbar-clock");this.$buffer=this.$sewisePlayerUi.find(".buffer");this.$bigPlayBtn=
this.$sewisePlayerUi.find(".big-play-btn");this.defStageWidth=this.$container.width();this.defStageHeight=this.$container.height()}})(window.jQuery);(function(a){SewisePlayerSkin.ElementLayout=function(b){function c(){null!=document.fullscreenElement||null!=document.msFullscreenElement||null!=document.mozFullScreenElement||null!=document.webkitFullscreenElement?m.fullScreen():m.normalScreen()}var f=b.$container,j=b.$controlBarProgress,d=b.$playtime,m=this,g=b.defStageWidth,p=b.defStageHeight,h=parseInt(g)-288;0>h&&(h+=d.width(),d.hide());j.css("width",h);document.addEventListener("fullscreenchange",c);document.addEventListener("MSFullscreenChange",
c);document.addEventListener("mozfullscreenchange",c);document.addEventListener("webkitfullscreenchange",c);this.fullScreen=function(b){if("not-support"==b){var b=a(window).width()-15,h=a(window).height()-15;f.css("width",b);f.css("height",h)}else f.css("width","100%"),f.css("height","100%");b=parseInt(f.width())-288;0>b?(b+=d.width(),d.hide()):d.show();j.css("width",b)};this.normalScreen=function(){f.css("width",g);f.css("height",p);h=parseInt(g)-288;0>h?(h+=d.width(),d.hide()):d.show();j.css("width",
h)}}})(window.jQuery);(function(){SewisePlayerSkin.LogoBox=function(a){var b=a.$logoIcon;this.setLogo=function(a){b.css("background","url("+a+") 0px 0px no-repeat");b.attr("href","http://www.sewise.com/")}}})(window.jQuery);(function(){SewisePlayerSkin.TopBar=function(a){var b=a.$topbar,c=a.$programTitle,f=a.$topbarClock;setInterval(function(){var a=SewisePlayerSkin.Utils.stringer.dateToTimeString();f.text(a)},1E3);this.setTitle=function(a){c.text(a)};this.show=function(){b.css("visibility","visible")};this.hide=function(){b.css("visibility","hidden")};this.hide2=function(){b.hide()}}})(window.jQuery);(function(a){SewisePlayerSkin.ControlBar=function(b,c,f){function j(a){a=i+(a.pageX-q);0<a&&a<n&&(o.css("width",a),k.css("left",a-t/2))}function d(b){p.unbind("mousemove",j);a(document).unbind("mouseup",d);A=b.pageX;q!=A&&(i=o.width(),r=i/n,l.seek(r*s));u=!1}function m(a){e=a.originalEvent;1==e.targetTouches.length&&(e.preventDefault(),a=i+(e.targetTouches[0].pageX-q),0<a&&a<n&&(o.css("width",a),k.css("left",a-t/2)))}function g(a){e=a.originalEvent;k.unbind("touchmove",m);k.unbind("touchend",g);if(1==
e.changedTouches.length)A=e.changedTouches[0].pageX,q!=A&&(i=o.width(),r=i/n,l.seek(r*s));u=!1}var p=b.$container,h=b.$video,y=b.$controlbar,z=b.$playBtn,v=b.$pauseBtn,J=b.$stopBtn,B=b.$fullscreenBtn,w=b.$normalscreenBtn,E=b.$soundopenBtn,C=b.$soundcloseBtn,K=b.$playtime,o=b.$progressPlayedLine,k=b.$progressPlayedPoint,L=b.$progressLoadedLine,x=b.$progressSeekLine,M=b.$buffer,D=b.$bigPlayBtn,l,s=0.1,F=0,H="00:00:00",I="00:00:00",t=0,u=!1,q=0,A=0,i=0,n=0,r=0,G=!0,t=k.width(),n=x.width();v.hide();w.hide();
C.hide();M.hide();y.click(function(a){a.originalEvent.stopPropagation()});p.click(function(){G?(y.css("visibility","hidden"),f.hide(),G=!1):(y.css("visibility","visible"),f.show(),G=!0)});z.click(function(){l.play()});v.click(function(){l.pause()});J.click(function(){l.stop()});D.click(function(a){a.originalEvent.stopPropagation();l.play()});B.click(function(){B.hide();w.show();var a=p.get(0);a.requestFullscreen?a.requestFullscreen():a.msRequestFullscreen?a.msRequestFullscreen():a.mozRequestFullScreen?
a.mozRequestFullScreen():a.webkitRequestFullscreen?a.webkitRequestFullscreen():h.webkitEnterFullscreen?(h.play(),h.webkitEnterFullscreen(),B.show(),w.hide()):c.fullScreen("not-support")});w.click(function(){B.show();w.hide();document.exitFullscreen?document.exitFullscreen():document.msExitFullscreen?document.msExitFullscreen():document.mozCancelFullScreen?document.mozCancelFullScreen():document.webkitCancelFullScreen?document.webkitCancelFullScreen():c.normalScreen()});E.click(function(){l.muted(!0);
E.hide();C.show()});C.click(function(){l.muted(!1);E.show();C.hide()});x.mousedown(function(a){i=a.pageX-a.target.getBoundingClientRect().left;n=x.width();o.css("width",i);k.css("left",i-t/2);r=i/n;l.seek(r*s)});k.mousedown(function(b){this.blur();u=!0;q=b.pageX;i=o.width();n=x.width();p.bind("mousemove",j);a(document).bind("mouseup",d)});k.bind("touchstart",function(a){e=a.originalEvent;k.blur();a=e.targetTouches[0];u=!0;q=a.pageX;i=o.width();n=x.width();k.bind("touchmove",m);k.bind("touchend",g)});
this.setPlayer=function(a){l=a};this.started=function(){z.hide();v.show();D.hide()};this.paused=function(){z.show();v.hide();D.show()};this.stopped=function(){z.show();v.hide();D.show()};this.setDuration=function(a){s=a;I=SewisePlayerSkin.Utils.stringer.secondsToHMS(s)};this.timeUpdate=function(a){F=a;H=SewisePlayerSkin.Utils.stringer.secondsToHMS(F);K.text(H+"/"+I);u||(i=100*(F/s)+"%",o.css("width",i),a=o.width()-t/2,k.css("left",a))};this.loadProgress=function(a){L.css("width",100*a+"%")};this.hide2=
function(){y.hide()}}})(window.jQuery);(function(a,b){b(document).ready(function(){var a=SewisePlayer.IVodPlayer,b=new SewisePlayerSkin.ElementObject,j=new SewisePlayerSkin.ElementLayout(b),d=new SewisePlayerSkin.LogoBox(b),m=new SewisePlayerSkin.TopBar(b),g=new SewisePlayerSkin.ControlBar(b,j,m);SewisePlayerSkin.IVodSkin.player=function(b){a=b;g.setPlayer(a)};SewisePlayerSkin.IVodSkin.started=function(){g.started()};SewisePlayerSkin.IVodSkin.paused=function(){g.paused()};SewisePlayerSkin.IVodSkin.stopped=function(){g.stopped()};SewisePlayerSkin.IVodSkin.duration=
function(a){g.setDuration(a)};SewisePlayerSkin.IVodSkin.timeUpdate=function(a){g.timeUpdate(a)};SewisePlayerSkin.IVodSkin.loadedProgress=function(a){g.loadProgress(a)};SewisePlayerSkin.IVodSkin.programTitle=function(a){m.setTitle(a)};SewisePlayerSkin.IVodSkin.logo=function(a){d.setLogo(a)};SewisePlayerSkin.IVodSkin.volume=function(){};SewisePlayerSkin.IVodSkin.initialClarity=function(){};SewisePlayerSkin.IVodSkin.clarityButton=function(){};SewisePlayerSkin.IVodSkin.timeDisplay=function(){};SewisePlayerSkin.IVodSkin.controlBarDisplay=
function(a){"enable"!=a&&g.hide2()};SewisePlayerSkin.IVodSkin.topBarDisplay=function(a){"enable"!=a&&m.hide2()};SewisePlayerSkin.IVodSkin.customStrings=function(){};try{SewisePlayer.CommandDispatcher.dispatchEvent({type:SewisePlayer.Events.PLAYER_SKIN_LOADED,playerSkin:SewisePlayerSkin.IVodSkin})}catch(p){console.log("No Main Player")}})})(window,window.jQuery);
