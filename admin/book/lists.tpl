<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách thể loại</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" href="<?=Web_Base_Path?>admin/css/style.css">
<script src="<?=Web_Base_Path?>jquery/jquery.min.js"></script>
<!-- Cho phép IE8/9 hỗ trợ truy vấn phương tiện, do đó tương thích với lưới -->
<!--[if lt IE 9]>

<script src="<?=Web_Base_Path?>jquery/jquery-1.9.1.min.js"></script>
<script src="<?=Web_Base_Path?>admin/js/html5.min.js"></script>
<script src="<?=Web_Base_Path?>admin/js/respond.min.js"></script>
<![endif]-->
<script src="<?=Web_Base_Path?>layui/layui.js"></script>
<script src="<?=Web_Base_Path?>admin/js/common.js"></script>
<style>td input{text-align: center;}</style>
</head>
<body>
<div class="breadcrumb-nav">
    <span class="layui-breadcrumb">
        <a>Quản lý truyện</a>
        <a><cite>Danh sách thể loại</cite></a>
    </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" onclick="Admin.get_load();" title="Làm mới"><i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-body">
            <for class="layui-form toolbar">
                <div class="layui-form-item" style="margin-top: 10px;">
                    <div class="layui-inline">
                        <button lay-filter="edit" lay-submit class="layui-btn layui-btn-sm layui-cmd"><i class="layui-icon"></i>Sửa đổi mục đã chọn</button>
                        <button lay-filter="del" lay-submit class="layui-btn layui-btn-sm layui-btn-danger layui-cmd"><i class="layui-icon"></i>Xóa mục đã chọn</button>
                        <button class="layui-btn icon-btn layui-btn-sm layui-btn-normal" onclick="Admin.open('Thêm thể loại','<?=links('book','lists_edit')?>',500,390);"><i class="layui-icon"></i>Thêm thể loại</button>
                    </div>
                </div>
                <table class="layui-table" lay-skin="line">
                    <colgroup>
                        <col width="40">
                        <col class="hide" width="70">
                        <col>
                        <col class="hide" width="160">
                        <col class="hide" width="160">
                        <col class="hide" width="160">
                        <col class="hide" width="100">
                        <col width="150">
                    </colgroup>
                    <thead>
                        <tr>
                            <th style="text-align:center"><input lay-filter="qxuan" type="checkbox" name="qxuan" lay-skin="primary"></th>
                            <th class="hide" style="text-align:center">ID</th>
                            <th>Tiêu đề</th>
                            <th class="hide" style="text-align:center">Tên</th>
                            <th class="hide" style="text-align:center">Bí danh tiếng Anh</th>
                            <th class="hide" style="text-align:center">Mẫu</th>
                            <th class="hide" style="text-align:center">Sắp xếp</th>
                            <th style="text-align:center">Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                    <?php 
                    foreach($class as $row){
                        echo '<tr><td align="center"><input class="xuan" type="checkbox" name="xuan" lay-skin="primary" value="'.$row['id'].'"></td><td class="hide" align="center">'.$row['id'].'</td><td>'.$row['name'].'</td><td class="hide" align="center"><input type="text" name="name_'.$row['id'].'" class="layui-input h30" value="'.$row['name'].'" placeholder="Tên thể loại"></td><td class="hide" align="center"><input type="text" name="yname_'.$row['id'].'" class="layui-input h30" value="'.$row['yname'].'" placeholder="Bí danh tiếng Anh của thể loại"></td><td class="hide" align="center"><input type="text" name="tpl_'.$row['id'].'" class="layui-input h30" value="'.$row['tpl'].'" placeholder="Sử dụng mẫu"></td><td class="hide" align="center"><input type="text" name="xid_'.$row['id'].'" class="layui-input h30" value="'.$row['xid'].'" placeholder="Số thứ tự sắp xếp, càng nhỏ càng lên trước"></td><td align="center"><div class="layui-table-cell laytable-cell-1-0-7"><button style="margin-left:5px;" title="Chỉnh sửa" class="layui-btn layui-btn-xs" onclick="Admin.open(\'Chỉnh sửa thể loại\',\''.links('book','lists_edit').'/'.$row['id'].'\',500,390)"><i class="layui-icon"></i>Chỉnh sửa</button><button style="margin-left:5px;" title="Xóa" class="layui-btn-danger layui-btn layui-btn-xs" onclick="Admin.del(\''.links('book','lists_del').'\',\''.$row['id'].'\',this)" href="javascript:;" ><i class="layui-icon"></i>Xóa</button></div></td></tr>';
                        //Thể loại cấp 2
                        $array = $this->mcdb->get_select('book_class','*',array('fid'=>$row['id']),'xid ASC',100);
                        foreach($array as $row2){
                            echo '<tr style="background-color: #f2f2f2;"><td align="center"><input class="xuan" type="checkbox" name="xuan" lay-skin="primary" value="'.$row2['id'].'"></td><td class="hide" align="center">'.$row2['id'].'</td><td>      ├─ '.$row2['name'].'</td><td class="hide" align="center"><input type="text" name="name_'.$row2['id'].'" class="layui-input h30" value="'.$row2['name'].'" placeholder="Tên thể loại"></td><td class="hide" align="center"><input type="text" name="yname_'.$row2['id'].'" class="layui-input h30" value="'.$row2['yname'].'" placeholder="Bí danh tiếng Anh của thể loại"></td><td class="hide" align="center"><input type="text" name="tpl_'.$row2['id'].'" class="layui-input h30" value="'.$row2['tpl'].'" placeholder="Sử dụng mẫu"></td><td class="hide" align="center"><input type="text" name="xid_'.$row2['id'].'" class="layui-input h30" value="'.$row2['xid'].'" placeholder="Số thứ tự sắp xếp, càng nhỏ càng lên trước"></td><td align="center"><div class="layui-table-cell laytable-cell-1-0-7"><button style="margin-left:5px;" title="Chỉnh sửa" class="layui-btn layui-btn-xs" onclick="Admin.open(\'Chỉnh sửa thể loại\',\''.links('book','lists_edit').'/'.$row2['id'].'\',500,390)"><i class="layui-icon"></i>Chỉnh sửa</button><button style="margin-left:5px;" title="Xóa" class="layui-btn-danger layui-btn layui-btn-xs" onclick="Admin.del(\''.links('book','lists_del').'\',\''.$row2['id'].'\',this)" href="javascript:;" ><i class="layui-icon"></i>Xóa</button></div></td></tr>';
                        }
                    } 
                    ?>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</div>
