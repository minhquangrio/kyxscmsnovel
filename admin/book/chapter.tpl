<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách chương</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" href="<?=Web_Base_Path?>admin/css/style.css">
<script src="<?=Web_Base_Path?>jquery/jquery.min.js"></script>
<!-- Cho phép IE8/9 hỗ trợ media query, từ đó tương thích với grid -->
<!--[if lt IE 9]>

<script src="<?=Web_Base_Path?>jquery/jquery-1.9.1.min.js"></script>
<script src="<?=Web_Base_Path?>admin/js/html5.min.js"></script>
<script src="<?=Web_Base_Path?>admin/js/respond.min.js"></script>
<![endif]-->
<script src="<?=Web_Base_Path?>layui/layui.js"></script>
<script src="<?=Web_Base_Path?>admin/js/common.js"></script>
<style>
@media screen and (max-width: 990px){
    .layui-btn-sm{
        margin-bottom: 10px; 
    }
}
</style>
</head>
<body>
<div class="breadcrumb-nav">
    <span class="layui-breadcrumb">
        <a>Quản lý tiểu thuyết</a>
        <a><cite>Danh sách chương</cite></a>
    </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" onclick="Admin.get_load();" title="Tải lại"><i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-body">
            <div class="layui-tab layui-tab-brief">
                <ul class="layui-tab-title">
                    <li<?php if($yid==0) echo ' class="layui-this"';?>><a href="<?=links('book','chapter')?>?id=<?=$bid?>">Chương đã duyệt</a></li>
                    <li<?php if($yid==1) echo ' class="layui-this"';?>><a href="<?=links('book','chapter',1)?>?id=<?=$bid?>">Chương chờ duyệt</a></li>
                    <li<?php if($yid==2) echo ' class="layui-this"';?>><a href="<?=links('book','chapter',2)?>?id=<?=$bid?>">Chương không được duyệt</a></li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <div class="layui-form toolbar">
                            <div class="layui-form-item" style="margin-top: 10px;">
                                <div class="layui-inline">
                                    <button class="layui-btn layui-btn-sm layui-btn-danger" onclick="Admin.del('<?=links('book','chapter_del',$bid)?>','book')"><i class="layui-icon"></i>Xóa</button>
                                    <button class="layui-btn layui-btn-sm layui-btn-normal" onclick="get_px('book')">Sắp xếp</button>
                                    <button class="layui-btn layui-btn-sm" onclick="get_vip('book',1)">Đặt VIP</button>
                                    <button class="layui-btn layui-btn-sm layui-btn-danger" onclick="get_vip('book',2)">Hủy VIP</button>
                                    <button class="layui-btn layui-btn-sm" onclick="get_cion('book')">Đặt tính phí</button>
                                    <button class="layui-btn icon-btn layui-btn-sm layui-btn-normal" onclick="Admin.open('Thêm chương','<?=links('book','chapter_edit',$bid)?>',0,0,1);"><i class="layui-icon"></i>Thêm chương</button>
                                    <button class="layui-btn layui-btn-sm layui-btn-danger" onclick="get_txt()">Đồng bộ tất cả chương sang TXT</button>
                                </div>
                                <div class="layui-inline mr0">
                                    <div class="layui-input-inline mr0">
                                        <input name="times" class="layui-input date-icon h30" type="text" placeholder="Vui lòng chọn phạm vi ngày" autocomplete="off"/>
                                    </div>
                                </div>
                                <div class="layui-inline select100 mr0">
                                    <div class="layui-input-inline h30">
                                        <select name="zd">
                                            <option value="name">Tên chương</option>
                                            <option value="id">ID chương</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="layui-inline mr0">
                                    <div class="layui-input-inline mr0">
                                        <input type="text" name="key" placeholder="Vui lòng nhập từ khóa" autocomplete="off" class="layui-input h30" value="">
                                    </div>
                                </div>
                                <div class="layui-inline select100 mr0">
                                    <div class="layui-input-inline h30">
                                        <select name="pay">
                                            <option value="">Cách đọc</option>
                                            <option value="1">Đọc miễn phí</option>
                                            <option value="2">Đọc VIP</option>
                                            <option value="3"><?=Pay_Cion_Name?>Đọc</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="layui-inline mr0">
                                    <button class="layui-btn layui-btn-sm" data-id="book" lay-submit lay-filter="table-sreach">
                                        <i class="layui-icon"></i>Tìm kiếm
                                    </button>
                                </div>
                            </div>
                        </div>
                        <table class="layui-table" lay-even lay-skin="row" lay-data="{url:'<?=links('book','chapter_ajax')?>/<?=$bid?>/<?=$yid?>',limit:20,limits:[20,30,50,100,500],page:{layout:['count','prev','page','next','refresh','skip','limit']},id:'book'}" lay-filter="book">
                          <thead>
                            <tr>
                            <?php if(defined('MOBILE')){ ?>
                                <th lay-data="{field:'id',type:'checkbox',width:40,align:'center'}"></th>
                                <th lay-data="{field:'name',templet:'#nameTpl'}">Tên chương</th>
                                <th lay-data="{align:'center',width:130,templet:'#cmdTpl'}">Thao tác</th>
                            <?php }else{ ?>
                                <th lay-data="{field:'id',type:'checkbox',width:40,align:'center'}"></th>
                                <th lay-data="{field:'id',sort: true,width:90,align:'center'}">ID chương</th>
                                <th lay-data="{field:'xid',templet:'#xidTpl',sort: true,width:90,align:'center'}">ID sắp xếp</th>
                                <th lay-data="{field:'name',templet:'#nameTpl'}">Tên chương</th>
                                <th lay-data="{field:'text_num',sort: true,width:100,align:'center'}">Số từ chương</th>
                                <th lay-data="{field:'book_name'}">Tiểu thuyết</th>
                                <th lay-data="{field:'sid',width:90,align:'center',templet:'#ztTpl'}">Tính phí</th>
                                <th lay-data="{field:'addtime',align:'center',width:100,sort: true,templet:'#dateTpl'}">Ngày cập nhật</th>
                                <th lay-data="{align:'center',width:130,templet:'#cmdTpl'}">Thao tác</th>
                            <?php } ?>
                            </tr>
                          </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/html" id="nameTpl">
    <a href="javascript:;" onclick="Admin.open('Chỉnh sửa chương','<?=links('book','chapter_edit')?>/{{d.bid}}?id={{d.id}}',0,0,1)">{{d.name}}</a>
