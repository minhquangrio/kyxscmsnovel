<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cấu hình người dùng</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<?=Web_Base_Path?>admin/css/style.css">
    <script src="<?=Web_Base_Path?>jquery/jquery.min.js"></script>
    <!-- Hỗ trợ IE8/9 cho truy vấn phương tiện, giúp tương thích với lưới -->
    <!--[if lt IE 9]>
    <script src="<?=Web_Base_Path?>jquery/jquery-1.9.1.min.js"></script>
    <script src="<?=Web_Base_Path?>admin/js/html5.min.js"></script>
    <script src="<?=Web_Base_Path?>admin/js/respond.min.js"></script>
    <![endif]-->
    <script src="<?=Web_Base_Path?>layui/layui.js"></script>
    <script src="<?=Web_Base_Path?>admin/js/common.js"></script>
    <script src="<?=Web_Base_Path?>layui/ace/ace.js"></script>
</head>

<body>
<div class="breadcrumb-nav">
    <span class="layui-breadcrumb">
        <a>Cấu hình hệ thống</a>
        <a><cite>Cấu hình người dùng</cite></a>
    </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="Làm mới"><i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>

<div class="layui-fluid">
    <div class="layui-card">
        <form class="layui-form" action="<?=links('setting','user_save')?>">
            <div class="layui-card-body">
                <div class="layui-tab layui-tab-brief" lay-filter="setting">
                    <ul class="layui-tab-title">
    <li lay-id="t1" class="layui-this">Cấu hình độc giả</li>
    <li lay-id="t2">Cấu hình tác giả</li>
    <li lay-id="t3">Cấu hình thư điện tử</li>
    <li lay-id="t4">Gửi thư điện tử</li>
    <li lay-id="t5">Cấu hình tin nhắn</li>
    <li lay-id="t6">Đăng nhập bằng bên thứ ba</li>
</ul>

                    <div class="layui-tab-content">
                        <div class="layui-tab-item layui-show">
                            <div class="layui-text" style="max-width: 700px;padding-top: 25px;">
                                <div class="layui-form-item w120">
    <label class="layui-form-label">Bật/Tắt đăng ký:</label>
    <div class="layui-input-inline" style="display: block;width: auto;float: none;">
        <input type="radio" name="User_Reg" value="0" title="Bật"<?php if(User_Reg == 0) echo ' checked';?>>
        <input type="radio" name="User_Reg" value="1" title="Tắt"<?php if(User_Reg == 1) echo ' checked';?>>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Xác nhận đăng ký:</label>
    <div class="layui-input-inline" style="display: block;width: auto;float: none;">
        <input type="radio" name="User_Reg_Tel" value="0" title="Bật"<?php if(User_Reg_Tel == 0) echo ' checked';?>>
        <input type="radio" name="User_Reg_Tel" value="1" title="Tắt"<?php if(User_Reg_Tel == 1) echo ' checked';?>>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Nhóm thành viên mặc định:</label>
    <div class="layui-input-inline" style="display: block;width: auto;float: none;">
        <input type="radio" name="User_Reg_Vip" value="0" title="Thành viên thường"<?php if(User_Reg_Vip == 0) echo ' checked';?>>
        <input type="radio" name="User_Reg_Vip" value="1" title="Thành viên VIP"<?php if(User_Reg_Vip == 1) echo ' checked';?>>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Tặng <?=Pay_Cion_Name?> khi đăng ký:</label>
    <div class="layui-input-block">
        <input type="text" name="User_Reg_Cion" placeholder="Tặng <?=Pay_Cion_Name?> khi đăng ký mới" value="<?=User_Reg_Cion?>" class="layui-input" lay-verify="required" required/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Tặng VIP khi đăng ký:</label>
    <div class="layui-input-block">
        <input type="text" name="User_Reg_Vip_Day" placeholder="Tặng VIP trong bao nhiêu ngày khi đăng ký mới" value="<?=User_Reg_Vip_Day?>" class="layui-input" lay-verify="required" required/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Tặng <?=Pay_Cion_Name?> khi giới thiệu:</label>
    <div class="layui-input-block">
        <input type="text" name="User_Tg_Cion" placeholder="Tặng <?=Pay_Cion_Name?> khi giới thiệu thành công" value="<?=User_Tg_Cion?>" class="layui-input" lay-verify="required" required/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Tặng <?=Pay_Cion_Name?> khi bình luận:</label>
    <div class="layui-input-block">
        <input type="text" name="User_Pl_Cion" placeholder="Tặng <?=Pay_Cion_Name?> mỗi lần bình luận" value="<?=User_Pl_Cion?>" class="layui-input" lay-verify="required" required/>
    </div>
