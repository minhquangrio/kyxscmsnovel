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
            <table class="layui-table" lay-even lay-skin="row" lay-data="{url:'<?=links('app','task_ajax')?>',limit:20,limits:[20,30,50,100,500],page:{layout:['count','prev','page','next','refresh','skip','limit']},id:'admin'}" lay-filter="admin">
              <thead>
                <tr>
                <?php if(defined('MOBILE')){ ?>
                    <th lay-data="{field:'name',align:'center'}">Tiêu đề Nhiệm vụ</th>
                    <th lay-data="{field:'daynum',align:'center'}">Số lần tối đa mỗi ngày</th>
                    <th lay-data="{align:'center',templet:'#cmdTpl'}">Hoạt động</th>
                <?php }else{ ?>
                    <th lay-data="{field:'name',align:'center'}">Tiêu đề Nhiệm vụ</th>
                    <th lay-data="{field:'text'}">Giới thiệu Nhiệm vụ</th>
                    <th lay-data="{field:'cion',align:'center'}">Số lượng thưởng <?=Pay_Cion_Name?></th>
                    <th lay-data="{field:'vip',align:'center'}">Số ngày thưởng VIP</th>
                    <th lay-data="{field:'daynum',align:'center'}">Số lần tối đa mỗi ngày</th>
                    <th lay-data="{align:'center',width:150,templet:'#cmdTpl'}">Hoạt động</th>
                <?php } ?>
                </tr>
              </thead>
            </table>
        </div>
    </div>
</div> 
<script type="text/html" id="cmdTpl">
    <button title="Chỉnh sửa" class="layui-btn layui-btn-xs layui-btn-normal" onclick="Admin.open('Chỉnh sửa Nhiệm vụ','<?=links('app','edit')?>/{{d.id}}',600,400)"><i class="layui-icon">&#xe642;</i>Chỉnh sửa</button>
</script>
</body>
</html>
