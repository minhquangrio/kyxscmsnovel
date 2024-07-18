<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cấu hình thanh toán</title>
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
    <script src="<?=Web_Base_Path?>admin/js/md5.js"></script>
    <script src="<?=Web_Base_Path?>admin/js/common.js"></script>
</head>

<body>
<div class="breadcrumb-nav">
    <span class="layui-breadcrumb">
        <a>Cấu hình Hệ thống</a>
        <a><cite>Cấu hình thanh toán</cite></a>
    </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="Làm mới"><i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>

<div class="layui-fluid">
    <div class="layui-card">
        <form class="layui-form" action="<?=links('setting','pay_save')?>">
            <div class="layui-card-body">
                <div class="layui-tab layui-tab-brief" lay-filter="setting">
                    <ul class="layui-tab-title">
    <li class="layui-this">Cấu hình cơ bản</li>
    <li> Cấu hình mã thẻ</li>
    <li> Cấu hình Alipay</li>
    <li> Cấu hình ví QQ</li>
    <li> Cấu hình WeChat</li>
</ul>

                    <div class="layui-tab-content">
                        <div class="layui-tab-item layui-show">
                            <div class="layui-text" style="max-width: 700px;padding-top: 25px;">
                                <div class="layui-form-item w120">
    <label class="layui-form-label layui-form-required">Tên Đơn vị Tiền ảo:</label>
    <div class="layui-input-block">
        <input type="text" name="Pay_Cion_Name" placeholder="Tên viết tắt của tiền ảo, ví dụ: Điểm" value="<?=Pay_Cion_Name?>" class="layui-input" lay-verify="required" required/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label layui-form-required">Tỉ lệ quy đổi <?=Pay_Cion_Name?>:</label>
    <div class="layui-input-block">
        <input type="number" name="Pay_Rmb_Cion" placeholder="1 đồng tiền Việt Nam bằng bao nhiêu <?=Pay_Cion_Name?>" value="<?=Pay_Rmb_Cion?>" class="layui-input" lay-verify="required" required/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label layui-form-required">Số tiền nạp tối thiểu:</label>
    <div class="layui-input-block">
        <input type="number" name="Pay_Rmb_Min" placeholder="Số tiền nạp tối thiểu, đơn vị là đồng" value="<?=Pay_Rmb_Min?>" class="layui-input" lay-verify="required" required/>
    </div>
</div>

                                <div class="layui-form-item w120">
    <div class="layui-col-xs12 layui-col-md6">
        <label class="layui-form-label">Giá Vip hàng tháng:</label>
        <div class="layui-input-block">
            <input type="number" name="Pay_Vip_Rmb1" placeholder="Giá thành Vip hàng tháng, đơn vị là đồng, một tháng bao nhiêu tiền" value="<?=Pay_Vip_Rmb1?>" class="layui-input" lay-verify="required" required/>
        </div>
    </div>
    <div class="layui-col-xs12 layui-col-md6">
        <label class="layui-form-label">Giá Vip hàng quý:</label>
        <div class="layui-input-block">
            <input type="number" name="Pay_Vip_Rmb2" placeholder="Giá thành Vip hàng quý, đơn vị là đồng, một tháng bao nhiêu tiền" value="<?=Pay_Vip_Rmb2?>" class="layui-input" lay-verify="required" required/>
        </div>
    </div>
</div>
<div class="layui-form-item w120">
    <div class="layui-col-xs12 layui-col-md6">
        <label class="layui-form-label">Giá Vip hàng nửa năm:</label>
        <div class="layui-input-block">
            <input type="number" name="Pay_Vip_Rmb3" placeholder="Giá thành Vip hàng nửa năm, đơn vị là đồng, một tháng bao nhiêu tiền" value="<?=Pay_Vip_Rmb3?>" class="layui-input" lay-verify="required" required/>
        </div>
    </div>
    <div class="layui-col-xs12 layui-col-md6">
        <label class="layui-form-label">Giá Vip hàng năm:</label>
        <div class="layui-input-block">
            <input type="number" name="Pay_Vip_Rmb4" placeholder="Giá thành Vip hàng năm, đơn vị là đồng, một tháng bao nhiêu tiền" value="<?=Pay_Vip_Rmb4?>" class="layui-input" lay-verify="required" required/>
        </div>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Thời gian tặng thêm tối thiểu:</label>
    <div class="layui-input-block">
        <input type="number" name="Pay_Vip_Month" placeholder="Thời gian tối thiểu để nhận được quà tặng, tính bằng tháng" value="<?=Pay_Vip_Month?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Tỉ lệ tặng thêm mỗi tháng:</label>
    <div class="layui-input-block">
        <input type="number" name="Pay_Vip_Day" placeholder="Đơn vị: ngày, số ngày tặng thêm mỗi tháng, 0 nếu không tặng thêm" value="<?=Pay_Vip_Day?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <div class="layui-input-block">
        <button class="layui-btn" lay-filter="*" lay-submit>
            Cập nhật thông tin cấu hình
        </button>
    </div>
