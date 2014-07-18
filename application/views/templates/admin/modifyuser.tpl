<div class="widget-header widget-header-flat">
<h4 class="lighter">
<i class="icon-file icon-white"></i> 修改密码
</h4>
</div>
<div class="widget-body">
{{$form_target|form_open:$form_params}}
<div class="row-fluid" style="margin-top:15px;">

<div class="form-group">
<label class="control-label">登陆用户名:</label>
      <label>{{$user['name']}}</label>
      <input type="hidden" name="uid" value="{{$user['id']}}"/>
</div>

<div class="form-group">
      <input type="password"  class="form-control" name="password" placeholder="密码">
</div>

<div class="form-group">
      <input type="password" class="form-control" name="repasswd" placeholder="重复密码" >
</div>

</div>
{{if $user['privilege'] != 'all' && $user['privilege'] != 'admin'}}
      {{foreach from=$privis key=k item=p}}
      {{if ($k ne 'admin')}}
      <div class="control-group">
      <label class="control-label">{{$p}}:</label>
      <div class="controls">
      {{if ($k|strpos:$user['privilege'])}}
      <p><input type="checkbox" name="{{$k}}" checked></p>
      {{else}}
      <input type="checkbox" name="{{$k}}">
      {{/if}}
      </div>
      </div>
      {{/if}}
      {{/foreach}}
{{else}}
<input type="hidden" name="super" value="1">
{{/if }}

<div class="form-group">
<label class="control-label"></label>
<div class="controls">
<p><input type="submit" class="btn" value="提交"></p>
</div>
</div>
{{""|form_close}}
</div>

