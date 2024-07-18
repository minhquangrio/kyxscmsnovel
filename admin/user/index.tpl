<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách thành viên</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" href="<?=Web_Base_Path?>admin/css/style.css">
<script src="<?=Web_Base_Path?>jquery/jquery.min.js"></script>
<!-- Cho phép IE8/9 hỗ trợ truy vấn phương tiện, từ đó tương thích với lưới -->
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
        <a>Quản lý thành viên</a>
        <a><cite>Danh sách người dùng</cite></a>
    </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" onclick="Admin.get_load();" title="Làm mới"><i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-body">
            <div class="layui-tab-item layui-show">
                <div class="layui-form toolbar">
                    <div class="layui-form-item" style="margin-top: 10px;">
                        <div class="layui-inline">
                            <button class="layui-btn layui-btn-sm layui-btn-danger" onclick="Admin.del('<?=links('user','del')?>','user')"><i class="layui-icon"></i>Xóa</button>
                            <button class="layui-btn icon-btn layui-btn-sm layui-btn-normal" onclick="Admin.open('Thêm thành viên mới','<?=links('user','edit')?>',0,0,1);"><i class="layui-icon"></i>Thêm mới</button>
                        </div>
                        <div class="layui-inline mr0">
                            <div class="layui-input-inline mr0">
                                <input name="times" class="layui-input date-icon h30" type="text" placeholder="Vui lòng chọn phạm vi ngày" autocomplete="off"/>
                            </div>
                        </div>
                        <div class="layui-inline select100 mr0">
                            <div class="layui-input-inline h30">
                                <select name="zd">
                                    <option value="name">Tài khoản thành viên</option>
                                    <option value="nichen">Biệt danh thành viên</option>
                                    <option value="id">ID thành viên</option>
                                    <option value="tel">Số điện thoại liên hệ</option>
                                    <option value="qq">Liên hệ QQ</option>
                                    <option value="email">Email liên hệ</option>
                                    <option value="city">Thành phố khu vực</option>
                                    <option value="text">Giới thiệu người dùng</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline mr0">
                            <div class="layui-input-inline mr0">
                                <input type="text" name="key" placeholder="Vui lòng nhập từ khóa" autocomplete="off" class="layui-input h30" value="">
                            </div>
                        </div>
                        <div class="layui-inline select70 mr0">
                            <div class="layui-input-inline h30">
                                <select name="vip">
                                    <option value="">VIP</option>
                                    <option value="2">Có</option>
                                    <option value="1">Không</option>
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
                        <div class="layui-inline select100 mr0">
                            <div class="layui-input-inline h30">
                                <select name="cid">
                                    <option value="">Trạng thái xác minh</option>
                                    <option value="1">Chưa xác minh</option>
                                    <option value="2"<?php if($cid==2) echo ' selected';?>>Đang chờ xác minh</option>
                                    <option value="3">Xác minh thất bại</option>
                                    <option value="4">Xác minh cá nhân</option>
                                    <option value="5">Xác minh doanh nghiệp</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline mr0">
                            <button class="layui-btn layui-btn-sm" data-id="user" lay-submit lay-filter="table-sreach">
                                <i class="layui-icon"></i>Tìm kiếm
                            </button>
                        </div>
                    </div>
                </div>
                <table class="layui-table" lay-even lay-skin="row" lay-data="{url:'<?=links('user','ajax')?>?cid=<?=$cid?>',limit:20,limits:[20,30,50,100,500],page:{layout:['count','prev','page','next','refresh','skip','limit']},id:'user'}" lay-filter="user">
                  <thead>
                    <tr>
                    <?php if(defined('MOBILE')){ ?>
                        <th lay-data="{field:'id',type:'checkbox',width:40,align:'center'}"></th>
                        <th lay-data="{field:'name',templet:'#nameTpl'}">Tài khoản thành viên</th>
                        <th lay-data="{field:'sid',width:80,align:'center',templet:'#ztTpl'}">Trạng thái</th>
                        <th lay-data="{align:'center',width:120,templet:'#cmdTpl'}">Thao tác</th>
                    <?php }else{ ?>
                        <th lay-data="{field:'id',type:'checkbox',width:40,align:'center'}"></th>
                        <th lay-data="{field:'id',sort: true,width:70,align:'center'}">ID thành viên</th>
                        <th lay-data="{field:'pic',width:80,align:'center',templet:'#picTpl'}">Ảnh đại diện</th>
                        <th lay-data="{field:'name',align:'center'}">Tài khoản</th>
                        <th lay-data="{field:'nichen',align:'center'}">Bút danh/Biệt danh</th>
                        <th lay-data="{field:'vip',width:50,align:'center',templet:'#vipTpl'}">Vip</th>
                        <th lay-data="{field:'rmb',width:80,align:'center'}">Số dư</th>
                        <th lay-data="{field:'cion',width:80,align:'center'}"><?=Pay_Cion_Name?></th>
                        <th lay-data="{field:'ticket',width:80,align:'center'}">Phiếu tháng</th>
                        <th lay-data="{field:'sid',width:80,align:'center',templet:'#ztTpl'}">Trạng thái</th>
                        <th lay-data="{field:'addtime',align:'center',width:100,sort: true,templet:'#dateTpl'}">Ngày tham gia</th>
                        <th lay-data="{align:'center',width:120,templet:'#cmdTpl'}">Thao tác</th>
                    <?php } ?>
                    </tr>
                  </thead>
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/html" id="picTpl">
    <div onclick="show_img(this)" style="height:100%;width:100%;"><img src="{{d.pic}}" style="height:100%;"></div>
</script>
<script type="text/html" id="vipTpl">
    {{#  if(d.vip == 1){ }}
        <span class="layui-btn layui-btn-danger layui-btn-xs" title="Ngày hết hạn: {{util.toDateString(d.viptime)}}">Có</span>
    {{#  } else { }}
        <span class="layui-btn layui-btn-normal layui-btn-xs">Không</span>
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
    <input type="checkbox" data-id="{{d.id}}" data-link="<?=links('user','init')?>" name="switch" lay-text="Bình thường|Khóa" lay-skin="switch" lay-filter="*">
    {{#  } else { }}
    <input type="checkbox" data-id="{{d.id}}" data-link="<?=links('user','init')?>" name="switch" lay-text="Bình thường|Khóa" lay-skin="switch" lay-filter="*" checked>
    {{#  } }}
</script>
<script type="text/html" id="cmdTpl">
    <button style="margin-left:5px;" title="Xem chi tiết" class="layui-btn layui-btn-normal layui-btn-xs" onclick="Admin.open('Thông tin chi tiết người dùng','<?=links('user','show')?>?id={{d.id}}')"><i class="layui-icon"></i></button>
    <button style="margin-left:5px;" title="Chỉnh sửa" class="layui-btn layui-btn-xs" onclick="Admin.open('Chỉnh sửa thành viên','<?=links('user','edit')?>/{{d.id}}',0,0,1)"><i class="layui-icon"></i></button>
    <button style="margin-left:5px;" title="Xóa" class="layui-btn-danger layui-btn layui-btn-xs" onclick="Admin.del('<?=links('user','del')?>','{{d.id}}',this)" href="javascript:;" ><i class="layui-icon"></i></button>
</script>
<script>
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