</div>

                                <div class="layui-form-item w120">
    <label class="layui-form-label">Giới hạn tặng khi bình luận:</label>
    <div class="layui-input-block">
        <input type="text" name="User_Pl_Num" placeholder="Mỗi ngày tối đa tặng bao nhiêu <?=Pay_Cion_Name?>" value="<?=User_Pl_Num?>" class="layui-input" lay-verify="required" required/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Thông báo trung tâm thành viên:</label>
    <div class="layui-input-block">
        <textarea style="min-height:100px;" name="User_Gg" placeholder="Thông báo trung tâm thành viên" class="layui-textarea"><?=User_Gg?></textarea>
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
                            <div class="layui-form layui-text" style="max-width: 700px;padding-top: 25px;">
                                <div class="layui-form-item w120">
    <label class="layui-form-label">Chế độ tác giả:</label>
    <div class="layui-input-inline" style="display: block;width: auto;float: none;">
        <input type="radio" name="Author_Mode" value="0" title="Mở"<?php if(Author_Mode == 0) echo ' checked';?>>
        <input type="radio" name="Author_Mode" value="1" title="Đóng"<?php if(Author_Mode == 1) echo ' checked';?>>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Xác nhận tác giả:</label>
    <div class="layui-input-inline" style="display: block;width: auto;float: none;">
        <input type="radio" name="Author_Rz" value="0" title="Mở"<?php if(Author_Rz == 0) echo ' checked';?>>
        <input type="radio" name="Author_Rz" value="1" title="Đóng"<?php if(Author_Rz == 1) echo ' checked';?>>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Số tiền tối thiểu rút:</label>
    <div class="layui-input-block">
        <input type="number" name="Author_Tx_Rmb" placeholder="Số tiền tối thiểu rút của tác giả" value="<?=Author_Tx_Rmb?>" class="layui-input" lay-verify="number"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Tặng <?=Pay_Cion_Name?> khi thêm truyện tranh:</label>
    <div class="layui-input-block">
        <input type="number" name="Author_Comic_Cion" placeholder="Số lượng <?=Pay_Cion_Name?> khi thêm truyện tranh mới" value="<?=Author_Comic_Cion?>" class="layui-input" lay-verify="number"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Tặng <?=Pay_Cion_Name?> khi thêm tiểu thuyết:</label>
    <div class="layui-input-block">
        <input type="number" name="Author_Book_Cion" placeholder="Số lượng <?=Pay_Cion_Name?> khi thêm tiểu thuyết mới" value="<?=Author_Book_Cion?>" class="layui-input" lay-verify="number"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Phần trăm chia sẻ khi được đánh giá:</label>
    <div class="layui-input-block">
        <input type="number" name="Author_Fc_Ds" placeholder="Phần trăm chia sẻ khi được đánh giá, phần trăm, 0 là không chia sẻ" value="<?=Author_Fc_Ds?>" class="layui-input" lay-verify="required" required/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Phần trăm chia sẻ khi có phiếu tháng:</label>
    <div class="layui-input-block">
        <input type="number" name="Author_Fc_Yp" placeholder="Phần trăm chia sẻ khi có phiếu tháng, phần trăm, 0 là không chia sẻ" value="<?=Author_Fc_Yp?>" class="layui-input" lay-verify="required" required/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Phần trăm chia sẻ truyện tranh:</label>
    <div class="layui-input-block">
        <input type="number" name="Author_Fc_Comic" placeholder="Phần trăm chia sẻ truyện tranh, phần trăm, 0 là không chia sẻ" value="<?=Author_Fc_Comic?>" class="layui-input" lay-verify="required" required/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Phần trăm chia sẻ tiểu thuyết:</label>
    <div class="layui-input-block">
        <input type="number" name="Author_Fc_Book" placeholder="Phần trăm chia sẻ tiểu thuyết, phần trăm, 0 là không chia sẻ" value="<?=Author_Fc_Book?>" class="layui-input" lay-verify="required" required/>
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
                            <div class="layui-form layui-text" style="max-width: 700px;padding-top: 25px;">
    <div class="layui-form-item w120">
        <label class="layui-form-label">Phương thức gửi email:</label>
        <div class="layui-input-inline" style="display: block;width: auto;float: none;">
            <input lay-filter="type" type="radio" name="Mail_Type" value="smtp" title="SMTP"<?php if(Mail_Type == 'smtp') echo ' checked';?>>
            <input lay-filter="type" type="radio" name="Mail_Type" value="mail" title="Mail"<?php if(Mail_Type == 'mail') echo ' checked';?>>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Máy chủ SMTP:</label>
        <div class="layui-input-block">
            <input id="mail_host" type="text" name="Mail_Host" placeholder="Địa chỉ máy chủ SMTP" value="<?=Mail_Host?>" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Cổng gửi email:</label>
        <div class="layui-input-block">
            <input id="mail_port" type="text" name="Mail_Port" placeholder="Cổng gửi email, thông thường là 25, 465 cho email QQ" value="<?=Mail_Port?>" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Tên người gửi:</label>
        <div class="layui-input-block">
            <input id="mail_name" type="text" name="Mail_Name" placeholder="Tên người gửi, ví dụ: Mccms chính thức" value="<?=Mail_Name?>" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Địa chỉ email gửi:</label>
        <div class="layui-input-block">
            <input id="mail_email" type="text" name="Mail_Email" placeholder="Nhập địa chỉ email đầy đủ" value="<?=Mail_Email?>" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Tài khoản email:</label>
        <div class="layui-input-block">
            <input id="mail_user" type="text" name="Mail_User" placeholder="Nhập địa chỉ email đầy đủ, đối với email QQ nhập số QQ" value="<?=Mail_User?>" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Mật khẩu email:</label>
        <div class="layui-input-block">
            <input id="mail_pass" type="text" name="Mail_Pass" placeholder="Mật khẩu email, nếu là email QQ thì nhập mã xác thực, đối với email 163 thì nhập mật khẩu an toàn" value="<?=get_pass(Mail_Pass)?>" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Phương thức xác thực SMTP:</label>
        <div class="layui-input-inline" style="display: block;width: auto;float: none;">
            <input lay-filter="crypto" type="radio" name="Mail_Crypto" value="" title="Không"<?php if(Mail_Crypto == '') echo ' checked';?>>
            <input lay-filter="crypto" type="radio" name="Mail_Crypto" value="tls" title="TLS"<?php if(Mail_Crypto == 'tls') echo ' checked';?>>
            <input lay-filter="crypto" type="radio" name="Mail_Crypto" value="ssl" title="SSL"<?php if(Mail_Crypto == 'ssl') echo ' checked';?>>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Email nhận thử nghiệm:</label>
        <div class="layui-input-block">
            <input id="mail_tomail" type="text" name="Mail_Demo" placeholder="Nhập địa chỉ email đầy đủ" value="<?=Mail_Demo?>" class="layui-input"/>
            <div class="layui-btn layui-btn-normal" onclick="mail_demo();" style="position: absolute;top: 0px;right: 0;">Gửi email thử nghiệm</div>
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
                            <div class="layui-form layui-text" style="padding-top: 25px;">
                                <div class="layui-form-item w120">
    <label class="layui-form-label">Tiêu đề gửi mã xác nhận:</label>
    <div class="layui-input-block">
        <input type="text" name="Mail_Code_Title" placeholder="Tiêu đề email gửi mã xác nhận" value="<?=Mail_Code_Title?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Nội dung gửi mã xác nhận:</label>
    <div class="layui-input-block">
        <textarea lay-verify="editor1" id="editor1" name="Mail_Code_Msg" placeholder="Nội dung email gửi mã xác nhận" class="layui-textarea"><?=Mail_Code_Msg?></textarea>
        <div class="layui-form-mid layui-word-aux">
            Tên trang web：<a class="mccms-label" href="javascript:" data-id="1" data-name="{site_name}" title="Tên trang web">{web_name}</a> 
            Địa chỉ trang web：<a class="mccms-label" href="javascript:" data-id="1" data-name="{web_url}" title="Địa chỉ trang web">{web_url}</a> 
            Loại hành động：<a class="mccms-label" href="javascript:" data-id="1" data-name="{type}" title="Loại hành động">{type}</a> 
            Mã xác nhận：<a class="mccms-label" href="javascript:" data-id="1" data-name="{code}" title="Mã xác nhận">{code}</a>
        </div>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Gửi email nhắc nhở đăng ký:</label>
    <div class="layui-input-block">
        <select name="Mail_Remind">
            <option value="1">Mở</option>
            <option value="0"<?php if(Mail_Remind==0) echo ' selected';?>>Đóng</option>
        </select>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Tiêu đề gửi email nhắc nhở:</label>
    <div class="layui-input-block">
        <input type="text" name="Mail_Remind_Title" placeholder="Tiêu đề email gửi nhắc nhở" value="<?=Mail_Remind_Title?>" class="layui-input"/>
    </div>
