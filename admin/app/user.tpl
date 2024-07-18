<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách Nhiệm vụ</title>
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
    <a>Quản lý Ứng dụng</a>
    <a><cite>Danh sách Nhiệm vụ</cite></a>
  </span>
  <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" onclick="Admin.get_load();" title="Làm mới"><i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-body">
            <div class="layui-form toolbar">
                <div class="layui-form-item">
                    <div class="layui-inline mr0">
                        <div class="layui-input-inline">
                            <input name="times" class="layui-input date-icon h30" type="text" placeholder="Chọn khoảng ngày" autocomplete="off"/>
                        </div>
                    </div>
                    <div class="layui-inline mr0">
                        <button class="layui-btn layui-btn-sm" data-id="admin" lay-submit lay-filter="table-sreach">
                            <i class="layui-icon">&#xe615;</i>Tìm kiếm
                        </button>
                    </div>
                </div>
            </div>
            <table class="layui-table" lay-even lay-skin="row" lay-data="{url:'<?=links('app','user_ajax')?>',limit:20,limits:[20,30,50,100,500],page:{layout:['count','prev','page','next','refresh','skip','limit']},id:'admin'}" lay-filter="admin">
              <thead>
                <tr>
                <?php if(defined('MOBILE')){ ?>
                    <th lay-data="{field:'date',align:'center',templet: function(d){return d.date.substr(0,4)+'-'+d.date.substr(4,2)+'-'+d.date.substr(-2);}}">Ngày</th>
                    <th lay-data="{align:'center',templet: function(d){return parseInt(d.android_add)+parseInt(d.ios_add);}}">Tổng số mới</th>
                    <th lay-data="{align:'center',templet: function(d){return parseInt(d.android_nums)+parseInt(d.ios_nums);}}">Tổng số ngày hoạt động</th>
                <?php }else{ ?>
                    <th lay-data="{field:'date',align:'center',templet: function(d){return d.date.substr(0,4)+'-'+d.date.substr(4,2)+'-'+d.date.substr(-2);}}">Ngày</th>
                    <th lay-data="{field:'android_add',align:'center'}">Số mới Android</th>
                    <th lay-data="{field:'android_nums',align:'center'}">Ngày hoạt động Android</th>
                    <th lay-data="{field:'ios_add',align:'center'}">Số mới iOS</th>
                    <th lay-data="{field:'ios_nums',align:'center'}">Ngày hoạt động iOS</th>
                    <th lay-data="{align:'center',templet: function(d){return parseInt(d.android_add)+parseInt(d.ios_add);}}">Tổng số mới</th>
                    <th lay-data="{align:'center',templet: function(d){return parseInt(d.android_nums)+parseInt(d.ios_nums);}}">Tổng số ngày hoạt động</th>
                <?php } ?>
                </tr>
              </thead>
            </table>
        </div>
    </div>
</div> 
</body>
</html>