</script>
<script type="text/html" id="picTpl">
    <img src="{{d.pic}}" style="width: 100%;">
</script>
<script type="text/html" id="xidTpl">
    <input type="text" id="xid_{{d.id}}" class="layui-input" style="height: 28px;text-align: center;padding-left:0px;" value="{{d.xid}}" placeholder="Số thứ tự sắp xếp, càng nhỏ càng lên trước" title="Số thứ tự sắp xếp, càng nhỏ càng lên trước">
</script>
<script type="text/html" id="dateTpl">
    {{#  if(util.toDateString(d.addtime*1000,'yyyy-MM-dd') == '<?=date('Y-m-d')?>'){ }}
    <font color=red>{{util.toDateString(d.addtime*1000,'yyyy-MM-dd')}}</font>
    {{#  } else { }}
    {{util.toDateString(d.addtime*1000,'yyyy-MM-dd')}}
    {{#  } }}
</script>
<script type="text/html" id="ztTpl">
    {{#  if(d.vip > 0){ }}
        <span class="layui-btn layui-btn-xs layui-btn-danger">Đọc VIP</span>
    {{#  } else if(d.cion > 0){ }}
        <span class="layui-btn layui-btn-xs layui-btn-normal"><?=Pay_Cion_Name?>Đọc</span>
    {{#  } else { }}
        <span class="layui-btn layui-btn-xs">Đọc miễn phí</span>
    {{#  } }}
</script>
<script type="text/html" id="cmdTpl">
    <button style="margin-left:5px;" title="Chỉnh sửa" class="layui-btn layui-btn-xs" onclick="Admin.open('Chỉnh sửa chương','<?=links('book','chapter_edit')?>/{{d.bid}}?id={{d.id}}',0,0,1)"><i class="layui-icon"></i>Chỉnh sửa</button>
    <button style="margin-left:5px;" title="Xóa" class="layui-btn-danger layui-btn layui-btn-xs" onclick="Admin.del('<?=links('book','chapter_del/'.$bid)?>','{{d.id}}',this)" href="javascript:;" ><i class="layui-icon"></i>Xóa</button>
</script>
<script>
function get_vip(_id,_vip){
    var ids = [];
    var checkStatus = table.checkStatus(_id);
    checkStatus.data.forEach(function(n,i){
        ids.push(n.id);
    });
    if(ids.length ==0){
        layer.msg('Vui lòng chọn dữ liệu cần thao tác',{icon: 2});
    }else{
        layer.confirm('Xác nhận thao tác?', {
            title:'Thông báo thao tác',
            btn: ['Xác nhận', 'Hủy'], //Nút
            shade:0.001
        }, function(index) {
            $.post('<?=links('book','chapter_init/vip')?>', {'id':ids,vip:_vip,bid:<?=$bid?>}, function(res) {
                if(res.code == 1){
                    layer.msg('Thiết lập thành công...',{icon: 1});
                    setTimeout(function() {
                        location.reload();
                    }, 1000);
                }else{
                    layer.msg(res.msg,{icon: 2});
                }
            },'json');
        }, function(index) {
            layer.close(index);
        });
    }
}
function get_cion(_id){
    var ids = [];
    var checkStatus = table.checkStatus(_id);
    checkStatus.data.forEach(function(n,i){
        ids.push(n.id);
    });
    if(ids.length ==0){
        layer.msg('Vui lòng chọn dữ liệu cần thao tác',{icon: 2});
    }else{
    	layer.prompt({title: 'Vui lòng nhập số lượng <?=Pay_Cion_Name?>',area: ['200px', '150px']},function(value, index, elem){
    		if(isNaN(value)){
    			layer.msg('Vui lòng nhập số lượng chính xác',{icon: 2});
    		}else{
	    		$.post('<?=links('book','chapter_init/cion')?>', {'id':ids,cion:value,bid:<?=$bid?>}, function(res) {
	                if(res.code == 1){
	                    layer.msg('Thiết lập thành công...',{icon: 1});
	                    setTimeout(function() {
	                        location.reload();
	                    }, 1000);
	                }else{
	                    layer.msg(res.msg,{icon: 2});
	                    layer.close(index);
	                }
	            },'json');
    		}
		});
    }
}
function get_px(_id){
    var ids = [],xids = [];
    var checkStatus = table.checkStatus(_id);
    checkStatus.data.forEach(function(n,i){
        var id = n.id;
        var val = $('#xid_'+id).val();
        xids.push(val);
        ids.push(n.id);
    });
    if(ids.length ==0){
        layer.msg('Vui lòng chọn dữ liệu cần thao tác',{icon: 2});
    }else{
        $.post('<?=links('book','chapter_init/px')?>', {'id':ids,xid:xids,bid:<?=$bid?>}, function(res) {
            if(res.code == 1){
                layer.msg('Thiết lập thành công...',{icon: 1});
                setTimeout(function() {
                    location.reload();
                }, 1000);
            }else{
                layer.msg(res.msg,{icon: 2});
                layer.close(index);
            }
        },'json');
    }
}
function get_txt(){
    layer.confirm('Khi có quá nhiều chương, có thể mất nhiều thời gian để đồng bộ, bạn có chắc chắn không?', {
        title:'Thông báo thao tác',
        btn: ['Xác nhận', 'Hủy'], //Nút
        shade:0.001
    }, function(index) {
        layer.close(index);
        var index = layer.load();
        $.post('<?=links('book','chapter_txt')?>', {bid:<?=$bid?>}, function(res) {
            layer.close(index);
            if(res.code == 1){
                layer.msg('Đồng bộ hoàn tất...',{icon: 1});
                setTimeout(function() {
                    location.reload();
                }, 1000);
            }else{
                layer.msg(res.msg,{icon: 2});
            }
        },'json');
    }, function(index) {
        layer.close(index);
    });
}
</script>
</body>
</html>