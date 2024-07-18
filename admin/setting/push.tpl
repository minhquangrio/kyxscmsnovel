<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cấu hình đẩy thông báo</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="<?=Web_Base_Path?>admin/css/style.css">
    <script src="<?=Web_Base_Path?>jquery/jquery.min.js"></script>
    <!-- Hỗ trợ trình duyệt IE8/9 để tương thích với truy vấn phương tiện và lưới hệ thống -->
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
        <a>Cấu hình hệ thống</a>
        <a><cite>URL Đẩy thông báo</cite></a>
    </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="Làm mới"><i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>

<div class="layui-fluid">
    <div class="layui-card">
        <form class="layui-form" action="<?=links('setting','push_save')?>">
            <div class="layui-card-body">
                <div class="layui-tab layui-tab-brief" lay-filter="setting">
                    <ul class="layui-tab-title">
    <li class="layui-this">Cấu hình Đẩy thông báo</li>
    <li>Đẩy thông báo qua URL</li>
</ul>

                    <div class="layui-tab-content">
                        <div class="layui-tab-item layui-show">
                            <div class="layui-text laytps" style="max-width: 700px;padding-top: 25px;">
                                <div class="layui-form-item w120">
    <label class="layui-form-label">Token Baidu Push:</label>
    <div class="layui-input-block">
        <input type="text" name="Push_Bd_Token" placeholder="Giá trị token được phân phối cho kết nối Baidu Push" value="<?=Push_Bd_Token?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Appid Xuanzhao:</label>
    <div class="layui-input-block">
        <input type="text" name="Push_Xz_Appid" placeholder="Giá trị appid được phân phối cho Xuanzhao" value="<?=Push_Xz_Appid?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Token Xuanzhao:</label>
    <div class="layui-input-block">
        <input type="text" name="Push_Xz_Token" placeholder="Giá trị Token được phân phối cho Xuanzhao" value="<?=Push_Xz_Token?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Tài khoản đăng nhập Shenma:</label>
    <div class="layui-input-block">
        <input type="text" name="Push_Sm_User" placeholder="Tài khoản đăng nhập trên nền tảng quản trị webmaster của Shenma, thường là địa chỉ email" value="<?=Push_Sm_User?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Token Push Shenma:</label>
    <div class="layui-input-block">
        <input type="text" name="Push_Sm_Token" placeholder="Giá trị Token được phân phối cho Push Shenma" value="<?=Push_Sm_Token?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Domain Push:</label>
    <div class="layui-input-block">
        <input type="text" name="Push_Host" placeholder="Để trống để tự động đẩy thông báo đến domain hiện tại của trang web, domain phải có giao thức như http:// hoặc https://" value="<?=Push_Host?>" class="layui-input"/>
    </div>
</div>

                                <div class="layui-form-item w120">
    <label class="layui-form-label">Phương thức Push:</label>
    <div class="layui-input-block">
        <?php $parr = explode('|', Push_Type);?>
        <input type="checkbox" name="Push_Type[bd]" lay-skin="primary" title="Baidu"<?php if (in_array('bd', $parr)) echo ' checked';?>>
        <input type="checkbox" name="Push_Type[xz]" lay-skin="primary" title="Xuanzhao"<?php if (in_array('xz', $parr)) echo ' checked';?>>
        <input lay-filter="type" type="checkbox" name="Push_Type[sm]" lay-skin="primary" title="Shenma"<?php if (in_array('sm', $parr)) echo ' checked';?>>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Push Dữ liệu Thêm mới:</label>
    <div class="layui-input-inline" style="display: block;width: auto;float: none;">
        <input type="radio" name="Push_Add_Mode" value="0" title="Mở"<?php if (Push_Add_Mode == 0) echo ' checked';?>>
        <input type="radio" name="Push_Add_Mode" value="1" title="Đóng"<?php if (Push_Add_Mode == 1) echo ' checked';?>>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Push Dữ liệu Thu thập:</label>
    <div class="layui-input-inline" style="display: block;width: auto;float: none;">
        <input type="radio" name="Push_Cj_Mode" value="0" title="Mở"<?php if (Push_Cj_Mode == 0) echo ' checked';?>>
        <input type="radio" name="Push_Cj_Mode" value="1" title="Đóng"<?php if (Push_Cj_Mode == 1) echo ' checked';?>>
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
    <label class="layui-form-label">Tự định nghĩa Liên kết Push:</label>
    <div class="layui-input-block">
        <input type="text" name="url" placeholder="Nhập liên kết đầy đủ muốn Push" value="" class="layui-input"/>
        <button style="position: absolute;top: 0px;right: 0;" class="layui-btn" lay-filter="push_zdy" lay-submit>Push</button>
    </div>