</div>

                                <div class="layui-form-item w120">
    <label class="layui-form-label">Nội dung gửi thông báo đăng ký:</label>
    <div class="layui-input-block">
        <textarea lay-verify="editor2" id="editor2" name="Mail_Remind_Msg" placeholder="Nội dung gửi thông báo đăng ký" class="layui-textarea" style="min-height: 400px;"><?=Mail_Remind_Msg?></textarea>
        <div class="layui-form-mid layui-word-aux">
            Tên trang web：<a class="mccms-label" href="javascript:" data-id="2" data-name="{site_name}" title="Tên trang web">{web_name}</a> 
            Địa chỉ trang web：<a class="mccms-label" href="javascript:" data-id="2" data-name="{web_url}" title="Địa chỉ trang web">{web_url}</a> 
            Nickname người dùng：<a class="mccms-label" href="javascript:" data-id="2" data-name="{user_nichen}" title="Nickname người dùng">{user_nichen}</a>
            Email người dùng：<a class="mccms-label" href="javascript:" data-id="2" data-name="{user_email}" title="Email người dùng">{user_email}</a>
            Tên truyện tranh：<a class="mccms-label" href="javascript:" data-id="2" data-name="{comic_name}" title="Tên truyện tranh">{comic_name}</a>
            Tên chương：<a class="mccms-label" href="javascript:" data-id="2" data-name="{comic_chapter_name}" title="Tên chương">{comic_chapter_name}</a>
            Liên kết truyện tranh：<a class="mccms-label" href="javascript:" data-id="2" data-name="{comic_url}" title="Liên kết truyện tranh">{comic_url}</a>
            Thể loại truyện tranh：<a class="mccms-label" href="javascript:" data-id="2" data-name="{comic_cname}" title="Thể loại truyện tranh">{comic_cname}</a>
            Giới thiệu truyện tranh：<a class="mccms-label" href="javascript:" data-id="2" data-name="{comic_text}" title="Giới thiệu truyện tranh">{comic_text}</a>
            Ảnh đại diện truyện tranh：<a class="mccms-label" href="javascript:" data-id="2" data-name="{comic_pic}" title="Ảnh đại diện truyện tranh">{comic_pic}</a>
            Trạng thái truyện tranh：<a class="mccms-label" href="javascript:" data-id="2" data-name="{comic_serialize}" title="Trạng thái truyện tranh">{comic_serialize}</a>
            Thời gian cập nhật：<a class="mccms-label" href="javascript:" data-id="2" data-name="{comic_addtime}" title="Thời gian cập nhật truyện tranh">{comic_addtime}</a>
            Liên kết đăng ký：<a class="mccms-label" href="javascript:" data-id="2" data-name="{comic_remind_url}" title="Liên kết đăng ký truyện tranh">{comic_remind_url}</a>
        </div>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Gửi email thông báo rút tiền:</label>
    <div class="layui-input-block">
        <select name="Mail_Drawing">
            <option value="1">Mở</option>
            <option value="0"<?php if(Mail_Drawing==0) echo ' selected';?>>Đóng</option>
        </select>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Tiêu đề gửi email thông báo rút tiền:</label>
    <div class="layui-input-block">
        <input type="text" name="Mail_Drawing_Title" placeholder="Tiêu đề email gửi thông báo rút tiền" value="<?=Mail_Drawing_Title?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Nội dung gửi email thông báo rút tiền:</label>
    <div class="layui-input-block">
        <textarea lay-verify="editor3" id="editor3" name="Mail_Drawing_Msg" placeholder="Nội dung email gửi thông báo rút tiền" class="layui-textarea" style="min-height: 400px;"><?=Mail_Drawing_Msg?></textarea>
        <div class="layui-form-mid layui-word-aux">
            Tên trang web：<a class="mccms-label" href="javascript:" data-id="3" data-name="{site_name}" title="Tên trang web">{web_name}</a> 
            Địa chỉ trang web：<a class="mccms-label" href="javascript:" data-id="3" data-name="{web_url}" title="Địa chỉ trang web">{web_url}</a> 
            Nickname người dùng：<a class="mccms-label" href="javascript:" data-id="3" data-name="{user_nichen}" title="Nickname người dùng">{user_nichen}</a>
            Email người dùng：<a class="mccms-label" href="javascript:" data-id="3" data-name="{user_email}" title="Email người dùng">{user_email}</a>
            Mã đơn rút tiền：<a class="mccms-label" href="javascript:" data-id="3" data-name="{drawing_dd}" title="Mã đơn rút tiền">{drawing_dd}</a>
            Trạng thái rút tiền：<a class="mccms-label" href="javascript:" data-id="3" data-name="{drawing_zt}" title="Trạng thái rút tiền">{drawing_zt}</a>
            Số tiền rút tiền：<a class="mccms-label" href="javascript:" data-id="3" data-name="{drawing_rmb}" title="Số tiền rút tiền">{drawing_rmb}</a>
            Thời gian rút tiền：<a class="mccms-label" href="javascript:" data-id="3" data-name="{drawing_addtime}" title="Thời gian rút tiền">{drawing_addtime}</a>
        </div>
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
    <div class="layui-form layui-text" style="max-width: 700px;padding-top: 25px;">
        <div class="layui-form-item w120">
            <label class="layui-form-label">Nhà cung cấp dịch vụ tin nhắn:</label>
            <div class="layui-input-inline" style="display: block;width: auto;float: none;">
                <input lay-filter="sms" type="radio" name="Sms_Mode" value="0" title="Tắt tin nhắn"<?php if(Sms_Mode == 0) echo ' checked';?>>
                <input lay-filter="sms" type="radio" name="Sms_Mode" value="1" title="Dịch vụ tin nhắn Alibaba"<?php if(Sms_Mode == 1) echo ' checked';?>>
                <input lay-filter="sms" type="radio" name="Sms_Mode" value="2" title="Dịch vụ tin nhắn Tencent"<?php if(Sms_Mode == 2) echo ' checked';?>>
                <input lay-filter="sms" type="radio" name="Sms_Mode" value="3" title="Dịch vụ tin nhắn Aggregate Data"<?php if(Sms_Mode == 3) echo ' checked';?>>
            </div>
        </div>
        <div class="layui-form-item w120" id="sms"<?php if(Sms_Mode == 3) echo ' style="display: none;"';?>>
            <label class="layui-form-label">AppId:</label>
            <div class="layui-input-block">
                <input type="text" name="Sms_Appid" placeholder="AppId tương ứng của Tencent, KeyId của Alibaba" value="<?=Sms_Appid?>" class="layui-input"/>
            </div>
        </div>
        <div class="layui-form-item w120">
            <label class="layui-form-label">AppKey:</label>
            <div class="layui-input-block">
                <input type="text" name="Sms_Appkey" placeholder="AppKey tương ứng của Tencent, KeySecret của Alibaba, AppKey của Aggregate Data" value="<?=Sms_Appkey?>" class="layui-input"/>
            </div>
        </div>
        <div class="layui-form-item w120">
            <label class="layui-form-label">Chữ ký tin nhắn:</label>
            <div class="layui-input-block">
                <input type="text" name="Sms_Name" placeholder="Chữ ký tin nhắn, ví dụ: mccms" value="<?=Sms_Name?>" class="layui-input"/>
            </div>
        </div>
        <div class="layui-form-item w120">
            <label class="layui-form-label">Mã mẫu đăng ký đăng nhập:</label>
            <div class="layui-input-block">
                <input type="text" name="Sms_Tpl_Log" placeholder="Mã mẫu cần đăng ký trên bảng điều khiển tin nhắn của nhà cung cấp dịch vụ" value="<?=Sms_Tpl_Log?>" class="layui-input"/>
            </div>
        </div>
        <div class="layui-form-item w120">
            <label class="layui-form-label">Mã mẫu liên kết điện thoại:</label>
            <div class="layui-input-block">
                <input type="text" name="Sms_Tpl_Bind" placeholder="Mã mẫu cần đăng ký trên bảng điều khiển tin nhắn của nhà cung cấp dịch vụ" value="<?=Sms_Tpl_Bind?>" class="layui-input"/>
            </div>
        </div>
        <div class="layui-form-item w120">
            <label class="layui-form-label">Mã mẫu quên mật khẩu:</label>
            <div class="layui-input-block">
                <input type="text" name="Sms_Tpl_Pass" placeholder="Mã mẫu cần đăng ký trên bảng điều khiển tin nhắn của nhà cung cấp dịch vụ" value="<?=Sms_Tpl_Pass?>" class="layui-input"/>
            </div>
        </div>
        <blockquote class="layui-elem-quote layui-quote-nm">
            Thông báo：<br>
            Hãy chắc chắn tuân thủ theo yêu cầu của nhà cung cấp dịch vụ tin nhắn về việc thiết lập chữ ký và nội dung tin nhắn.<br>
            Dịch vụ tin nhắn Tencent: https://cloud.tencent.com/product/sms<br>
            Ví dụ mẫu tin nhắn Tencent：<br>
            Kính gửi người dùng, mã xác nhận của bạn là: {1}, vui lòng không tiết lộ cho người khác!<br>
            Mã xác nhận của bạn là: {1}, bạn đang liên kết số điện thoại, nếu không phải là bạn, vui lòng bỏ qua tin nhắn này!<br>
            Mã xác nhận của bạn là: {1}, bạn đang thực hiện việc đặt lại mật khẩu, nếu không phải là bạn, vui lòng bỏ qua tin nhắn này!<br>
            Dịch vụ tin nhắn Alibaba: https://www.aliyun.com/product/sms<br>
            Ví dụ mẫu tin nhắn Alibaba：<br>
            Kính gửi người dùng, mã xác nhận của bạn là: ${code}, vui lòng không tiết lộ cho người khác!<br>
            Mã xác nhận của bạn là: ${code}, bạn đang liên kết số điện thoại, nếu không phải là bạn, vui lòng bỏ qua tin nhắn này!<br>
            Mã xác nhận của bạn là: ${code}, bạn đang thực hiện việc đặt lại mật khẩu, nếu không phải là bạn, vui lòng bỏ qua tin nhắn này!
        </blockquote>
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
                            <div class="layui-form layui-text" style="max-width: 700px;padding-top:5px;">
    <div class="layui-tab">
        <ul class="layui-tab-title">
            <li class="layui-this">Tencent QQ</li>
            <li>WeChat Scan</li>
            <li>Sina Weibo</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <div class="layui-form-item w120">
                    <label class="layui-form-label">AppId:</label>
                    <div class="layui-input-block">
                        <input type="text" name="Land_QQ_Appid" placeholder="Tương ứng với AppId của Tencent QQ" value="<?=Land_QQ_Appid?>" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-form-item w120">
                    <label class="layui-form-label">AppKey:</label>
                    <div class="layui-input-block">
                        <input type="text" name="Land_QQ_Appkey" placeholder="Tương ứng với AppKey của Tencent QQ" value="<?=Land_QQ_Appkey?>" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-form-item w120">
                    <label class="layui-form-label">QQ Callback URL:</label>
                    <div class="layui-input-block">
                        <input type="text" name="Land_QQ_Url" placeholder="Thường chỉ cần sửa domain" value="<?=Land_QQ_Url==''?(is_ssl()?'https://':'http://').Web_Url.Web_Path.'index.php/user/open/callback/qq':Land_QQ_Url?>" class="layui-input"/>
                    </div>
                </div>
            </div>
            <div class="layui-tab-item">
                <div class="layui-form-item w120">
                    <label class="layui-form-label">AppId:</label>
                    <div class="layui-input-block">
                        <input type="text" name="Land_Wx_Appid" placeholder="Tương ứng với AppId của WeChat" value="<?=Land_Wx_Appid?>" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-form-item w120">
                    <label class="layui-form-label">AppKey:</label>
                    <div class="layui-input-block">
                        <input type="text" name="Land_Wx_Appkey" placeholder="Tương ứng với AppKey của WeChat" value="<?=Land_Wx_Appkey?>" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-form-item w120">
                    <label class="layui-form-label">WeChat Callback URL:</label>
                    <div class="layui-input-block">
                        <input type="text" name="Land_Wx_Url" placeholder="Thường chỉ cần sửa domain" value="<?=Land_Wx_Url==''?(is_ssl()?'https://':'http://').Web_Url.Web_Path.'index.php/user/open/callback/weixin':Land_Wx_Url?>" class="layui-input"/>
                    </div>
                </div>
            </div>
            <div class="layui-tab-item">
                <div class="layui-form-item w120">
                    <label class="layui-form-label">AppId:</label>
                    <div class="layui-input-block">
                        <input type="text" name="Land_Wb_Appid" placeholder="Tương ứng với AppId của Sina Weibo" value="<?=Land_Wb_Appid?>" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-form-item w120">
                    <label class="layui-form-label">AppKey:</label>
                    <div class="layui-input-block">
                        <input type="text" name="Land_Wb_Appkey" placeholder="Tương ứng với AppKey của Sina Weibo" value="<?=Land_Wb_Appkey?>" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-form-item w120">
                    <label class="layui-form-label">Weibo Callback URL:</label>
                    <div class="layui-input-block">
                        <input type="text" name="Land_Wb_Url" placeholder="Thường chỉ cần sửa domain" value="<?=Land_Wb_Url==''?(is_ssl()?'https://':'http://').Web_Url.Web_Path.'index.php/user/open/callback/weibo':Land_Wb_Url?>" class="layui-input"/>
                    </div>
                </div>
            </div>
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
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    var mail_type = '<?=Mail_Type?>';
    var mail_crypto = '<?=Mail_Crypto?>';
    layui.use(['layedit', 'layer', 'form'], function () {
        var layedit = layui.layedit,
            form = layui.form,
            layer = layui.layer;

        layedit.set({
            uploadImage: {
                url: '<?=links('ajax','upload')?>?dir=<?=sys_auth('editor')?>',
                accept: 'image',
                acceptMime: 'image/*',
                exts: '<?=Annex_Ext?>',
                size: '10240'
            },
            calldel: {
                url: '<?=links('ajax','editor_delpic')?>'
            },
            tool: [
                'html', 'code', 'strong', 'italic', 'underline', 'del', 'addhr', '|', 'fontFomatt', 'colorpicker', 'face',
                '|', 'left', 'center', 'right', '|', 'link', 'unlink', 'images', 'image_alt', 'anchors',
                '|', 'table', 'fullScreen'
            ],
            height: '90%'
        });

        var editor1 = layedit.build('editor1');
        var editor2 = layedit.build('editor2');
        var editor3 = layedit.build('editor3');

        $('.mccms-label').click(function () {
            var id = $(this).attr('data-id');
            var tpl = $(this).attr('data-name');
            layedit.setContent(eval('editor' + id), tpl, true);
        });

        form.on('radio(sms)', function (d) {
            if (d.value == '3') {
                $('#sms').hide();
            } else {
                $('#sms').show();
            }
        });

        form.on('radio(crypto)', function (data) {
            mail_crypto = data.value;
        });

        form.on('radio(type)', function (data) {
            mail_type = data.value;
        });

        form.verify({
            editor1: function (value) {
                layedit.sync(editor1);
            },
            editor2: function (value) {
                layedit.sync(editor2);
            },
            editor3: function (value) {
                layedit.sync(editor3);
            }
        });
    });

    // Gửi email thử nghiệm
    function mail_demo() {
        var post = {
            type: mail_type,
            crypto: mail_crypto,
            host: $('#mail_host').val(),
            port: $('#mail_port').val(),
            user: $('#mail_user').val(),
            pass: $('#mail_pass').val(),
            form_mail: $('#mail_email').val(),
            form_name: $('#mail_name').val(),
            to_mail: $('#mail_tomail').val()
        };

        var index = layer.load();
        
        $.post('<?=links('ajax','mailadd')?>', post, function (res) {
            layer.close(index);
            if (res.code == 1) {
                layer.msg(res.msg, { icon: 1 });
            } else {
                layer.msg(res.msg, { icon: 2 });
            }
        }, 'json');
    }
</script>

</body>
</html>