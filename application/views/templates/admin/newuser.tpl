<div class="widget-header widget-header-flat">
<h4 class="lighter">
<i class="icon-file icon-white"></i> 添加新账户
</h4>
</div>
<div class="widget-body">
<table class="table table-bordered  table-hover table-striped">
<thead>
<tr>
<td colspan="5">
<div class="pull-right"><a href="javascript:none;" class="btn btn-primary" id="newuser" type="button">添加新用户</a></div>
</td>
</tr>
</thead>
<thead class="t_thead2">
<tr>
<td width="20%"><p class="text-center">用户名</p></td>
<!-- <td width="20%"><p class="text-center">昵称</p></td> -->
<td width="50%"><p class="text-center">权限</p></td>
<td width="20%"><p class="text-center">操&nbsp;&nbsp;&nbsp;&nbsp;作</p></td>
</tr>
</thead>
<tbody>
{{foreach from=$users item=u}}
<tr>
<td class="taochan">
<p class="text-center">{{$u['name']}}</p>
</td>
<td><p class="text-center">{{$u['display_privilege']}}</p></td>          
<td><a href="{{$BASE_URL}}admin/users/modify_user?act=d&i={{$u['id']}}" class="btn btn-danger" type="button">删除</a> </td>
</tr>		
{{/foreach}}
</tbody>
</table>
</div>

<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
<h3 id="myModalLabel">菜单选项</h3>
</div>
<div class="modal-body">
{{$form_target|form_open:$form_params}}
<table class="table">
<tr>
<td>登陆用户名</td>
<td><input type="text" name="email" placeholder="email"></td>
</tr>
<tr>
<td>密码</td>
<td>
<input type="password" name="password" placeholder="密码">
</td>
</tr>
<tr>
<td>重复密码</td>
<td> <input type="password" name="repasswd" placeholder="重复密码"> </td>
</tr>
<!-- 
<tr>
<td>用户昵称</td>
<td><input type="text" name="name" placeholder="用户昵称"></td>
</tr>
<tr>
<td>手机号</td>
<td><input type="text" name="mobile" placeholder="手机号"></td>
</tr>
-->
<tr>
<td>管理员级别</td>
<td>
<input type="radio" name="super" value="1">超级管理员
<input type="radio" name="super" value="0">管理员
</td>
</tr>
<tr>
<td>功能</td>
<td>
{{foreach from=$privis key=k item=p}}
{{if ($k ne 'admin')}}
<input type="checkbox" name="{{$k}}">{{$p}}
{{/if}}
{{/foreach}}
</td>
</tr>
</table>
<div class="modal-footer">
<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
<input type="submit" value="提交" />
</div>
{{""|form_close}}
</div>
</div>
<script language="javascript">
$('document').ready(function(){
$('#newuser').click(function(){
$('#myModal').modal();
});
});
</script>
