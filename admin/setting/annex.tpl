<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cấu hình đính kèm</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="<?=Web_Base_Path?>admin/css/style.css">
    <script src="<?=Web_Base_Path?>jquery/jquery.min.js"></script>
    <!-- Hỗ trợ cho IE8/9 để có thể sử dụng truy vấn phương tiện, từ đó tương thích với lưới đường viền -->
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
        <a>Hệ thống cấu hình</a>
        <a><cite>Cấu hình đính kèm</cite></a>
    </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="Làm mới"><i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>

<div class="layui-fluid">
    <div class="layui-card">
        <form class="layui-form" action="<?=links('setting','annex_save')?>">
            <div class="layui-card-body">
                <div class="layui-tab layui-tab-brief" lay-filter="setting">
                    <ul class="layui-tab-title">
    <li class="layui-this">Cấu hình cơ bản</li>
    <li> Cấu hình Watermark</li>
</ul>

                    <div class="layui-tab-content">
                        <div class="layui-tab-item layui-show">
                            <div class="layui-text" style="max-width: 700px;padding-top: 25px;">
                                <div class="layui-form-item w120">
    <label class="layui-form-label layui-form-required">Thư mục lưu trữ đính kèm:</label>
    <div class="layui-input-block">
        <input type="text" name="Annex_Dir" placeholder="Thư mục lưu trữ đính kèm: tương đối với thư mục gốc của trang web" value="<?=Annex_Dir?>" class="layui-input" lay-verify="required" required/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label layui-form-required">Định dạng đường dẫn đính kèm:</label>
    <div class="layui-input-block">
        <input type="text" name="Annex_Path" placeholder="Định dạng đường dẫn đính kèm, có thể sử dụng năm, tháng, ngày" value="<?=Annex_Path?>" class="layui-input" lay-verify="required" required/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label layui-form-required">Loại đính kèm hỗ trợ:</label>
    <div class="layui-input-block">
        <input type="text" name="Annex_Ext" placeholder="Phân cách bằng dấu “|” (BMP và GIF không thể thêm watermark)" value="<?=Annex_Ext?>" class="layui-input" lay-verify="required" required/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label layui-form-required">Kích thước tối đa của đính kèm:</label>
    <div class="layui-input-block">
        <input type="number" name="Annex_Size" placeholder="Kích thước tối đa của mỗi ảnh, đơn vị là kilobytes" value="<?=Annex_Size?>" class="layui-input" lay-verify="required" required/>
    </div>
</div>

                                <div class="layui-form-item w120">
    <label class="layui-form-label">Phương thức lưu trữ đính kèm:</label>
    <div class="layui-input-inline" style="display: block;width: auto;float: none;">
        <input lay-filter="mode" type="radio" name="Annex_Mode" value="0" title="Lưu trữ trong trang web"<?php if(Annex_Mode == 0) echo ' checked';?>>
        <input lay-filter="mode" type="radio" name="Annex_Mode" value="1" title="Lưu trữ qua FTP"<?php if(Annex_Mode == 1) echo ' checked';?>>
        <input lay-filter="mode" type="radio" name="Annex_Mode" value="2" title="Lưu trữ trên Alibaba Cloud OSS"<?php if(Annex_Mode == 2) echo ' checked';?>>
        <input lay-filter="mode" type="radio" name="Annex_Mode" value="3" title="Lưu trữ trên Qiniu Cloud"<?php if(Annex_Mode == 3) echo ' checked';?>>
        <input lay-filter="mode" type="radio" name="Annex_Mode" value="4" title="Lưu trữ trên Upyun Cloud"<?php if(Annex_Mode == 4) echo ' checked';?>>
    </div>
