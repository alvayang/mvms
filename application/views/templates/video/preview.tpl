<link href="{{$RES_PREFIX}}player/video-js.min.css" rel="stylesheet" type="text/css">
<script src="{{$RES_PREFIX}}player/video.js"></script>
  <script>
    videojs.options.flash.swf = "video-js.swf";
  </script>

<div class="widget-body">
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-title">预览.</h3>
</div>
<div class="panel-body">
  <video id="example_video_1" class="video-js vjs-default-skin" controls preload="none" width="640" height="264"
      poster="http://video-js.zencoder.com/oceans-clip.png"
      data-setup="{}">
    <source src="{{$videos}}" type='video/mp4' />
    <p class="vjs-no-js">得有js支持才能看本视频</p>
  </video>
<div id='my-video'></div>
</div>
</div>


<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-title">站外视频不能播放？换手机试试.</h3>
</div>
<div class="panel-body">
<img src="{{$qr}}">
</div>
</div>
</div>

<script type='text/javascript'>
var src = "{{$videos}}";
var BASEURL = "{{$RES_PREFIX}}";
</script>
</div>