</div>

                            </div>
                        </div>
                        <div class="layui-tab-item">
                            <div class="layui-text" style="max-width: 700px;padding-top: 25px;">
                                <div class="layui-form-item w120">
    <label class="layui-form-label">Địa chỉ bán thẻ cào:</label>
    <div class="layui-input-block">
        <input type="text" name="Pay_Card_Url" placeholder="Địa chỉ của nền tảng bán thẻ cào" value="<?=Pay_Card_Url?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <div class="layui-input-block">
        <button class="layui-btn" lay-filter="*" lay-submit>
            Cập nhật thông tin cấu hình
        </button>
    </div>
</div>

                            </div>
                        </div>
                        <?php
                            $Pay_Ali_Pubkey = defined('Pay_Ali_Pubkey') ? Pay_Ali_Pubkey : '';
                            $Pay_Ali_Prikey = defined('Pay_Ali_Prikey') ? Pay_Ali_Prikey : '';
                        ?>
                        <div class="layui-tab-item">
                            <div class="layui-text" style="max-width: 700px;padding-top: 25px;">
                                <div class="layui-form-item w120">
    <label class="layui-form-label">ID Ứng dụng Alipay:</label>
    <div class="layui-input-block">
        <input type="text" name="Pay_Ali_ID" placeholder="ID Ứng dụng Alipay, APPID" value="<?=Pay_Ali_ID?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Khóa công khai Alipay:</label>
    <div class="layui-input-block">
        <textarea style="min-height:150px;" name="Pay_Ali_Pubkey" placeholder="Khóa công khai Alipay" class="layui-textarea"><?=$Pay_Ali_Pubkey?></textarea>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Khóa riêng tư ứng dụng Thương gia:</label>
    <div class="layui-input-block">
        <textarea style="min-height:150px;" name="Pay_Ali_Prikey" placeholder="Khóa riêng tư ứng dụng Thương gia" class="layui-textarea"><?=$Pay_Ali_Prikey?></textarea>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Kích hoạt:</label>
    <div class="layui-input-inline" style="display: block;width: auto;float: none;">
        <input type="radio" name="Pay_Ali_Mode" value="0" title="Bật"<?php if(Pay_Ali_Mode == 0) echo ' checked';?>>
        <input type="radio" name="Pay_Ali_Mode" value="1" title="Tắt"<?php if(Pay_Ali_Mode == 1) echo ' checked';?>>
    </div>
</div>
<div class="layui-form-item w120">
    <div class="layui-input-block">
        <button class="layui-btn" lay-filter="*" lay-submit>
            Cập nhật thông tin cấu hình
        </button>
    </div>
</div>

                            </div>
                        </div>
                        <div class="layui-tab-item">
                            <div class="layui-text" style="max-width: 700px;padding-top: 25px;">
                                <div class="layui-form-item w120">
    <label class="layui-form-label">AppID Ứng dụng:</label>
    <div class="layui-input-block">
        <input type="text" name="Pay_QQ_ID" placeholder="AppID của ứng dụng đã được phê duyệt bởi nền tảng mở của Tencent hoặc QQ, có thể để trống" value="<?=Pay_QQ_ID?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">HCHID của Người bán:</label>
    <div class="layui-input-block">
        <input type="text" name="Pay_QQ_User" placeholder="Mã người bán được cấp bởi QQ Wallet" value="<?=Pay_QQ_User?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Khóa bí mật của Người bán:</label>
    <div class="layui-input-block">
        <input type="text" name="Pay_QQ_Key" placeholder="Khóa API, từ Trang quản lý Tài khoản của QQ Wallet (https://qpay.qq.com/) --> Quản lý tài khoản --> Bảo mật API" value="<?=Pay_QQ_Key?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Kích hoạt:</label>
    <div class="layui-input-inline" style="display: block;width: auto;float: none;">
        <input type="radio" name="Pay_QQ_Mode" value="0" title="Bật"<?php if(Pay_QQ_Mode == 0) echo ' checked';?>>
        <input type="radio" name="Pay_QQ_Mode" value="1" title="Tắt"<?php if(Pay_QQ_Mode == 1) echo ' checked';?>>
    </div>