<script>
layui.use(['form','layer'],function() {
    var layer = layui.layer,
        form = layui.form;
    //Lắng nghe chuyển đổi toàn bộ chọn/bỏ chọn
    form.on('checkbox(qxuan)', function(data){
        var val = data.value;
        var obj = $('.xuan');
        for (var i = 0; i < obj.length; i++) {
            obj[i].checked = (obj[i].checked) ? false : true;
        }
        form.render('checkbox');
    });
    //Sửa đổi hàng loạt
    form.on('submit(edit)', function(data){
        var obj = $('.xuan');
        var ids = [];
        for (var i = 0; i < obj.length; i++) {
            if(obj[i].checked) ids.push(obj[i].value);
        }
        if(ids.length == 0){
            layer.msg('Vui lòng chọn dữ liệu cần thao tác',{icon: 2});
            return false;
        }
        data.field.ids = ids;
        $.post('<?=links('book','lists_save')?>', data.field, function(res) {
            if(res.code == 1){
                layer.msg(res.msg,{icon: 1});
                setTimeout(function() {
                    window.location.reload();
                }, 1000);
            }else{
                layer.msg(res.msg,{icon: 2});
            }
        },'json');
    });
    //Xóa hàng loạt
    form.on('submit(del)', function(data){
        var obj = $('.xuan');
        var ids = [];
        for (var i = 0; i < obj.length; i++) {
            if(obj[i].checked) ids.push(obj[i].value);
        }
        if(ids.length == 0){
            layer.msg('Vui lòng chọn dữ liệu cần thao tác',{icon: 2});
            return false;
        }
        layer.confirm('Bạn có chắc chắn muốn xóa?', {
            title:'Xóa nhắc nhở',
            btn: ['Xác nhận', 'Hủy bỏ'], //Nút
            shade:0.001
        }, function(index) {
            $.post('<?=links('book','lists_del')?>', {id:ids}, function(res) {
                if(res.code == 1){
                    layer.msg(res.msg,{icon: 1});
                    setTimeout(function() {
                        window.location.reload();
                    }, 1000);
                }else{
                    layer.msg(res.msg,{icon: 2});
                }
            },'json');
        }, function(index) {
            layer.close(index);
        });
    });
})
</script>
</body>
</html>