</div>

                                <div id="mode1"<?php if(Annex_Mode != 1) echo ' style="display: none;"';?>>
                                    <div class="layui-form-item w120">
    <label class="layui-form-label">Máy chủ FTP:</label>
    <div class="layui-input-block">
        <input type="text" name="Annex_Ftp_Host" placeholder="Địa chỉ máy chủ FTP" value="<?=Annex_Ftp_Host?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Cổng FTP:</label>
    <div class="layui-input-block">
        <input type="text" name="Annex_Ftp_Port" placeholder="Cổng FTP, thường là 21" value="<?=Annex_Ftp_Port?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Tài khoản FTP:</label>
    <div class="layui-input-block">
        <input type="text" name="Annex_Ftp_User" placeholder="Tài khoản đăng nhập FTP" value="<?=Annex_Ftp_User?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Mật khẩu FTP:</label>
    <div class="layui-input-block">
        <input type="text" name="Annex_Ftp_Pass" placeholder="Mật khẩu đăng nhập FTP" value="<?=get_pass(Annex_Ftp_Pass)?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Thư mục lưu trữ trên FTP:</label>
    <div class="layui-input-block">
        <input type="text" name="Annex_Ftp_Dir" placeholder="Thư mục lưu trữ trên FTP, để trống là thư mục gốc" value="<?=Annex_Ftp_Dir?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Địa chỉ truy cập FTP:</label>
    <div class="layui-input-block">
        <input type="text" name="Annex_Ftp_Url" placeholder="Địa chỉ truy cập FTP, bắt đầu bằng http://" value="<?=Annex_Ftp_Url?>" class="layui-input"/>
    </div>
</div>

                                </div>
                                <div id="mode2"<?php if(Annex_Mode != 2) echo ' style="display: none;"';?>>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Tên Bucket:</label>
        <div class="layui-input-block">
            <input type="text" name="Annex_Oss_Bucket" placeholder="BUCKET bạn đã tạo trên Alibaba Cloud" value="<?=Annex_Oss_Bucket?>" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">ACCESS_ID:</label>
        <div class="layui-input-block">
            <input type="text" name="Annex_Oss_Aid" placeholder="ACCESS_ID của bạn trên Alibaba Cloud" value="<?=Annex_Oss_Aid?>" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">ACCESS_KEY:</label>
        <div class="layui-input-block">
            <input type="text" name="Annex_Oss_Key" placeholder="ACCESS_KEY của bạn trên Alibaba Cloud" value="<?=Annex_Oss_Key?>" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Địa chỉ EndPoint:</label>
        <div class="layui-input-block">
            <input type="text" name="Annex_Oss_End" placeholder="Địa chỉ EndPoint của bạn" value="<?=Annex_Oss_End?>" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Địa chỉ truy cập Oss:</label>
        <div class="layui-input-block">
            <input type="text" name="Annex_Oss_Url" placeholder="Địa chỉ truy cập tên miền Bucket của bạn" value="<?=Annex_Oss_Url?>" class="layui-input"/>
        </div>
    </div>
</div>

                                <div id="mode3"<?php if(Annex_Mode != 3) echo ' style="display: none;"';?>>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Tên Không gian Qiniu:</label>
        <div class="layui-input-block">
            <input type="text" name="Annex_Qniu_Name" placeholder="Tên Không gian bạn đã tạo trên Qiniu" value="<?=Annex_Qniu_Name?>" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">AccessKey:</label>
        <div class="layui-input-block">
            <input type="text" name="Annex_Qniu_Ak" placeholder="AccessKey của bạn trên Qiniu" value="<?=Annex_Qniu_Ak?>" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">SecretKey:</label>
        <div class="layui-input-block">
            <input type="text" name="Annex_Qniu_Sk" placeholder="SecretKey của bạn trên Qiniu" value="<?=Annex_Qniu_Sk?>" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Địa chỉ truy cập Qiniu:</label>
        <div class="layui-input-block">
            <input type="text" name="Annex_Qniu_Url" placeholder="Địa chỉ truy cập tên miền của bạn trên Qiniu" value="<?=Annex_Qniu_Url?>" class="layui-input"/>
        </div>
    </div>
