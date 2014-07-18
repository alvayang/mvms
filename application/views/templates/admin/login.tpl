<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>视频宝</title>
<script type="text/javascript" src="{{$RES_PREFIX}}core/js/jquery.js"></script>
<script type="text/javascript" src="{{$RES_PREFIX}}core/js/bootstrap.min.js"></script>
<script type="text/javascript" src="{{$RES_PREFIX}}core/js/alert.js"></script>
<script type="text/javascript" src="{{$RES_PREFIX}}core/js/jquery.form.js"></script>
<link href="{{$RES_PREFIX}}core/css/bootstrap.min.css" rel="stylesheet">
<link href="{{$RES_PREFIX}}core/css/bootstrap-responsive.min.css" rel="stylesheet">
<style>

body {
    padding-top: 40px;
    padding-bottom: 40px;
    background-color: #f5f5f5;
}

.form-signin {
    max-width: 300px;
padding: 19px 29px 29px;
margin: 0 auto 20px;
        background-color: #fff;
border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
        -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
        box-shadow: 0 1px 2px rgba(0,0,0,.05);
}
.container_sub {
margin : 0 auto;
         margin-top: 60px;
         text-align:center;
}

.form-signin .form-signin-heading,
    .form-signin .checkbox {
        margin-bottom: 10px;
    }
.form-signin input[type="text"],
    .form-signin input[type="password"] {
        font-size: 16px;
height: auto;
        margin-bottom: 15px;
padding: 7px 9px;
    }
.alert {
    max-width: 300px;

}

</style>
</head>

<body>
<div class="container_sub">
{{$form_target|form_open:$style}}
<input type="hidden" name="callback" value="">

<h2 class="line form-signin-heading">
<span>  登录 </span>
</h2>
<div>
<input type="text" class="input-block-level" name="username" placeholder="用户名">
<input type="password" class="input-block-level" name="password" placeholder="密码">
<button class="btn btn-large btn-primary" type="submit">登录</button>
</div>
<div class="pull-right">
<!--<a href="http://s.1in1.cn/web/forgot">重置密码</a>-->
</div>
{{""|form_close}}
</div>
<script>
function show_index(){
    parent.windows.location.href="{{$BASE_URL}}admin/admin/index";
}
$(function(){
        });
</script>
</body>
</html>
