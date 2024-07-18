<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách quản trị viên</title>
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
    <a>Quản trị viên</a>
    <a><cite>Danh sách</cite></a>
  </span>
  <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" onclick="Admin.get_load();" title="Làm mới"><i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-body">
            <div class="layui-form toolbar">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <button class="layui-btn layui-btn-sm layui-btn-danger" onclick="Admin.del('<?=links('sys','del')?>','admin')"><i class="layui-icon"></i>Xóa nhiều</button>
                        <button class="layui-btn layui-btn-sm" onclick="Admin.open('Thêm người dùng','<?=links('sys','edit')?>',500,300)"><i class="layui-icon"></i>Thêm</button>
                    </div>
                    <div class="layui-inline">
                        <div class="layui-input-inline">
                            <input type="text" name="name" placeholder="Vui lòng nhập tên người dùng" required="" lay-verify="required" autocomplete="off" class="layui-input h30">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <button class="layui-btn layui-btn-sm" data-id="admin" lay-submit lay-filter="table-sreach">
                            <i class="layui-icon"></i>Tìm kiếm
                        </button>
                    </div>
                </div>
            </div>
            <table class="layui-table" lay-even lay-skin="row" lay-data="{url:'<?=links('sys','ajax')?>',limit:20,limits:[20,30,50,100,500],page:{layout:['count','prev','page','next','refresh','skip','limit']},id:'admin'}" lay-filter="admin">
              <thead>
                <tr>
                <?php if(defined('MOBILE')){ ?>
                    <th lay-data="{field:'id',type:'checkbox',align:'center'}"></th>
                    <th lay-data="{field:'name',align:'center'}">Tài khoản</th>
                    <th lay-data="{align:'center',templet:'#cmdTpl'}">Thao tác</th>
                <?php }else{ ?>
                    <th lay-data="{field:'id',type:'checkbox',width:60,align:'center'}"></th>
                    <th lay-data="{field:'name',width:120,align:'center'}">Tài khoản</th>
                    <th lay-data="{field:'nichen',align:'center'}">Biệt danh</th>
                    <th lay-data="{field:'lognum',width:100,sort: true,align:'center'}">Số lần đăng nhập</th>
                    <th lay-data="{field:'logip',width:100,align:'center'}">IP đăng nhập lần cuối</th>
                    <th lay-data="{field:'logtime',sort: true,align:'center',templet:function(d){if(d.logtime == 0){return 'Chưa đăng nhập';}else{return util.toDateString(d.logtime*1000);}}}">Thời gian đăng nhập lần cuối</th>
                    <th lay-data="{field:'sid',width:100,align:'center',templet:'#switchTpl'}">Trạng thái</th>
                    <th lay-data="{align:'center',width:150,templet:'#cmdTpl'}">Thao tác</th>
                <?php } ?>
                </tr>
              </thead>
            </table>
        </div>
    </div>
</div> 
<script type="text/html" id="switchTpl">
    {{#  if(d.sid == 1){ }}
    <input type="checkbox" data-id="{{d.id}}" data-link="<?=links('sys','init')?>" name="switch" lay-text="Bình thường|Vô hiệu hóa" lay-skin="switch" lay-filter="*">
    {{#  } else { }}
    <input type="checkbox" data-id="{{d.id}}" data-link="<?=links('sys','init')?>" name="switch" lay-text="Bình thường|Vô hiệu hóa" lay-skin="switch" lay-filter="*" checked>
    {{#  } }}
</script>
<script type="text/html" id="cmdTpl">
    <button title="Nhật ký đăng nhập" class="layui-btn layui-btn-normal layui-btn-xs" onclick="parent.Admin.add_tab('Nhật ký đăng nhập','<?=links('sys','log')?>?id={{d.id}}')"><i class="layui-icon"></i></button>
    <button title="Chỉnh sửa" class="layui-btn layui-btn-xs" onclick="Admin.open('Chỉnh sửa quản trị viên','<?=links('sys','edit')?>/{{d.id}}',500,300)"><i class="layui-icon"></i></button>
    <button title="Xóa" class="layui-btn-danger layui-btn layui-btn-xs" onclick="Admin.del('<?=links('sys','del')?>','{{d.id}}',this)" href="javascript:;" ><i class="layui-icon"></i></button>
</script>
</body>
</html>