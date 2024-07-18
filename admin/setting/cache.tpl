<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cấu hình Bộ đệm</title>
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
        <a><cite>Cấu hình Bộ đệm</cite></a>
    </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="Làm mới"><i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>

<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-body">
            <form class="layui-form" action="<?=links('setting','cache_save')?>" style="padding-top: 20px;max-width: 700px;">
                <div class="layui-form-item w120">
    <label class="layui-form-label">Phương thức Lưu trữ Bộ đệm:</label>
    <div class="layui-input-inline" style="display: block;width: auto;float: none;">
        <input lay-filter="mode" type="radio" name="Cache_Mode" value="0" title="Tắt Bộ đệm"<?php if(Cache_Mode == 0) echo ' checked';?>>
        <input lay-filter="mode" type="radio" name="Cache_Mode" value="1" title="Bộ đệm File"<?php if(Cache_Mode == 1) echo ' checked';?>>
        <input lay-filter="mode" type="radio" name="Cache_Mode" value="2" title="Memcache"<?php if(Cache_Mode == 2) echo ' checked';?>>
        <input lay-filter="mode" type="radio" name="Cache_Mode" value="3" title="Redis"<?php if(Cache_Mode == 3) echo ' checked';?>>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label layui-form-required">Ký tự An toàn Bộ đệm:</label>
    <div class="layui-input-block">
        <input id="rand" type="text" name="Cache_Rand" placeholder="Khi sử dụng Memcache, Redis trên nhiều website cùng một máy chủ, cần phải phân biệt" value="<?=Cache_Rand?>" class="layui-input" lay-verify="required" required/>
        <div class="layui-btn layui-btn-danger" onclick="Admin.get_rand('rand');" style="position: absolute;top: 0px;right: 0;">Tạo ngẫu nhiên</div>
    </div>
</div>
<div id="Memcache"<?php if(Cache_Mode != 2) echo ' style="display: none;"';?>>
    <div class="layui-form-item w120">
        <label class="layui-form-label layui-form-required">Máy chủ Memcache:</label>
        <div class="layui-input-block">
            <input id="mem_ip" type="text" name="Cache_Mem_Ip" placeholder="Thường là: 127.0.0.1" value="<?=Cache_Mem_Ip?>" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label layui-form-required">Cổng Memcache:</label>
        <div class="layui-input-block">
            <input id="mem_port" type="text" name="Cache_Mem_Port" placeholder="Cổng Memcache thường là: 11211" value="<?=Cache_Mem_Port?>" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Mật khẩu Memcache:</label>
        <div class="layui-input-block">
            <input id="mem_pass id="mem_ip"" type="text" name="Cache_Mem_Pass" placeholder="Để trống nếu không có mật khẩu" value="<?=Cache_Mem_Pass?>" class="layui-input"/>
            <div class="layui-btn layui-btn-normal" onclick="get_cache(2);" style="position: absolute;top: 0px;right: 0;">Kiểm tra kết nối</div>
        </div>
    </div>
</div>

                <div id="Redis"<?php if(Cache_Mode != 3) echo ' style="display: none;"';?>>
    <div class="layui-form-item w120">
        <label class="layui-form-label layui-form-required">Máy chủ Redis Bộ đệm:</label>
        <div class="layui-input-block">
            <input id="reads_ip" type="text" name="Cache_Redis_Ip" placeholder="Máy chủ Bộ đệm thường là: 127.0.0.1" value="<?=Cache_Redis_Ip?>" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label layui-form-required">Cổng Redis Bộ đệm:</label>
        <div class="layui-input-block">
            <input id="reads_port" type="text" name="Cache_Redis_Port" placeholder="Cổng Bộ đệm Redis thường là: 6379" value="<?=Cache_Redis_Port?>" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Mật khẩu Redis Bộ đệm:</label>
        <div class="layui-input-block">
            <input id="reads_pass" type="text" name="Cache_Redis_Pass" placeholder="Để trống nếu không có mật khẩu" value="<?=Cache_Mem_Pass?>" class="layui-input"/>
            <div class="layui-btn layui-btn-normal" onclick="get_cache(3);" style="position: absolute;top: 0px;right: 0;">Kiểm tra kết nối</div>
        </div>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label layui-form-required">Thời gian Bộ đệm Trang chủ:</label>
    <div class="layui-input-block">
        <input type="text" name="Cache_Time_Index" placeholder="Đơn vị giây, khi dữ liệu cập nhật, dữ liệu Bộ đệm sẽ được đồng bộ, 0 không Bộ đệm." value="<?=Cache_Time_Index?>" class="layui-input" lay-verify="number" required/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label layui-form-required">Thời gian Bộ đệm Trang danh sách:</label>
    <div class="layui-input-block">
        <input type="text" name="Cache_Time_List" placeholder="Đơn vị giây, khi dữ liệu cập nhật, dữ liệu Bộ đệm sẽ được đồng bộ, 0 không Bộ đệm." value="<?=Cache_Time_List?>" class="layui-input" lay-verify="number" required/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label layui-form-required">Thời gian Bộ đệm Trang nội dung:</label>
    <div class="layui-input-block">
        <input type="text" name="Cache_Time_Show" placeholder="Đơn vị giây, khi dữ liệu cập nhật, dữ liệu Bộ đệm sẽ được đồng bộ, 0 không Bộ đệm." value="<?=Cache_Time_Show?>" class="layui-input" lay-verify="number" required/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label layui-form-required">Thời gian Bộ đệm Trang chương:</label>
    <div class="layui-input-block">
        <input type="text" name="Cache_Time_Pic" placeholder="Đơn vị giây, khi dữ liệu cập nhật, dữ liệu Bộ đệm sẽ được đồng bộ, 0 không Bộ đệm." value="<?=Cache_Time_Pic?>" class="layui-input" lay-verify="number" required/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label layui-form-required">Thời gian Bộ đệm Trang khác:</label>
    <div class="layui-input-block">
        <input type="text" name="Cache_Time" placeholder="Đơn vị giây, khi dữ liệu cập nhật, dữ liệu Bộ đệm sẽ được đồng bộ, 0 không Bộ đệm." value="<?=Cache_Time?>" class="layui-input" lay-verify="number" required/>
    </div>
</div>
<div class="layui-form-item">
    <div class="layui-input-block">
        <button class="layui-btn" lay-filter="*" lay-submit>
            Cập nhật thông tin cấu hình
        </button>
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
        if(data.value == 2){
            $('#Memcache').show();
            $('#Redis').hide();
        } else if(data.value == 3){
            $('#Redis').show();
            $('#Memcache').hide();
        } else{
            $('#Memcache').hide();
            $('#Redis').hide();
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
function get_cache(sign){
    var index = layer.load();
    if(sign == 2){
        var ip = $('#mem_ip').val();
        var port = $('#mem_port').val();
        var pass = $('#mem_pass').val();
    }else{
        var ip = $('#reads_ip').val();
        var port = $('#reads_port').val();
        var pass = $('#reads_pass').val(); 
    }
    $.post('<?=links('ajax','caches')?>', {'id':sign,'ip':ip,'port':port,'pass':pass}, function(res) {
        layer.close(index);
        if(res.code == 1){
            layer.msg(res.msg,{icon: 1});
        }else{
            layer.msg(res.msg,{icon: 2});
        }
    },'json');
}
</script>
</body>
</html>