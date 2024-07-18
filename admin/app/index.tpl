<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cấu hình Ứng dụng</title>
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

<body>
<div class="breadcrumb-nav">
    <span class="layui-breadcrumb">
        <a>Quản lý Ứng dụng</a>
        <a><cite>Cấu hình Ứng dụng</cite></a>
    </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="Làm mới"><i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>

<div class="layui-fluid">
    <div class="layui-card">
        <form class="layui-form" action="<?=links('app','setting')?>">
            <div class="layui-card-body">
                <div class="layui-tab layui-tab-brief" lay-filter="setting">
                    <ul class="layui-tab-title">
    <li lay-id="t1" class="layui-this">Cập nhật Cấu hình</li>
    <li lay-id="t2">Cấu hình Nạp tiền</li>
    <li lay-id="t3">Từ khóa Tìm kiếm Nổi bật</li>
    <li lay-id="t4">Thỏa thuận Người dùng</li>
    <li lay-id="t5">Chính sách Bảo mật</li>
</ul>

                    <div class="layui-tab-content">
                        <div class="layui-tab-item layui-show">
                            <div class="layui-text" style="max-width: 700px;padding-top: 25px;">
                                <div class="layui-collapse" lay-accordion="">
                                    <div class="layui-colla-item">
    <h2 class="layui-colla-title" style="font-size:14px;">Khóa API Toàn cầu của Ứng dụng</h2>
    <div class="layui-colla-content layui-show">
        <div class="layui-form-item w120">
            <label class="layui-form-label layui-form-required">Khóa API:</label>
            <div class="layui-input-block">
                <input type="text" name="apikey" placeholder="Khóa API, để trống để tắt" value="<?=$app['apikey']?>" class="layui-input"/>
            </div>
        </div>
    </div>
</div>
<div class="layui-colla-item">
    <h2 class="layui-colla-title" style="font-size:14px;">Cấu hình Phiên bản Android</h2>
    <div class="layui-colla-content layui-show">
        <div class="layui-form-item w120">
            <label class="layui-form-label layui-form-required">Số phiên bản mới nhất:</label>
            <div class="layui-input-block">
                <input type="text" name="update[android][version]" placeholder="Số phiên bản mới nhất, ví dụ: 1.0.5" value="<?=$app['update']['android']['version']?>" class="layui-input" lay-verify="required" required/>
            </div>
        </div>
        <div class="layui-form-item w120">
            <label class="layui-form-label layui-form-required">Đường dẫn tải xuống:</label>
            <div class="layui-input-block">
                <input type="text" name="update[android][downurl]" placeholder="Đường dẫn tải xuống file APK cho Android" value="<?=$app['update']['android']['downurl']?>" class="layui-input"/>
            </div>
        </div>
        <div class="layui-form-item w120">
            <label class="layui-form-label">Bắt buộc cập nhật:</label>
            <div class="layui-input-inline" style="display: block;width: auto;float: none;">
                <input lay-filter="none" xs="no" type="radio" name="update[android][force]" value="1" title="Bật"<?php if($app['update']['android']['force'] == 1) echo ' checked';?>>
                <input lay-filter="none" xs="yes" type="radio" name="update[android][force]" value="0" title="Tắt"<?php if($app['update']['android']['force'] == 0) echo ' checked';?>>
            </div>
        </div>
        <div class="layui-form-item w120">
            <label class="layui-form-label">Nội dung cập nhật:</label>
            <div class="layui-input-block">
                <textarea style="min-height:120px;" name="update[android][text]" placeholder="Nội dung cập nhật phiên bản mới" class="layui-textarea"><?=$app['update']['android']['text']?></textarea>
            </div>
        </div>
    </div>
