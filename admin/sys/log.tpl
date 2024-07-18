<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nhật ký đăng nhập quản trị viên</title>
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
</head>
<body>
<div class="breadcrumb-nav">
    <span class="layui-breadcrumb">
        <a>Quản trị viên</a>
        <a><cite>Nhật ký đăng nhập</cite></a>
    </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" onclick="Admin.get_load();" title="Làm mới"><i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-body">
            <div class="layui-form toolbar">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <button class="layui-btn layui-btn-sm layui-btn-danger" onclick="Admin.del('<?=links('sys','log_del')?>','adminlog')"><i class="layui-icon"></i>Xóa hàng loạt</button>
                        <button class="layui-btn icon-btn layui-btn-sm layui-btn-normal" onclick="Admin.get_excel('adminlog');"><i class="layui-icon"></i>Xuất xls</button>
                    </div>
                    <div class="layui-inline select70 mr0">
                        <div class="layui-input-inline h30">
                            <select name="zd">
                                <option value="name">Tài khoản</option>
                                <option value="nichen"<?php if($zd=='nichen') echo ' selected';?>>Biệt danh</option>
                                <option value="uid"<?php if($zd=='uid') echo ' selected';?>>ID</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline mr0">
                        <div class="layui-input-inline">
                            <input name="times" class="layui-input date-icon h30" type="text" placeholder="Vui lòng chọn khoảng thời gian" autocomplete="off"/>
                        </div>
                    </div>
                    <div class="layui-inline mr0">
                        <div class="layui-input-inline">
                            <input type="text" name="key" placeholder="Vui lòng nhập từ khóa" autocomplete="off" class="layui-input h30" value="<?=$key?>">
                        </div>
                    </div>
                    <div class="layui-inline mr0">
                        <button class="layui-btn layui-btn-sm" data-id="adminlog" lay-submit lay-filter="table-sreach">
                            <i class="layui-icon"></i>Tìm kiếm
                        </button>
                    </div>
                </div>
            </div>
            <table class="layui-table" lay-even lay-skin="row" lay-data="{url:'<?=$ajaxurl?>',limit:20,limits:[20,30,50,100,500],page:{layout:['count','prev','page','next','refresh','skip','limit']},id:'adminlog'}" lay-filter="adminlog">
              <thead>
                <tr>
                <?php if(defined('MOBILE')){ ?>
                    <th lay-data="{field:'id',type:'checkbox',width:60,align:'center'}"></th>
                    <th lay-data="{field:'nichen',align:'center'}">Biệt danh đăng nhập</th>
                    <th lay-data="{field:'machine',width:100,align:'center'}">Thiết bị đăng nhập</th>
                    <th lay-data="{field:'logtime',align:'center', sort: true,templet:function(d){return util.toDateString(d.logtime*1000);}}">Thời gian đăng nhập</th>
                <?php }else{ ?>
                    <th lay-data="{field:'id',type:'checkbox',width:60,align:'center'}"></th>
                    <th lay-data="{field:'uid',sort: true,width:100,align:'center'}">ID đăng nhập</th>
                    <th lay-data="{field:'nichen',align:'center'}">Biệt danh đăng nhập</th>
                    <th lay-data="{field:'logip',width:120,align:'center'}">IP đăng nhập</th>
                    <th lay-data="{field:'machine',width:100,align:'center'}">Thiết bị đăng nhập</th>
                    <th lay-data="{field:'browser',align:'center'}">Trình duyệt</th>
                    <th lay-data="{field:'logtime',align:'center', sort: true,templet:function(d){return util.toDateString(d.logtime*1000);}}">Thời gian đăng nhập</th>
                <?php } ?>
                </tr>
              </thead>
            </table>
        </div>
    </div>
</div>
</body>
</html>