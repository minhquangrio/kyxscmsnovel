<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách truyện tranh</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" href="<?=Web_Base_Path?>admin/css/style.css">
<script src="<?=Web_Base_Path?>jquery/jquery.min.js"></script>
<!-- Cho phép IE8/9 hỗ trợ truy vấn phương tiện, để tương thích với lưới -->
<!--[if lt IE 9]>

<script src="<?=Web_Base_Path?>jquery/jquery-1.9.1.min.js"></script>
<script src="<?=Web_Base_Path?>admin/js/html5.min.js"></script>
<script src="<?=Web_Base_Path?>admin/js/respond.min.js"></script>
<![endif]-->
<script src="<?=Web_Base_Path?>layui/layui.js"></script>
<script src="<?=Web_Base_Path?>admin/js/common.js"></script>
</head>
<body>
<div class="breadcrumb-nav">
    <span class="layui-breadcrumb">
        <a>Quản lý truyện tranh</a>
        <a><cite>Danh sách truyện tranh</cite></a>
    </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" onclick="Admin.get_load();" title="Làm mới"><i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-body">
            <div class="layui-tab layui-tab-brief">
                <ul class="layui-tab-title">
                    <li<?php if($yid==0) echo ' class="layui-this"';?>><a href="<?=links('comic')?>">Truyện tranh đã duyệt</a></li>
                    <li<?php if($yid==1) echo ' class="layui-this"';?>><a href="<?=links('comic','index',1)?>">Truyện tranh chờ duyệt</a></li>
                    <li<?php if($yid==2) echo ' class="layui-this"';?>><a href="<?=links('comic','index',2)?>">Truyện tranh không được duyệt</a></li>
                    <li<?php if($yid==3) echo ' class="layui-this"';?>><a href="<?=links('comic','index',3)?>">Kiểm tra truyện tranh trùng lặp</a></li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <div class="layui-form toolbar">
                            <div class="layui-form-item" style="margin-top: 10px;">
                                <div class="layui-inline">
                                    <button class="layui-btn layui-btn-sm layui-btn-danger" onclick="Admin.del('<?=links('comic','del')?>','comic')"><i class="layui-icon"></i>Xóa</button>
                                    <button class="layui-btn icon-btn layui-btn-sm layui-btn-normal" onclick="Admin.open('Thêm truyện tranh','<?=links('comic','edit')?>',0,0,1);"><i class="layui-icon"></i>Thêm mới</button>
                                </div>
                                <?php if($yid < 3){ ?>
                                <div class="layui-inline select100 mr0">
                                    <div class="layui-input-inline h30">
                                        <select name="cid">
                                        <option value="">Thể loại truyện tranh</option>
                                        <?php
                                        foreach($class as $row){
                                            echo '<option value="'.$row['id'].'">'.$row['name'].'</option>';
                                            $array = $this->mcdb->get_select('class','id,name',array('fid'=>$row['id']),'xid ASC',100);
                                            foreach($array as $row2){
                                            echo '<option value="'.$row2['id'].'">    ├─ '.$row2['name'].'</option>';
                                            }
                                        }
                                        ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="layui-inline mr0">
                                    <div class="layui-input-inline mr0">
                                        <input name="times" class="layui-input date-icon h30" type="text" placeholder="Vui lòng chọn phạm vi ngày" autocomplete="off"/>
                                    </div>
                                </div>
                                <div class="layui-inline select100 mr0">
                                    <div class="layui-input-inline h30">
                                        <select name="zd">
                                            <option value="name">Tên truyện tranh</option>
                                            <option value="author">Tác giả truyện tranh</option>
                                            <option value="id">ID truyện tranh</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="layui-inline mr0">
                                    <div class="layui-input-inline mr0 w100">
                                        <input type="text" name="key" placeholder="Vui lòng nhập từ khóa" autocomplete="off" class="layui-input h30" value="">
                                    </div>
                                </div>
                                <div class="layui-inline select70 mr0">
                                    <div class="layui-input-inline h30">
                                        <select name="serialize">
                                            <option value="">Trạng thái</option>
                                            <option value="连载">Đang cập nhật</option>
                                            <option value="完结">Hoàn thành</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="layui-inline select70 mr0">
                                    <div class="layui-input-inline h30">
                                        <select name="sid">
                                            <option value="">Khóa</option>
                                            <option value="2">Có</option>
                                            <option value="1">Không</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="layui-inline select70 mr0">
                                    <div class="layui-input-inline h30">
                                        <select name="pay">
                                            <option value="">Tính phí</option>
                                            <option value="1">Không</option>
                                            <option value="2">Có</option>
                                            <option value="3">VIP</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="layui-inline select70 mr0">
                                    <div class="layui-input-inline h30">
                                        <select name="tid">
                                            <option value="">Đề xuất</option>
                                            <option value="2">Có</option>
                                            <option value="1">Không</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="layui-inline mr0">
                                    <button class="layui-btn layui-btn-sm" data-id="comic" lay-submit lay-filter="table-sreach">
                                        <i class="layui-icon"></i>Tìm kiếm
                                    </button>
                                </div>
                                <?php } ?>
                            </div>
                        </div>
                        <table class="layui-table" lay-even lay-skin="row" lay-data="{url:'<?=links('comic','ajax',$yid)?>?name=<?=$name?>',limit:20,limits:[20,30,50,100,500],page:{layout:['count','prev','page','next','refresh','skip','limit']},id:'comic'}" lay-filter="comic">
                          <thead>
                            <tr>
                            <?php if(defined('MOBILE')){ ?>
                                <th lay-data="{field:'id',type:'checkbox',width:40,align:'center'}"></th>
                                <th lay-data="{field:'name',templet:'#nameTpl'}">Tên truyện tranh</th>
                                <th lay-data="{align:'center',width:120,templet:'#cmdTpl'}">Thao tác</th>
                            <?php }else{ ?>
                                <th lay-data="{field:'id',type:'checkbox',width:40,align:'center'}"></th>
                                <th lay-data="{field:'id',sort: true,width:70,align:'center'}">ID truyện tranh</th>
                                <th lay-data="{field:'pic',width:80,align:'center',templet:'#picTpl'}">Ảnh bìa</th>
                                <th lay-data="{field:'name',templet:'#nameTpl'}">Tên truyện tranh</th>
                                <th lay-data="{field:'tid',width:60,align:'center',templet:'#tjTpl'}">Đề xuất</th>
                                <th lay-data="{field:'pic',width:60,align:'center',templet:'#payTpl'}">Tính phí</th>
                                <th lay-data="{field:'author',width:130,align:'center'}">Tác giả truyện tranh</th>
                                <th lay-data="{field:'serialize',width:80,align:'center'}">Trạng thái cập nhật</th>
                                <th lay-data="{field:'sid',width:80,align:'center',templet:'#ztTpl'}">Trạng thái</th>
                                <th lay-data="{field:'addtime',align:'center',width:100,sort: true,templet:'#dateTpl'}">Ngày cập nhật</th>
                                <th lay-data="{align:'center',width:120,templet:'#cmdTpl'}">Thao tác</th>
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
    <a href="javascript:;" onclick="parent.Admin.add_tab('Danh sách chương','<?=links('comic','chapter')?>?id={{d.id}}')">{{d.name}}<font style="padding-left:8px;color:#f60;">{{d.nums}} chương</font></a>
</script>
<script type="text/html" id="picTpl">
    <div onclick="show_img(this)"><img src="{{d.pic}}" style="width: 100%;"></div>
</script>
<script type="text/html" id="payTpl">
    {{#  if(d.pay == 2){ }}
    <font color=#f60>VIP</font>
    {{#  } else if(d.pay == 1){ }}
    <font color=red>Tính phí</font>
    {{#  } else { }}
    Miễn phí
    {{#  } }}
</script>
<script type="text/html" id="dateTpl">
    {{#  if(util.toDateString(d.addtime*1000,'yyyy-MM-dd') == '<?=date('Y-m-d')?>'){ }}
    <font color=red>{{util.toDateString(d.addtime*1000,'yyyy-MM-dd')}}</font>
    {{#  } else { }}
    {{util.toDateString(d.addtime*1000,'yyyy-MM-dd')}}
    {{#  } }}
</script>
<script type="text/html" id="ztTpl">
    {{#  if(d.sid == 1){ }}
    <input type="checkbox" data-id="{{d.id}}" data-link="<?=links('comic','init')?>" name="switch" lay-text="Bình thường|Khóa" lay-skin="switch" lay-filter="*">
    {{#  } else { }}
    <input type="checkbox" data-id="{{d.id}}" data-link="<?=links('comic','init')?>" name="switch" lay-text="Bình thường|Khóa" lay-skin="switch" lay-filter="*" checked>
    {{#  } }}
</script>
<script type="text/html" id="tjTpl">
    {{#  if(d.tid == 1){ }}
        <div style="color:#080;cursor: pointer;" class="layui-icon reco" data-id="{{d.id}}" data-tid="0" title="Đã đề xuất, nhấp để hủy đề xuất"></div>
    {{#  } else { }}
        <div style="color:#f30;cursor: pointer;" class="layui-icon reco" data-id="{{d.id}}" data-tid="1" title="Chưa đề xuất, nhấp để đề xuất">ဆ</div>
    {{#  } }}
</script>
<script type="text/html" id="cmdTpl">
    <button style="margin-left:5px;" title="Xem chương" class="layui-btn layui-btn-normal layui-btn-xs" onclick="parent.Admin.add_tab('Danh sách chương','<?=links('comic','chapter')?>?id={{d.id}}')"><i class="layui-icon"></i></button>
    <button style="margin-left:5px;" title="Chỉnh sửa" class="layui-btn layui-btn-xs" onclick="Admin.open('Chỉnh sửa truyện tranh','<?=links('comic','edit')?>/{{d.id}}',0,0,1)"><i class="layui-icon"></i></button>
    <button style="margin-left:5px;" title="Xóa" class="layui-btn-danger layui-btn layui-btn-xs" onclick="Admin.del('<?=links('comic','del')?>','{{d.id}}',this)" href="javascript:;" ><i class="layui-icon"></i></button>
</script>
<script>
$(function(){
    $(document).on('click','.reco',function(){
        var _this = $(this);
        var tid = $(this).attr('data-tid');
        var id = $(this).attr('data-id');
        var index = layer.load();
        $.post('<?=links('ajax','reco')?>', {id:id,tid:tid}, function(res) {
            layer.close(index);
            if(res.code == 1){
                layer.msg(res.msg,{icon: 1});
                if(tid == 1){
                    _this.html('').attr('data-tid','0').css('color','#080');
                }else{
                    _this.html('ဆ').attr('data-tid','1').css('color','#f30');
                }
            }else{
                layer.msg(res.msg,{icon: 2});
            }
        },'json');
    })
});
function show_img(t) {
    var t = $(t).find("img");
    //Lớp trang
    layer.open({
        type: 1,
        skin: 'none', //Thêm viền
        area: ['45%', '65%'], //Chiều rộng và chiều cao
        shadeClose: true, //Bật đóng lớp phủ
        end: function (index, layero) {
            return false;
        },
        content: '<div style="text-align:center"><img src="' + $(t).attr('src') + '" /></div>'
    });
}
</script>
</body>
</html>