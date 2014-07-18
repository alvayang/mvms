{{include file="header.tpl"}}
    <!-- Static navbar -->
    <div class="navbar navbar-default navbar-static-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="http://www.bjcglh.com">辰光联合</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li id="users"><a href="/admin/users/index">管理员设置</a></li>
            <li id="video"><a href="/admin/video/index">视频管理</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li id="pass"><a href="/admin/users/modify_user">修改密码</a></li>
            <li><a href="/admin/users/logout">登出</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
 <div class="container">
				{{include file="$mainpage"}}
</div>
<script language="javascript">
var _a = "{{$p}}";
$(document).ready(function(){
$('#' + _a).addClass('active');
});
</script>

{{include file="footer.tpl"}}