</div>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend style="font-size:15px;">Liên kết Manga Push</legend>
</fieldset>

                                <div class="layui-form-item w120">
    <label class="layui-form-label">Liên kết Push theo danh mục:</label>
    <div class="layui-input-inline">
        <select name="cid">
            <option value="0">Tất cả danh mục</option>
            <?php
            $array = $this->mcdb->get_select('class', 'id,name', array('fid' => 0), 'xid ASC', 50);
            foreach ($array as $row) {
                echo '<option value="' . $row['id'] . '">' . $row['name'] . '</option>';
                $array2 = $this->mcdb->get_select('class', 'id,name', array('fid' => $row['id']), 'xid ASC', 50);
                foreach ($array2 as $row2) {
                    echo '<option value="' . $row2['id'] . '">&nbsp;&nbsp;&nbsp;&nbsp;├─&nbsp;' . $row2['name'] . '</option>';
                }
            }
            ?>
        </select>
    </div>
    <div class="layui-inline">
        <button class="layui-btn" lay-filter="push_list" lay-submit>Push</button>
    </div>
</div>

                                <div class="layui-form-item w120">
    <label class="layui-form-label">Liên kết truyện tranh cần đẩy:</label>
    <div class="layui-input-inline">
        <select name="cid2">
            <option value="0">Tất cả các danh mục</option>
            <?php
            $array = $this->mcdb->get_select('class', 'id, name', array('fid' => 0), 'xid ASC', 50);
            foreach ($array as $row) {
                echo '<option value="' . $row['id'] . '">' . $row['name'] . '</option>';
                $array2 = $this->mcdb->get_select('class', 'id, name', array('fid' => $row['id']), 'xid ASC', 50);
                foreach ($array2 as $row2) {
                    echo '<option value="' . $row2['id'] . '">&nbsp;&nbsp;&nbsp;&nbsp;├─&nbsp;' . $row2['name'] . '</option>';
                }
            }
            ?>
        </select>
    </div>
    <div class="layui-input-inline select120">
        <select name="day">
            <option value="1">Cập nhật mỗi 1 giờ</option>
            <option value="2">Cập nhật mỗi 5 giờ</option>
            <option value="3">Cập nhật hôm nay</option>
            <option value="4">Cập nhật hôm qua</option>
            <option value="5">Cập nhật trong tuần</option>
            <option value="6">Cập nhật trong tháng</option>
            <option value="7">Cập nhật trong năm</option>
            <option value="0">Tất cả dữ liệu</option>
        </select>
    </div>
    <div class="layui-inline">
        <button class="layui-btn" lay-filter="push_show" lay-submit>Đẩy</button>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Liên kết chương truyện cần đẩy:</label>
    <div class="layui-input-inline">
        <input type="number" name="mid" placeholder="Nhập ID truyện tranh của chương" value="" class="layui-input" />
    </div>
    <div class="layui-input-inline select120">
        <select name="day2">
            <option value="3">Cập nhật hôm nay</option>
            <option value="1">Cập nhật mỗi 1 giờ</option>
            <option value="2">Cập nhật mỗi 5 giờ</option>
            <option value="4">Cập nhật hôm qua</option>
            <option value="5">Cập nhật trong tuần</option>
            <option value="6">Cập nhật trong tháng</option>
            <option value="7">Cập nhật trong năm</option>
            <option value="0">Tất cả dữ liệu</option>
        </select>
    </div>
    <div class="layui-inline">
        <button class="layui-btn" lay-filter="push_chapter" lay-submit>Đẩy</button>
    </div>
</div>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend style="font-size:15px;">Liên kết tiểu thuyết đẩy</legend>
</fieldset>

                                <div class="layui-form-item w120">
    <label class="layui-form-label">Liên kết đẩy danh mục:</label>
    <div class="layui-input-inline">
        <select name="cid">
            <option value="0">Tất cả các danh mục</option>
            <?php
            $array = $this->mcdb->get_select('book_class', 'id, name', array('fid' => 0), 'xid ASC', 50);
            foreach ($array as $row) {
                echo '<option value="' . $row['id'] . '">' . $row['name'] . '</option>';
                $array2 = $this->mcdb->get_select('book_class', 'id, name', array('fid' => $row['id']), 'xid ASC', 50);
                foreach ($array2 as $row2) {
                    echo '<option value="' . $row2['id'] . '">&nbsp;&nbsp;&nbsp;&nbsp;├─&nbsp;' . $row2['name'] . '</option>';
                }
            }
            ?>
        </select>
    </div>
    <div class="layui-inline">
        <button class="layui-btn" lay-filter="push_blist" lay-submit>Đẩy</button>
    </div>
