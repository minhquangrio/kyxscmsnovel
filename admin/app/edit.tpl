<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sửa đổi Nhiệm vụ</title>
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
<body class="bsbg">
<div class="layui-fluid">
    <form class="layui-form" action="<?=links('app','save')?>">
        <div class="layui-form-item">
            <label class="layui-form-label layui-form-required">Tiêu đề Nhiệm vụ</label>
            <div class="layui-input-block">
                <input type="text" name="name" required lay-verify="required" autocomplete="off" class="layui-input" value="<?=$name?>" placeholder="Nhập tiêu đề nhiệm vụ">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label layui-form-required">Giới thiệu Nhiệm vụ</label>
            <div class="layui-input-block">
                <input type="text" name="text" required lay-verify="required" autocomplete="off" class="layui-input" value="<?=$text?>" placeholder="Nhập giới thiệu nhiệm vụ">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label layui-form-required"><?=Pay_Cion_Name?> Thưởng</label>
            <div class="layui-input-block">
                <input type="number" name="cion" required lay-verify="required" autocomplete="off" class="layui-input" value="<?=$cion?>" placeholder="Nhập số lượng thưởng <?=Pay_Cion_Name?> mỗi lần">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label layui-form-required">Thưởng VIP</label>
            <div class="layui-input-block">
                <input type="number" name="vip" required lay-verify="required" autocomplete="off" class="layui-input" value="<?=$vip?>" placeholder="Nhập số ngày thưởng VIP mỗi lần">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label layui-form-required">Hạn mức hàng ngày</label>
            <div class="layui-input-block">
                <input type="number" name="daynum" required lay-verify="required" autocomplete="off" class="layui-input" value="<?=$daynum?>" placeholder="Nhập số lần thưởng hàng ngày của nhiệm vụ, 0 đại diện cho không giới hạn">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label layui-form-required">Trạng thái Nhiệm vụ</label>
            <div class="layui-input-block">
                <select name="yid">
                    <option value="0">Mở</option>
                    <option value="1"<?php if($yid == 1) echo 'selected';?>>Đóng</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item text-right">
            <input type="hidden" name="id" value="<?=$id?>">
            <button class="layui-btn" lay-filter="*" lay-submit>Lưu</button>
            <button type="reset" class="layui-btn layui-btn-primary">Đặt lại</button>
        </div>
    </form>
</div>
</body>
</html>