</div>

                                <div id="mode4"<?php if(Annex_Mode != 4) echo ' style="display: none;"';?>>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Tên Không gian Upyun:</label>
        <div class="layui-input-block">
            <input type="text" name="Annex_Up_Name" placeholder="Tên Không gian Upyun" value="<?=Annex_Up_Name?>" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Tài khoản Upyun:</label>
        <div class="layui-input-block">
            <input type="text" name="Annex_Up_User" placeholder="Tài khoản ủy quyền Upyun" value="<?=Annex_Up_User?>" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Mật khẩu Upyun:</label>
        <div class="layui-input-block">
            <input type="text" name="Annex_Up_Pass" placeholder="Mật khẩu ủy quyền Upyun" value="<?=Annex_Up_Pass?>" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Địa chỉ truy cập Upyun:</label>
        <div class="layui-input-block">
            <input type="text" name="Annex_Up_Url" placeholder="Địa chỉ truy cập tên miền của bạn trên Upyun" value="<?=Annex_Up_Url?>" class="layui-input"/>
        </div>
    </div>
</div>

                                <div id="mode0"<?php if(Annex_Mode == 0) echo ' style="display: none;"';?>>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Giữ ảnh trong trang web:</label>
        <div class="layui-input-inline" style="display: block;width: auto;float: none;">
            <input type="radio" name="Annex_Pic_Del" value="0" title="Xóa"<?php if(Annex_Pic_Del == 0) echo ' checked';?>>
            <input type="radio" name="Annex_Pic_Del" value="1" title="Giữ"<?php if(Annex_Pic_Del == 1) echo ' checked';?>>
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
                            <div class="layui-text" style="max-width: 700px;padding-top: 25px;">
                                <div class="layui-form-item w120">
    <label class="layui-form-label">Loại Watermark:</label>
    <div class="layui-input-inline" style="display: block;width: auto;float: none;">
        <input lay-filter="pic" type="radio" name="Img_Type" value="" title="Tắt Watermark"<?php if(Img_Type == '') echo ' checked';?>>
        <input lay-filter="pic" type="radio" name="Img_Type" value="text" title="Watermark văn bản"<?php if(Img_Type == 'text') echo ' checked';?>>
        <input lay-filter="pic" type="radio" name="Img_Type" value="overlay" title="Watermark hình ảnh"<?php if(Img_Type == 'overlay') echo ' checked';?>>
    </div>
</div>
<div id="pic0"<?php if(Img_Type == '') echo ' style="display: none;"';?>>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Watermark Padding:</label>
        <div class="layui-input-block">
            <input type="number" name="Img_Padding" placeholder="Padding, tính bằng pixel, là khoảng cách giữa Watermark và mép ảnh" value="<?=Img_Padding?>" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Vị trí Watermark theo chiều dọc:</label>
        <div class="layui-input-block">
            <input type="radio" name="Img_Vrt" value="top" title="Trên cùng"<?php if(Img_Vrt == 'top') echo ' checked';?>>
            <input type="radio" name="Img_Vrt" value="middle" title="Giữa"<?php if(Img_Vrt == 'middle') echo ' checked';?>>
            <input type="radio" name="Img_Vrt" value="bottom" title="Dưới cùng"<?php if(Img_Vrt == 'bottom') echo ' checked';?>>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Độ lệch theo chiều dọc:</label>
        <div class="layui-input-block">
            <input type="number" name="Img_Vrt_Offset" placeholder="Độ lệch theo chiều dọc (tính bằng pixel)" value="<?=Img_Vrt_Offset?>" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Vị trí Watermark theo chiều ngang:</label>
        <div class="layui-input-block">
            <input type="radio" name="Img_Hor" value="left" title="Bên trái"<?php if(Img_Hor == 'left') echo ' checked';?>>
            <input type="radio" name="Img_Hor" value="center" title="Giữa"<?php if(Img_Hor == 'center') echo ' checked';?>>
            <input type="radio" name="Img_Hor" value="right" title="Bên phải"<?php if(Img_Hor == 'right') echo ' checked';?>>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Độ lệch theo chiều ngang:</label>
        <div class="layui-input-block">
            <input type="number" name="Img_Hor_Offset" placeholder="Độ lệch theo chiều ngang (tính bằng pixel)" value="<?=Img_Hor_Offset?>" class="layui-input"/>
        </div>
    </div>
