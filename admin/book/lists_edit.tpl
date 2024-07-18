<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa danh mục</title>
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
<body class="bsbg">
<div class="layui-fluid">
    <form class="layui-form" action="<?=links('book','lists_edit_save')?>">
        <div class="layui-form-item">
            <label class="layui-form-label">Danh mục cha</label>
            <div class="layui-input-block">
                <select name="fid">
                    <option value="0">Danh mục cấp 1</option>
                <?php
                foreach($class as $row){
                    $sel = $row['id'] == $cid ? ' selected' : '';
                    echo '<option value="'.$row['id'].'"'.$sel.'>'.$row['name'].'</option>';
                }
                ?>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">Tên danh mục</label>
            <div class="layui-input-block">
                <input type="text" name="name" required lay-verify="required" autocomplete="off" class="layui-input" value="<?=$name?>" placeholder="Vui lòng nhập tên danh mục">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">Tên tiếng Anh</label>
            <div class="layui-input-block">
                <input type="text" name="yname" autocomplete="off" class="layui-input" value="<?=$yname?>" placeholder="Vui lòng nhập tên danh mục bằng tiếng Anh, chỉ được sử dụng chữ cái">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">Sử dụng mẫu</label>
            <div class="layui-input-block">
                <input type="text" name="tpl" autocomplete="off" class="layui-input" value="<?=$tpl?>" placeholder="Vui lòng điền tên file mẫu">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">Thứ tự sắp xếp</label>
            <div class="layui-input-block">
                <input type="number" name="xid" required lay-verify="required" autocomplete="off" class="layui-input" value="<?=$xid?>" placeholder="Vui lòng nhập thứ tự sắp xếp, số càng nhỏ càng lên đầu">
            </div>
        </div>
        <div class="layui-form-item text-right">
            <input type="hidden" name="id" value="<?=$id?>">
            <button class="layui-btn" lay-filter="*" lay-submit>Lưu</button>
            <button type="reset" class="layui-btn layui-btn-primary">Làm mới</button>
        </div>
    </form>
</div>
</body>
</html>