</div>

                                    <div class="layui-colla-item">
    <h2 class="layui-colla-title" style="font-size:14px;">Cấu hình Phiên bản IOS</h2>
    <div class="layui-colla-content layui-show">
        <div class="layui-form-item w120">
            <label class="layui-form-label layui-form-required">Số phiên bản mới nhất:</label>
            <div class="layui-input-block">
                <input type="text" name="update[ios][version]" placeholder="Số phiên bản mới nhất, ví dụ: 1.0.5" value="<?=$app['update']['ios']['version']?>" class="layui-input" lay-verify="required" required/>
            </div>
        </div>
        <div class="layui-form-item w120">
            <label class="layui-form-label layui-form-required">Đường dẫn tải xuống:</label>
            <div class="layui-input-block">
                <input type="text" name="update[ios][downurl]" placeholder="Đường dẫn tải xuống từ App Store" value="<?=$app['update']['ios']['downurl']?>" class="layui-input"/>
            </div>
        </div>
        <div class="layui-form-item w120">
            <label class="layui-form-label">Bắt buộc cập nhật:</label>
            <div class="layui-input-inline" style="display: block;width: auto;float: none;">
                <input lay-filter="none" xs="no" type="radio" name="update[ios][force]" value="1" title="Bật"<?php if($app['update']['ios']['force'] == 1) echo ' checked';?>>
                <input lay-filter="none" xs="yes" type="radio" name="update[ios][force]" value="0" title="Tắt"<?php if($app['update']['ios']['force'] == 0) echo ' checked';?>>
            </div>
        </div>
        <div class="layui-form-item w120">
            <label class="layui-form-label">Nội dung cập nhật:</label>
            <div class="layui-input-block">
                <textarea style="min-height:120px;" name="update[ios][text]" placeholder="Nội dung cập nhật phiên bản mới" class="layui-textarea"><?=$app['update']['ios']['text']?></textarea>
            </div>
        </div>
    </div>