</div>
<div class="layui-form-item w120">
    <div class="layui-input-block">
        <button class="layui-btn" lay-filter="*" lay-submit>
            Cập nhật thông tin cấu hình
        </button>
    </div>
</div>

                            </div>
                        </div>
                        <div class="layui-tab-item">
                            <div class="layui-text" style="max-width: 700px;padding-top: 25px;">
                                <div class="layui-form-item w120">
    <label class="layui-form-label">AppID Ứng dụng:</label>
    <div class="layui-input-block">
        <input type="text" name="Pay_Wx_ID" placeholder="ID tài khoản công cộng được cấp cho WeChat Pay (corpid của doanh nghiệp là appId)" value="<?=Pay_Wx_ID?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Khóa bí mật KEY:</label>
    <div class="layui-input-block">
        <input type="text" name="Pay_Wx_Key" placeholder="Từ trang quản lý tài khoản WeChat Pay (pay.weixin.qq.com) --> Cài đặt tài khoản --> Bảo mật API --> Cài đặt khóa" value="<?=Pay_Wx_Key?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">ID Người bán:</label>
    <div class="layui-input-block">
        <input type="text" name="Pay_Wx_User" placeholder="ID Người bán được cấp bởi WeChat Pay" value="<?=Pay_Wx_User?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Kích hoạt:</label>
    <div class="layui-input-inline" style="display: block;width: auto;float: none;">
        <input type="radio" name="Pay_Wx_Mode" value="0" title="Bật"<?php if(Pay_Wx_Mode == 0) echo ' checked';?>>
        <input type="radio" name="Pay_Wx_Mode" value="1" title="Tắt"<?php if(Pay_Wx_Mode == 1) echo ' checked';?>>
    </div>
</div>
<div class="layui-form-item w120">
    <div class="layui-input-block">
        <button class="layui-btn" lay-filter="*" lay-submit>
            Cập nhật thông tin cấu hình
        </button>
    </div>
</div>

                            </div>
                        </div>
                        <div class="layui-tab-item">
                            <div class="layui-text" style="max-width: 700px;padding-top: 25px;">
                                <div class="layui-form-item w120">
    <label class="layui-form-label">Khóa bí mật KEY:</label>
    <div class="layui-input-block">
        <input type="text" name="Pay_Stripe_Key" placeholder="Khóa API" value="<?=!defined('Pay_Stripe_Key')?'':Pay_Stripe_Key;?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Kích hoạt:</label>
    <div class="layui-input-inline" style="display: block;width: auto;float: none;">
        <input type="radio" name="Pay_Stripe_Mode" value="0" title="Bật"<?php if(Pay_Stripe_Mode == 0) echo ' checked';?>>
        <input type="radio" name="Pay_Stripe_Mode" value="1" title="Tắt"<?php if(Pay_Stripe_Mode == 1) echo ' checked';?>>
    </div>
</div>
<div class="layui-form-item w120">
    <div class="layui-input-block">
        <button class="layui-btn" lay-filter="*" lay-submit>
            Cập nhật thông tin cấu hình
        </button>
    </div>
</div>

                            </div>
                        </div>
                        <div class="layui-tab-item">
                            <div class="layui-text" style="max-width: 700px;padding-top: 25px;">
                                <div class="layui-form-item w120">
    <label class="layui-form-label">clientId:</label>
    <div class="layui-input-block">
        <input type="text" name="Pay_Paypal_ID" placeholder="clientId" value="<?=!defined('Pay_Paypal_ID')?'':Pay_Paypal_ID;?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">clientSecret:</label>
    <div class="layui-input-block">
        <input type="text" name="Pay_Paypal_Key" placeholder="clientSecret" value="<?=!defined('Pay_Paypal_Key')?'':Pay_Paypal_Key;?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Kích hoạt:</label>
    <div class="layui-input-inline" style="display: block;width: auto;float: none;">
        <input type="radio" name="Pay_Paypal_Mode" value="0" title="Bật"<?php if(Pay_Paypal_Mode == 0) echo ' checked';?>>
        <input type="radio" name="Pay_Paypal_Mode" value="1" title="Tắt"<?php if(Pay_Paypal_Mode == 1) echo ' checked';?>>
    </div>
</div>
<div class="layui-form-item w120">
    <div class="layui-input-block">
        <button class="layui-btn" lay-filter="*" lay-submit>
            Cập nhật thông tin cấu hình
        </button>
    </div>
</div>

                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
$(function(){
    var tps = '';
    $('.layui-input,.layui-textarea').click(function(){
        if($(this).attr('placeholder') != tps){
            tps = $(this).attr('placeholder');
            layer.tips(tps, $(this),{tips:1});    
        }
    });
});
</script>
</body>
</html>