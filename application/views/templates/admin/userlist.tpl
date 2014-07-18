<a href="new_user">添加新用户</a>
<table class="table">
<tr>
	<th>账号信息</th>
	<th>权限</th>
	<th>修改</th>
	<th>删除</th>
</tr>
{{foreach $users as $u }}
	  <tr>
	  <td>{{$u['username']}}</td>
	  <td>{{$u['display_privilege']}}</td>
	  <td><a href="modify_user?i={{$u['id']}}&act=m">修改</a></td>
	  <td><a href="modify_user?i={{$u['id']}}&act=d">删除</a></td>
	  </tr>
{{/foreach}}
</table>