</div>

                                </div>
                                <div class="layui-form-item w120" style="margin-top:10px;">
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
                                <div class="layui-collapse" lay-accordion="">
    <div class="layui-colla-item">
        <h2 class="layui-colla-title" style="font-size:14px;">Gói Nạp VIP</h2>
        <div class="layui-colla-content layui-show">
            <div class="layui-form-item w120">
                <?php foreach($app['pay']['vip'] as $i=>$row){ ?>
                    <div class="layui-col-xs6 layui-col-md6" style="margin-bottom:10px;">
                        <label class="layui-form-label">Số ngày:</label>
                        <div class="layui-input-block">
                            <input type="number" name="pay[vip][<?=$i?>][day]" placeholder="Số ngày VIP" value="<?=$row['day']?>" class="layui-input" lay-verify="required" required/>
                        </div>
                    </div>
                    <div class="layui-col-xs6 layui-col-md6" style="margin-bottom:10px;">
                        <label class="layui-form-label">Giá:</label>
                        <div class="layui-input-block">
                            <input type="number" name="pay[vip][<?=$i?>][rmb]" placeholder="Số tiền cần" value="<?=$row['rmb']?>" class="layui-input" lay-verify="required" required/>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>
    </div>
    <div class="layui-colla-item">
        <h2 class="layui-colla-title" style="font-size:14px;"><?=Pay_Cion_Name?> Nạp Tiền Gói</h2>
        <div class="layui-colla-content layui-show">
            <div class="layui-form-item w120">
                <?php foreach($app['pay']['cion'] as $i=>$row){ ?>
                    <div class="layui-col-xs6 layui-col-md6" style="margin-bottom:10px;">
                        <label class="layui-form-label"><?=Pay_Cion_Name?>:</label>
                        <div class="layui-input-block">
                            <input type="number" name="pay[cion][<?=$i?>][cion]" placeholder="Số lượng <?=Pay_Cion_Name?>" value="<?=$row['cion']?>" class="layui-input" lay-verify="required" required/>
                        </div>
                    </div>
                    <div class="layui-col-xs6 layui-col-md6" style="margin-bottom:10px;">
                        <label class="layui-form-label">Giá:</label>
                        <div class="layui-input-block">
                            <input type="number" name="pay[cion][<?=$i?>][rmb]" placeholder="Số tiền cần" value="<?=$row['rmb']?>" class="layui-input" lay-verify="required" required/>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>
    </div>
    <div class="layui-colla-item">
        <h2 class="layui-colla-title" style="font-size:14px;">Gói Nạp Thẻ Tháng</h2>
        <div class="layui-colla-content layui-show">
            <div class="layui-form-item w120">
                <?php foreach($app['pay']['ticket'] as $i=>$row){ ?>
                    <div class="layui-col-xs6 layui-col-md6" style="margin-bottom:10px;">
                        <label class="layui-form-label">Số lượng:</label>
                        <div class="layui-input-block">
                            <input type="number" name="pay[ticket][<?=$i?>][nums]" placeholder="Số lượng thẻ tháng" value="<?=$row['nums']?>" class="layui-input" lay-verify="required" required/>
                        </div>
                    </div>
                    <div class="layui-col-xs6 layui-col-md6" style="margin-bottom:10px;">
                        <label class="layui-form-label">Giá:</label>
                        <div class="layui-input-block">
                            <input type="number" name="pay[ticket][<?=$i?>][rmb]" placeholder="Số tiền cần" value="<?=$row['rmb']?>" class="layui-input" lay-verify="required" required/>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>
    </div>
</div>

                                <div class="layui-form-item w120" style="margin-top:10px;">
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
            <label class="layui-form-label">Từ khóa Hot Manga:</label>
            <div class="layui-input-block">
                <textarea style="min-height:120px;" name="search" placeholder="Từ khóa Hot Manga, nhiều từ khóa cách nhau bởi dấu |" class="layui-textarea"><?=implode('|', $app['search'])?></textarea>
            </div>
        </div>
        <div class="layui-form-item w120">
            <label class="layui-form-label">Từ khóa Hot Tiểu thuyết:</label>
            <div class="layui-input-block">
                <textarea style="min-height:120px;" name="book_search" placeholder="Từ khóa Hot Tiểu thuyết, nhiều từ khóa cách nhau bởi dấu |" class="layui-textarea"><?=implode('|', $app['book_search'])?></textarea>
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
    <div class="layui-text" style="padding-top: 25px;">
        <div class="layui-form-item w120">
            <label class="layui-form-label">Thỏa thuận Người dùng:</label>
            <div class="layui-input-block">
                <textarea lay-verify="editor1" id="editor1" name="html[agreement]" placeholder="Thỏa thuận Người dùng" class="layui-textarea"><?=$app['html']['agreement']?></textarea>
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
            <label class="layui-form-label layui-form-required">Chính sách Bảo mật:</label>
            <div class="layui-input-block">
                <div class="layui-input-inline" style="display: block;width: auto;float: none;">
                    <textarea lay-verify="editor2" id="editor2" name="html[privacy]" placeholder="Chính sách Bảo mật" class="layui-textarea"><?=$app['html']['privacy']?></textarea>
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
layui.use(['layedit', 'layer', 'form'], function () {
    var layedit = layui.layedit,
        form = layui.form,
        layer = layui.layer;
    layedit.set({
        tool: [
            'html', 'code', 'strong', 'italic', 'underline', 'del', 'addhr', '|', 'fontFomatt', 'colorpicker', 'face'
            , '|', 'left', 'center', 'right', '|', 'link', 'unlink', 'anchors'
            , '|','table', 'fullScreen'
        ]
        ,height: '500px'
    });
    var editor1 = layedit.build('editor1');
    var editor2 = layedit.build('editor2');
    form.verify({
        editor1: function(value) {
            layedit.sync(editor1);
        },
        editor2: function(value) {
            layedit.sync(editor2);
        }
    });
    var tps = '';
    $('.layui-input,.layui-textarea').click(function(){
        if($(this).attr('placeholder') != tps){
            tps = $(this).attr('placeholder');
            layer.tips(tps, $(this),{tips:1});    
        }
    });
})
</script>
</body>
</html>