</div>

                                <div class="layui-form-item w120">
    <label class="layui-form-label">Liên kết đẩy tiểu thuyết:</label>
    <div class="layui-input-inline">
        <select name="cid2">
            <option value="0">Tất cả các danh mục</option>
            <?php
            $array = $this->mcdb->get_select('book_class', 'id, name', array('fid' => 0), 'xid ASC', 50);
            foreach ($array as $row) {
                echo '<option value="' . $row['id'] . '">' . $row['name'] . '</option>';
                $array2 = $this->mcdb->get_select('book_class', 'id, name', array('fid' => $row['id']), 'xid ASC', 50);
                foreach ($array2 as $row2) {
                    echo '<option value="' . $row2['id'] . '">&nbsp;&nbsp;&nbsp;&nbsp;├─&nbsp;' . $row2['name'] . '</option>';
                }
            }
            ?>
        </select>
    </div>
    <div class="layui-input-inline select120">
        <select name="day">
            <option value="1">Cập nhật mỗi 1 giờ</option>
            <option value="2">Cập nhật mỗi 5 giờ</option>
            <option value="3">Cập nhật hôm nay</option>
            <option value="4">Cập nhật hôm qua</option>
            <option value="5">Cập nhật trong tuần</option>
            <option value="6">Cập nhật trong tháng</option>
            <option value="7">Cập nhật trong năm</option>
            <option value="0">Tất cả dữ liệu</option>
        </select>
    </div>
    <div class="layui-inline">
        <button class="layui-btn" lay-filter="push_info" lay-submit>Đẩy</button>
    </div>
</div>

                                <div class="layui-form-item w120">
    <label class="layui-form-label">Liên kết đẩy chương:</label>
    <div class="layui-input-inline">
        <input type="number" name="bid" placeholder="Nhập ID tiểu thuyết của chương" value="" class="layui-input"/>
    </div>
    <div class="layui-input-inline select120">
        <select name="day2">
            <option value="3">Cập nhật hôm nay</option>
            <option value="1">Cập nhật mỗi 1 giờ</option>
            <option value="2">Cập nhật mỗi 5 giờ</option>
            <option value="4">Cập nhật hôm qua</option>
            <option value="5">Cập nhật trong tuần</option>
            <option value="6">Cập nhật trong tháng</option>
            <option value="7">Cập nhật trong năm</option>
            <option value="0">Tất cả dữ liệu</option>
        </select>
    </div>
    <div class="layui-inline">
        <button class="layui-btn" lay-filter="push_read" lay-submit>Đẩy</button>
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
    layui.use(['layer', 'form'], function () {
        var form = layui.form,
            layer = layui.layer;

        // Lựa chọn
        form.on('checkbox(type)', function (r) {
            if(r.elem.checked){
                layer.tips('Mạng lưới push chậm hơn, hãy mở cẩn thận', $(r.elem).parents('div'), {tips: 3});
            }
        });

        var tps = '';
        $('.laytps .layui-input').click(function(){
            if($(this).attr('placeholder') != tps){
                tps = $(this).attr('placeholder');
                layer.tips(tps, $(this), {tips: 1});
            }
        });

        // Đẩy danh mục
        form.on('submit(push_list)', function (data) {
            var field = {ac: 'lists', cid: data.field.cid};
            get_push(field);return false;
        });

        // Đẩy tiểu thuyết
        form.on('submit(push_show)', function (data) {
            var field = {ac: 'show', cid: data.field.cid2, day: data.field.day};
            get_push(field);return false;
        });

        // Đẩy chương
        form.on('submit(push_chapter)', function (data) {
            if(data.field.mid == '' || data.field.mid == '0'){
                layer.msg('Vui lòng nhập ID tiểu thuyết chính xác', {icon: 2});
            } else {
                var field = {ac: 'pic', mid: data.field.mid, day: data.field.day2};
                get_push(field);
            }
            return false;
        });

        // Đẩy liên kết tùy chỉnh
        form.on('submit(push_zdy)', function (data) {
            if(data.field.url == ''){
                layer.msg('Vui lòng nhập đúng địa chỉ liên kết đầy đủ', {icon: 2});
            } else {
                var field = {ac: 'zdy', url: data.field.url};
                get_push(field);
            }
            return false;
        });

        // Đẩy danh mục
        form.on('submit(push_blist)', function (data) {
            var field = {ac: 'lists', cid: data.field.cid};
            get_push(field);return false;
        });

        // Đẩy tiểu thuyết
        form.on('submit(push_info)', function (data) {
            var field = {ac: 'show', cid: data.field.cid2, day: data.field.day};
            get_push(field);return false;
        });

        // Đẩy chương
        form.on('submit(push_read)', function (data) {
            if(data.field.bid == '' || data.field.bid == '0'){
                layer.msg('Vui lòng nhập ID tiểu thuyết chính xác', {icon: 2});
            } else {
                var field = {ac: 'pic', bid: data.field.bid, day: data.field.day2};
                get_push(field);
            }
            return false;
        });
    });

    function get_push(field){
        var index = layer.load();
        $.post('<?=links('ajax','push')?>', field, function(res) {
            layer.close(index);
            if(res.code == 1){
                layer.msg(res.msg, {icon: 1});
            } else {
                layer.msg(res.msg, {icon: 2});
            }
        }, 'json');
        return false;
    }
</script>

</body>
</html>