</div>

                                <div id="pic1"<?php if(Img_Type != 'text') echo ' style="display: none;"';?>>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Nội dung Watermark văn bản:</label>
        <div class="layui-input-block">
            <input type="text" name="Img_Text_Txt" placeholder="Nội dung Watermark văn bản" value="<?=Img_Text_Txt?>" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Đường dẫn Font chữ Watermark:</label>
        <div class="layui-input-block">
            <input type="text" name="Img_Text_Ttf" placeholder="Đường dẫn Font chữ định dạng TTF, để trống hệ thống sẽ sử dụng Font chữ GD nguyên bản" value="<?=Img_Text_Ttf?>" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Kích thước Font chữ Watermark:</label>
        <div class="layui-input-block">
            <input type="number" name="Img_Text_Size" placeholder="Kích thước Font chữ mặc định từ 1-5, Font chữ TTF có thể sử dụng bất kỳ kích thước hợp lệ nào" value="<?=Img_Text_Size?>" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Màu sắc Font chữ Watermark:</label>
        <div class="layui-input-inline">
            <input id="color-input1" type="text" name="Img_Text_Color" placeholder="Màu sắc Font chữ, giá trị hex 6 chữ số như: 993300" value="<?=Img_Text_Color?>" class="layui-input"/>
        </div>
        <div class="layui-inline" style="left:-11px;">
            <div id="color-form1"></div>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Màu sắc bóng đổ của Font chữ Watermark:</label>
        <div class="layui-input-inline">
            <input id="color-input2" type="text" name="Img_Text_Shadow_Color" placeholder="Màu sắc bóng đổ, giá trị hex 6 chữ số như: 993300, để trống sẽ tắt bóng đổ" value="<?=Img_Text_Shadow_Color?>" class="layui-input"/>
        </div>
        <div class="layui-inline" style="left:-11px;">
            <div id="color-form2"></div>
        </div>
    </div>
</div>

                                <div id="pic2"<?php if(Img_Type != 'overlay') echo ' style="display: none;"';?>>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Đường dẫn ảnh Watermark:</label>
        <div class="layui-input-block">
            <input type="text" name="Img_Pic_Path" placeholder="Đường dẫn ảnh Watermark trên máy chủ, mặc định là ./packs/watermark.png" value="<?=Img_Pic_Path?>" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Độ trong suốt của ảnh Watermark:</label>
        <div class="layui-input-block">
            <input type="number" name="Img_Pic_Opacity" placeholder="Độ trong suốt của ảnh, điều này sẽ làm cho Watermark trở nên mờ, không che phủ ảnh gốc dưới, thường được đặt là 50" value="<?=Img_Pic_Opacity?>" class="layui-input"/>
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
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
layui.use(['form','colorpicker'],function() {
    var form = layui.form,colorpicker = layui.colorpicker;
    //颜色选择
    colorpicker.render({
        elem: '#color-form1',
        color: '#<?=Img_Text_Color?>',
        done: function(color){
            $('#color-input1').val(color.replace('#',''));
        }
    });
    colorpicker.render({
        elem: '#color-form2',
        color: '#<?=Img_Text_Shadow_Color?>',
        done: function(color){
            $('#color-input2').val(color.replace('#',''));
        }
    });
    //监听radio
    form.on('radio(mode)', function (data) {
        for (var i = 1; i < 5; i++) {
            if(data.value == i){
                $('#mode'+i).show();
            }else{
                $('#mode'+i).hide();
            }
        }
        if(data.value == 0){
            $('#mode0').hide();
        }else{
            $('#mode0').show();
        }
    });
    form.on('radio(pic)', function (data) {
        if(data.value == 'overlay'){
            $('#pic0').show();
            $('#pic1').hide();
            $('#pic2').show();
        } else if(data.value == 'text'){
            $('#pic0').show();
            $('#pic1').show();
            $('#pic2').hide();
        } else {
            $('#pic0').hide();
            $('#pic1').hide();
            $('#pic2').hide();
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