<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin chi tiết thành viên</title>
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
<style type="text/css">
.layui-row b{
    padding: 0 10px;
    width: 100px;
    text-align: right;
    display: inline-block;
}
</style>
</head>
<body>
<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-row layui-col-space25" style="margin-top: 10px;">
            <blockquote class="layui-elem-quote" style="margin: 10px 12px;background-color: #fff;padding: 5px 15px;">Thông tin cơ bản người dùng</blockquote>
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                <b>ID thành viên：</b><?=$id?>
            </div>
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                <b>Tài khoản đăng nhập：</b><?=$name?>
            </div>
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                <b>Bút danh：</b><?=$nichen?>
            </div>
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                <b>Số điện thoại liên lạc：</b><?=$tel?>
            </div>
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                <b>Liên hệ QQ：</b><?=$qq?>
            </div>
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                <b>Email liên hệ：</b><?=$email?>
            </div>
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                <b>Thành phố/Khu vực：</b><?=$city?>
            </div>
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                <b>Số dư còn lại：</b><?=$rmb?>
            </div>
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                <b>Số lượng <?=Pay_Cion_Name?>：</b><?=$cion?>
            </div>
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                <b>Số lượng vé tháng：</b><?=$ticket?>
            </div>
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                <b>Trạng thái hiện tại：</b><?=$sid==0?'<span class="layui-btn layui-btn-xs">Bình thường</span>':'<span class="layui-btn layui-btn-xs layui-btn-danger">Bị khóa</span>'?>
            </div>
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                <b>Xác minh người dùng：</b>
                <?php
                    if($cid == 1){
                        echo '<span class="layui-btn layui-btn-xs layui-btn-danger">Đang chờ duyệt</span>';
                    }elseif($cid == 2){
                        echo '<span class="layui-btn layui-btn-xs layui-btn-danger">Duyệt không thành công</span>';
                    }elseif($cid == 3){
                        echo '<span class="layui-btn layui-btn-xs">Xác minh cá nhân</span>';
                    }elseif($cid == 4){
                        echo '<span class="layui-btn layui-btn-xs layui-btn-normal">Xác minh doanh nghiệp</span>';
                    }else{
                        echo '<span class="layui-btn layui-btn-xs layui-btn-disabled">Chưa xác minh</span>';
                    }
                ?>
            </div>
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                <b>Thời gian tham gia：</b><?=date('Y-m-d H:i:s',$addtime)?>
            </div>
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                <b>Quyền Vip：</b><?=$vip>0?'<span class="layui-btn layui-btn-xs layui-btn-danger">Thành viên Vip</span>':'<span class="layui-btn layui-btn-xs layui-btn-normal">Thành viên thường</span>';?>
            </div>
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                <b>Thời gian Vip：</b><?=$vip>0?date('Y-m-d H:i:s',$viptime):'--------';?>
            </div>
            <div class="layui-col-xs12 layui-col-md12">
                <b>Giới thiệu cá nhân：</b><?=$text?>
            </div>
        </div>
        <div class="layui-row layui-col-space25" style="margin-bottom: 20px;">
            <blockquote class="layui-elem-quote" style="margin: 10px 12px;background-color: #fff;padding: 5px 15px;">Thông tin tài chính người dùng</blockquote>
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                <b><?=$cid==2?'Tên doanh nghiệp':'Họ và tên';?>：</b><?=$realname?>
            </div>
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                <b><?=$cid==2?'Giấy phép kinh doanh':'Số CMND';?>：</b><?=$idcard?>
            </div>
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                <b>Ngân hàng thanh toán：</b><?=$bank?>
            </div>
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md6">
                <b>Tài khoản ngân hàng：</b><?=$card?>
            </div>
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md6">
                <b>Địa chỉ ngân hàng：</b><?=$bankcity?>
            </div>
        </div>
    </div>
</div>
</body>
</html>