<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách thẻ cào</title>
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
        <a>Quản lý tài chính</a>
        <a><cite>Danh sách thẻ cào</cite></a>
    </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" onclick="Admin.get_load();" title="Làm mới"><i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-body">
            <div class="layui-form toolbar">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <button class="layui-btn layui-btn-sm layui-btn-danger" onclick="Admin.del('<?=links('card','del')?>','pay')"><i class="layui-icon"></i>Xóa hàng loạt</button>
                        <button class="layui-btn icon-btn layui-btn-sm layui-btn-normal" onclick="get_dc('card');"><i class="layui-icon"></i>Xuất ra txt</button>
                        <button class="layui-btn layui-btn-sm" onclick="Admin.open('Thêm thẻ cào','<?=links('card','add')?>',500,280)"><i class="layui-icon"></i>Thêm thẻ cào</button>
                    </div>
                    <div class="layui-inline select100 mr0">
                        <div class="layui-input-inline h30">
                            <select name="zt">
                                <option value="">Trạng thái thẻ cào</option>
                                <option value="1">Chưa sử dụng</option>
                                <option value="2">Đã sử dụng</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline mr0">
                        <div class="layui-input-inline">
                            <input name="times" class="layui-input date-icon h30" type="text" placeholder="Vui lòng chọn phạm vi ngày sử dụng" autocomplete="off"/>
                        </div>
                    </div>
                    <div class="layui-inline select100 mr0">
                        <div class="layui-input-inline h30">
                            <select name="zd">
                                <option value="pass">Mã thẻ cào</option>
                                <option value="uid">ID thành viên</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline mr0">
                        <div class="layui-input-inline">
                            <input type="text" name="key" placeholder="Vui lòng nhập từ khóa" autocomplete="off" class="layui-input h30" value="">
                        </div>
                    </div>
                    <div class="layui-inline mr0">
                        <button class="layui-btn layui-btn-sm" data-id="pay" lay-submit lay-filter="table-sreach">
                            <i class="layui-icon"></i>Tìm kiếm
                        </button>
                    </div>
                </div>
            </div>
            <table class="layui-table" lay-even lay-skin="row" lay-data="{url:'<?=links('card','ajax')?>',limit:20,limits:[20,30,50,100,500],page:{layout:['count','prev','page','next','refresh','skip','limit']},id:'pay'}" lay-filter="pay">
              <thead>
                <tr>
                <?php if(defined('MOBILE')){ ?>
                    <th lay-data="{field:'id',type:'checkbox',width:60,align:'center'}"></th>
                    <th lay-data="{field:'pass',align:'center'}">Mã thẻ cào</th>
                    <th lay-data="{field:'sid',width:70,align:'center',templet:'#ztTpl'}">Trạng thái</th>
                    <th lay-data="{align:'center',templet:'#cmd2Tpl'}">Thao tác</th>
                <?php }else{ ?>
                    <th lay-data="{field:'id',type:'checkbox',width:60,align:'center'}"></th>
                    <th lay-data="{field:'id',sort: true,width:80,align:'center'}">ID</th>
                    <th lay-data="{field:'pass',align:'center'}">Mã thẻ cào</th>
                    <th lay-data="{field:'rmb',width:100,align:'center',templet:'#rmbTpl'}">Mệnh giá</th>
                    <th lay-data="{field:'uid',width:100,align:'center',templet:'#uidTpl'}">ID thành viên</th>
                    <th lay-data="{field:'sid',width:70,align:'center',templet:'#ztTpl'}">Trạng thái</th>
                    <th lay-data="{field:'usetime',align:'center',width:160,sort: true,templet:'#dateTpl'}">Thời gian sử dụng</th>
                    <th lay-data="{align:'center',width:120,templet:'#cmdTpl'}">Thao tác</th>
                <?php } ?>
                </tr>
              </thead>
            </table>
        </div>
    </div>
</div>
<script type="text/html" id="uidTpl">
    {{#  if(d.uid == 0){ }}
        ---------
    {{#  } else { }}
    {{d.uid}}
    {{#  } }}
</script>
<script type="text/html" id="dateTpl">
    {{#  if(d.usetime == 0){ }}
        ---------
    {{#  } else if(util.toDateString(d.usetime*1000,'yyyy-MM-dd') == '<?=date('Y-m-d')?>'){ }}
    <font color=red>{{util.toDateString(d.usetime*1000)}}</font>
    {{#  } else { }}
    {{util.toDateString(d.usetime*1000)}}
    {{#  } }}
</script>
<script type="text/html" id="ztTpl">
    {{#  if(d.uid == 0){ }}
    <span class="layui-btn layui-btn-xs layui-btn-normal">Chưa sử dụng</span>
    {{#  } else { }}
    <span class="layui-btn layui-btn-xs layui-btn-danger">Đã sử dụng</span>
    {{#  } }}
</script>
<script type="text/html" id="rmbTpl">
    {{#  if(d.sid == 0){ }}
    <font color=#1E9FFF>{{d.cion}}<?=Pay_Cion_Name?></font>
    {{#  } else { }}
    <font color=red>{{d.day}} ngày Vip</font>
    {{#  } }}
</script>
<script type="text/html" id="cmdTpl">
    <button title="Chỉnh sửa" class="layui-btn layui-btn-xs" onclick="Admin.open('Chỉnh sửa thẻ cào','<?=links('card','edit')?>/{{d.id}}',500,390)"><i class="layui-icon"></i>Chỉnh sửa</button>
    <button style="margin-left:5px;" title="Xóa" class="layui-btn-danger layui-btn layui-btn-xs" onclick="Admin.del('<?=links('card','del')?>','{{d.id}}',this)" href="javascript:;" ><i class="layui-icon"></i>Xóa</button>
</script>
<script type="text/html" id="cmd2Tpl">
    <button title="Chỉnh sửa" class="layui-btn layui-btn-xs" onclick="Admin.open('Chỉnh sửa thẻ cào','<?=links('card','edit')?>/{{d.id}}',500,390)"><i class="layui-icon"></i></button>
    <button style="margin-left:5px;" title="Xóa" class="layui-btn-danger layui-btn layui-btn-xs" onclick="Admin.del('<?=links('card','del')?>','{{d.id}}',this)" href="javascript:;" ><i class="layui-icon"></i></button>
</script>
<script>
    function get_dc(){
        var ids = [];
        var checkStatus = table.checkStatus('pay');
        checkStatus.data.forEach(function(n,i){
            ids.push(n.id);
        });
        if(ids.length == 0){
            layer.msg('Vui lòng chọn thẻ cào cần xuất',{icon: 2});
        }else{
            window.location.href = '<?=links('card','daochu')?>?id='+ids.join(',');
        }
    }
</script>
</body>
</html>