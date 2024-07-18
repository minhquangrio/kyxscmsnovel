<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cấu hình trang web</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="<?=Web_Base_Path?>admin/css/style.css">
    <script src="<?=Web_Base_Path?>jquery/jquery.min.js"></script>
    <!-- Để IE8/9 hỗ trợ truy vấn phương tiện, từ đó tương thích với lưới -->
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
        <a>Cấu hình hệ thống</a>
        <a><cite>Cấu hình trang tài nguyên</cite></a>
    </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="Làm mới"><i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>

<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-body">
            <form class="layui-form" action="<?=links('setting','zyz_save')?>">
                <div class="layui-tab layui-tab-brief" lay-filter="setting">
    <ul class="layui-tab-title">
        <li class="layui-this">Nguồn Truyện Tranh</li>
        <li>Nguồn Truyện Sáng Tác</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <div class="layui-text laytps" style="max-width: 700px;padding-top: 25px;">
                <div class="layui-form-item w120">
                    <label class="layui-form-label">Bật/Tắt API:</label>
                    <div class="layui-input-inline" style="display: block;width: auto;float: none;">
                        <input type="radio" name="comic[init]" value="0" title="Tắt"<?php if($zyz['comic']['init'] == 0) echo ' checked';?>>
                        <input type="radio" name="comic[init]" value="1" title="Bật"<?php if($zyz['comic']['init'] == 1) echo ' checked';?>>
                    </div>
                </div>
                <div class="layui-form-item w120">
                    <label class="layui-form-label layui-form-required">Số Trang Mỗi Trang:</label>
                    <div class="layui-input-block">
                        <input type="text" name="comic[size]" placeholder="Số trang truyện hiển thị mỗi trang" value="<?=$zyz['comic']['size']?>" class="layui-input" lay-verify="required" required/>
                    </div>
                </div>
                <div class="layui-form-item w120">
                    <label class="layui-form-label layui-form-required">Tên Miền Ảnh:</label>
                    <div class="layui-input-block">
                        <input type="text" name="comic[picurl]" placeholder="Tên miền ảnh, để trống sẽ theo cấu hình đính kèm" value="<?=$zyz['comic']['picurl']?>" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-form-item w120">
                    <label class="layui-form-label layui-form-required">Lọc Theo ID Thể Loại:</label>
                    <div class="layui-input-block">
                        <input type="text" name="comic[cid]" placeholder="Lọc theo ID thể loại, nhiều ID cách nhau bằng dấu phẩy, ví dụ: 8,9,10" value="<?=$zyz['comic']['cid']?>" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-form-item w120">
                    <label class="layui-form-label">Có Phí:</label>
                    <div class="layui-input-inline" style="display: block;width: auto;float: none;">
                        <input lay-filter="mode2" type="radio" name="comic[pay]" value="0" title="Miễn Phí"<?php if($zyz['comic']['pay'] == 0) echo ' checked';?>>
                        <input lay-filter="mode2" type="radio" name="comic[pay]" value="1" title="Có Phí"<?php if($zyz['comic']['pay'] == 1) echo ' checked';?>>
                    </div>
                </div>
                <div class="layui-form-item w120 bpay" style="<?php if($zyz['comic']['pay'] == 0) echo 'display:none;';?>">
                    <label class="layui-form-label layui-form-required">Khóa Xác Minh:</label>
                    <div class="layui-input-block">
                        <textarea style="min-height:120px;" name="comic[token]" placeholder="Khóa xác minh, mỗi dòng một khóa" class="layui-textarea"><?=implode("\n",$zyz['comic']['token'])?></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-filter="*" lay-submit>
                            Cập Nhật Thông Tin Cấu Hình
                        </button>
                    </div>
                </div>
                <blockquote class="layui-elem-quote layui-quote-nm">
                    Thông báo:<br>
                    1. Địa chỉ nguồn truyện tranh: <?=(is_ssl()?'https://':'http://').Web_Url.Web_Path.(Url_Index_Mode==0?'index.php/':'')?>api/resources/comic<br>
                    2. Địa chỉ phân giải truyện tranh: <?=(is_ssl()?'https://':'http://').Web_Url.Web_Path.(Url_Index_Mode==0?'index.php/':'')?>api/resources/parsing_comic
                </blockquote>
            </div>
        </div>
        <div class="layui-tab-item">
            <div class="layui-text laytps" style="max-width: 700px;padding-top: 25px;">
                <div class="layui-form-item w120">
                    <label class="layui-form-label">Bật/Tắt API:</label>
                    <div class="layui-input-inline" style="display: block;width: auto;float: none;">
                        <input type="radio" name="book[init]" value="0" title="Tắt"<?php if($zyz['book']['init'] == 0) echo ' checked';?>>
                        <input type="radio" name="book[init]" value="1" title="Bật"<?php if($zyz['book']['init'] == 1) echo ' checked';?>>
                    </div>
                </div>
                <div class="layui-form-item w120">
                    <label class="layui-form-label layui-form-required">Số Trang Mỗi Trang:</label>
                    <div class="layui-input-block">
                        <input type="text" name="book[size]" placeholder="Số trang truyện hiển thị mỗi trang" value="<?=$zyz['book']['size']?>" class="layui-input" lay-verify="required" required/>
                    </div>
                </div>
                <div class="layui-form-item w120">
                    <label class="layui-form-label layui-form-required">Tên Miền Ảnh:</label>
                    <div class="layui-input-block">
                        <input type="text" name="book[picurl]" placeholder="Tên miền ảnh, để trống sẽ theo cấu hình đính kèm" value="<?=$zyz['book']['picurl']?>" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-form-item w120">
                    <label class="layui-form-label layui-form-required">Lọc Theo ID Thể Loại:</label>
                    <div class="layui-input-block">
                        <input type="text" name="book[cid]" placeholder="Lọc theo ID thể loại, nhiều ID cách nhau bằng dấu phẩy, ví dụ: 8,9,10" value="<?=$zyz['book']['cid']?>" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-form-item w120">
                    <label class="layui-form-label">Có Phí:</label>
                    <div class="layui-input-inline" style="display: block;width: auto;float: none;">
                        <input lay-filter="mode" type="radio" name="book[pay]" value="0" title="Miễn Phí"<?php if($zyz['book']['pay'] == 0) echo ' checked';?>>
                        <input lay-filter="mode" type="radio" name="book[pay]" value="1" title="Có Phí"<?php if($zyz['book']['pay'] == 1) echo ' checked';?>>
                    </div>
                </div>
                <div class="layui-form-item w120 pay" style="<?php if($zyz['book']['pay'] == 0) echo 'display:none;';?>">
                    <label class="layui-form-label layui-form-required">Khóa Xác Minh:</label>
                    <div class="layui-input-block">
                        <textarea style="min-height:120px;" name="book[token]" placeholder="Khóa xác minh, mỗi dòng một khóa" class="layui-textarea"><?=implode("\n",$zyz['book']['token'])?></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-filter="*" lay-submit>
                            Cập Nhật Thông Tin Cấu Hình
                        </button>
                    </div>
                </div>
                <blockquote class="layui-elem-quote layui-quote-nm">
                    Thông báo:<br>
                    1. Địa chỉ nguồn truyện sáng tác: <?=(is_ssl()?'https://':'http://').Web_Url.Web_Path.(Url_Index_Mode==0?'index.php/':'')?>api/resources/book<br>
                    2. Địa chỉ phân giải truyện sáng tác: <?=(is_ssl()?'https://':'http://').Web_Url.Web_Path.(Url_Index_Mode==0?'index.php/':'')?>api/resources/parsing_book
                </blockquote>
            </div>
        </div>
    </div>
</div>

            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
layui.use(['form'],function() {
    form = layui.form;
    //监听radio
    form.on('radio(mode)', function (data) {
        if(data.value == 1){
            $('.pay').show();
        } else{
            $('.pay').hide();
        }
    });
    form.on('radio(mode2)', function (data) {
        if(data.value == 1){
            $('.bpay').show();
        } else{
            $('.bpay').hide();
        }
    });
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