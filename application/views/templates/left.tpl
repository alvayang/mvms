	{{foreach from=$left item=l}}
	<div class="accordion-group">
		<div class="accordion-heading">
			<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordionSB" href="#dashboard{{$l['id']}}">
				<i class="{{$l['icon']}}"></i> {{$l['name']}}
			</a>
		</div>
			{{if $l['c'] > 0}}
			<script language="javascript">
				var _cid = "{{$l['id']}}";
			</script>
		<div id="dashboard{{$l['id']}}" class="accordion-body collapse in">
				{{else}}
		<div id="dashboard{{$l['id']}}" class="accordion-body collapse">
				{{/if}}
			<div class="accordion-inner">
				<ul class="nav nav-list">
					{{foreach from=$l['menus'] item=z}}
					{{if $cs == $z['url']}}
					<li class="active">
					{{else}}
					<li>
					{{/if}}
					<a href="{{$BASE_URL}}{{$z["url"]}}"><i class="icon-large icon-th"></i>{{$z["name"]}}</a></li>
					{{/foreach}}
				</ul>
			</div>
		</div>
	</div>
	{{/foreach}}
	<script language="javascript">
		$('document').ready(function(){
			//$("#dashboard" + _cid).collapse()
		});
	</script>
