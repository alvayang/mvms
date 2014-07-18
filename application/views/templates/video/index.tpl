<div class="widget-header widget-header-flat">
<h4 class="lighter">
<i class="icon-file icon-white"></i> 视频列表
</h4>
</div>
<div class="widget-body">
<table class="table table-bordered  table-hover table-striped">
<thead class="t_thead1">
<tr>
<td colspan="12">
<div class="pull-right">
<button class="btn btn-xlarge btn-primary euser" >添加站外视频</button>
<button class="btn btn-xlarge btn-primary scvideo" >扫描视频</button>
</div>
</td>
</tr>
</thead>
<thead class="t_thead2">
<tr>
<td width="36%">视频名称</td>
<td width="16%">转码状态</td>
<td width="16%">格    式</td>
<td width="36%">管    理</td>
</tr>
</thead>
<tbody>
{{foreach from=$videos item=v}}
<tr>
<td width="36%">
{{if $v['sites'] == 0}}
{{$v["resource_src"]|basename}}
{{else}}
{{$v["name"]}}
{{/if}}

<span class="badge badge-success">{{$v['times']}}</span>

</td>
<td width="16%">
{{if $v['sites'] == 0}}
{{if $v['cs_mp4'] == 3}}
<a href="{{$BASE_URL}}admin/video/reenc/{{$v['mid']}}" class="btn btn-success">MP4</a>
{{elseif $v['cs_mp4'] == 2}}
<a href="{{$BASE_URL}}admin/video/reenc/{{$v['mid']}}" class="btn btn-warning">MP4</a>
{{elseif $v['cs_mp4'] == -1}}
<a href="" class="btn btn-danger">MP4</a>
{{else}}
<a href="{{$BASE_URL}}admin/video/reenc/{{$v['mid']}}" class="btn btn-warning">MP4</a>
{{/if}}


{{if $v['cs_m3u8'] == 3}}
<a href="" class="btn btn-success">M3U8</a>
{{elseif $v['cs_m3u8'] == 2}}
<a href="{{$BASE_URL}}admin/video/reenc/{{$v['uid']}}" class="btn btn-warning">M3U8</a>
{{elseif $v['cs_m3u8'] == -1}}
<a href="" class="btn btn-danger">M3U8</a>
{{else}}
<a href="" class="btn btn-danger">M3U8</a>
{{/if}}
{{else}}
站外视频
{{/if}}

</td>
<td width="16%">{{$v['video_format']}}</td>
<td width="36%">

{{if $v['sites'] == 0}}
<a class="btn btn-danger" href="{{$BASE_URL}}admin/video/delsrc/{{$v['id']}}">删除源文件</a>
<a class="btn btn-danger" href="{{$BASE_URL}}admin/video/del/{{$v['id']}}">删除转换文件</a>
<a target="_blank" href="{{$BASE_URL}}admin/video/preview/{{$v['id']}}"><span class="badge">P</span></a>
{{else}}
<a target="_blank" href="{{$BASE_URL}}admin/video/previewyouku/{{$v['id']}}"><span class="badge">P</span></a>
{{/if}}
</td>
</tr>
{{/foreach}}
</tbody>
</table>
</div>


<div class="modal hide fade" id="editform">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
<h3>添加优酷视频</h3>
</div>
<div class="modal-body">
<form action="{{$BASE_URL}}admin/video/addoutside" method="post">
<p>请输入优酷链接</p>
<p><input type="text" placeholder="视频名称" name="name" /></p>
<p><input type="text" placeholder="链接地址" name="conds" /></p>
<p><input type="submit" value="提交" /></p>
</form>
</div>
<div class="modal-footer">
<a href="#" class="btn">关闭</a>
</div>
</div>
<script languange="javascript">
var __BASEURL = "{{$BASE_URL}}";
$(document).ready(function(){
        $('.scvideo').each(function(idx, item){
            $(item).click(function(){
                location.href = __BASEURL + "admin/video/scanvideo";
                });
            });
        $('.euser').each(function(idx, item){
            $(item).click(function(){
                var _id = $(this).data('id');
                $('#uid').val(_id);
                $('#editform').modal();

                });
            });
});
</script>
