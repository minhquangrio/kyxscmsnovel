<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chỉnh sửa truyện tranh</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" href="<?=Web_Base_Path?>admin/css/style.css">
<script src="<?=Web_Base_Path?>jquery/jquery.min.js"></script>
<!-- Cho phép IE8/9 hỗ trợ truy vấn phương tiện, để tương thích với lưới -->
<!--[if lt IE 9]>
<script src="<?=Web_Base_Path?>jquery/jquery-1.9.1.min.js"></script>
<script src="<?=Web_Base_Path?>admin/js/html5.min.js"></script>
<script src="<?=Web_Base_Path?>admin/js/respond.min.js"></script>
<![endif]-->
<script src="<?=Web_Base_Path?>layui/layui.js"></script>
<script src="<?=Web_Base_Path?>admin/js/common.js"></script>
<style type="text/css">
.layui-form-item .layui-input-inline{
    width: auto;
    margin-left: 5px;
}
.type-input{
    height:70px;
    overflow-y: auto;
}
.type-input::-webkit-scrollbar {
    /*Kiểu dáng thanh cuộn tổng thể*/
    width : 10px;  /*Chiều cao và chiều rộng tương ứng với kích thước của thanh cuộn ngang và dọc*/
    height: 1px;
}
.type-input::-webkit-scrollbar-thumb {
    /*Hình vuông nhỏ bên trong thanh cuộn*/
    border-radius: 10px;
    box-shadow   : inset 0 0 5px rgba(0, 0, 0, 0.2);
    background   : #666;
}
.type-input::-webkit-scrollbar-track {
    /*Đường dẫn bên trong thanh cuộn*/
    box-shadow   : inset 0 0 5px rgba(0, 0, 0, 0.2);
    border-radius: 10px;
    background   : #ededed;
}
.layui-form-radio{
    margin: 0; 
    padding-right: 0;
}
.layui-form-pane .layui-form-checkbox {
    margin: 4px 0 4px 1px;
}
.layui-form-checkbox[lay-skin=primary] span {
    padding-right: 4px;
}
.layui-form-checkbox[lay-skin=primary] i {
    left: 6px;
}
.layui-form-item .layui-col-xs12{
    margin-top: 10px;
}
@media screen and (max-width: 990px){
    .layui-form-item .layui-col-xs12:first-child{
        margin-top: 0px;
    }
    .layui-form-item{
        margin-bottom: 10px; 
    }
}
</style>
</head>
<body class="bsbg">
<div class="layui-fluid">
    <form class="layui-form layui-form-pane" action="<?=links('comic','save')?>">
        <div class="layui-form-item">
            <div class="layui-col-xs12 layui-col-md3">
                <label class="layui-form-label">Thể loại truyện tranh</label>
                <div class="layui-input-block">
                    <select name="cid">
                        <option value="">Chọn thể loại</option>
                    <?php
                    foreach($class as $row){
                        $sel = $row['id'] == $cid ? ' selected' : '';
                        echo '<option value="'.$row['id'].'"'.$sel.'>'.$row['name'].'</option>';
                        $array = $this->mcdb->get_select('class','id,name',array('fid'=>$row['id']),'xid ASC',100);
                        foreach($array as $row2){
                            $sel2 = $row2['id'] == $cid ? ' selected' : '';
                            echo '<option value="'.$row2['id'].'"'.$sel2.'>    ├─ '.$row2['name'].'</option>';
                        }
                    }
                    ?>
                    </select>
                </div>
            </div>
            <div class="layui-col-xs12 layui-col-md3">
                <label class="layui-form-label">Trạng thái truyện tranh</label>
                <div class="layui-input-block">
                    <select name="serialize">
                        <option value="完结">Đã hoàn thành</option>
                        <option value="连载"<?php if(strpos($serialize,'连载') !== false) echo 'selected';?>>Đang cập nhật</option>
                    </select>
                </div>
            </div>
            <div class="layui-col-xs12 layui-col-md2">
                <label class="layui-form-label">Đã khóa</label>
                <div class="layui-input-block">
                    <select name="sid">
                        <option value="0">Chưa khóa</option>
                        <option value="1"<?php if($sid == 1) echo 'selected';?>>Đã khóa</option>
                    </select>
                </div>
            </div>
            <div class="layui-col-xs12 layui-col-md2">
                <label class="layui-form-label">Đã đề xuất</label>
                <div class="layui-input-block">
                    <select name="tid">
                        <option value="0">Chưa đề xuất</option>
                        <option value="1"<?php if($tid == 1) echo 'selected';?>>Đã đề xuất</option>
                    </select>
                </div>
            </div>
            <div class="layui-col-xs12 layui-col-md2 label80">
                <label class="layui-form-label">Duyệt</label>
                <div class="layui-input-block">
                    <select name="yid" lay-filter="yid">
                        <option value="0">Đã duyệt</option>
                        <option value="1"<?php if($yid == 1) echo 'selected';?>>Chờ duyệt</option>
                        <option value="2"<?php if($yid == 2) echo 'selected';?>>Không được duyệt</option>
                    </select>
                </div>
            </div>
            <div id="yid" class="layui-col-xs12 layui-col-md12"<?php if($yid < 2) echo ' style="display: none;"';?>>
                <label class="layui-form-label">Lý do không được duyệt</label>
                <div class="layui-input-block">
                    <input type="text" name="msg" class="layui-input" value="<?=$msg?>" placeholder="Vui lòng nhập lý do không được duyệt">
                </div>
            </div>
            <div class="layui-col-xs12 layui-col-md4">
                <label class="layui-form-label">Tác giả truyện tranh</label>
                <div class="layui-input-block">
                    <input type="text" name="author" class="layui-input" value="<?=$author?>" placeholder="Vui lòng nhập tên tác giả truyện tranh">
                </div>
            </div>
            <div class="layui-col-xs12 layui-col-md4">
                <label class="layui-form-label">Tên khác tiếng Anh</label>
                <div class="layui-input-block">
                    <input type="text" name="yname" class="layui-input" value="<?=$yname?>" placeholder="Vui lòng nhập tên khác tiếng Anh của truyện tranh">
                </div>
            </div>
            <div class="layui-col-xs12 layui-col-md4">
                <div class="layui-input-inline">
                    <input type="checkbox" name="addtime" title="Cập nhật thời gian" checked>
                </div>
                <div class="layui-input-inline">
                    <input type="checkbox" name="push" title="URL Push"<?php if(Push_Type != '') echo 'checked';?>>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-col-xs12 layui-col-md4">
                <label class="layui-form-label">Tiêu đề truyện tranh</label>
                <div class="layui-input-block">
                    <input type="text" name="name" required lay-verify="required" class="layui-input" value="<?=$name?>" placeholder="Vui lòng nhập tiêu đề truyện tranh">
                </div>
            </div>
            <div class="layui-col-xs12 layui-col-md3">
                <label class="layui-form-label">Tổng điểm</label>
                <div class="layui-input-block">
                    <input type="number" name="score" class="layui-input" value="<?=$score?>" placeholder="Tổng điểm đánh giá truyện tranh">
                </div>
            </div>
            <div class="layui-col-xs12 layui-col-md5">
                <label class="layui-form-label">Mô tả ngắn</label>
                <div class="layui-input-block">
                    <input type="text" name="text" class="layui-input" value="<?=$text?>" placeholder="Giới thiệu ngắn gọn về truyện tranh, trong vòng 10 chữ">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-col-xs12 layui-col-md6">
                <label class="layui-form-label">Ảnh bìa dọc</label>
                <div class="layui-input-block">
                    <input type="text" id="pic" name="pic" class="layui-input" placeholder="Vui lòng tải lên ảnh bìa dọc của truyện tranh hoặc nhập URL hình ảnh" value="<?=$pic?>">
                    <div class="layui-btn layui-btn-normal uppic" style="position: absolute;top: 0px;right: 0;">Tải lên ảnh bìa</div>
                </div>
            </div>
            <div class="layui-col-xs12 layui-col-md6">
                <label class="layui-form-label">Ảnh bìa ngang</label>
                <div class="layui-input-block">
                    <input type="text" id="picx" name="picx" class="layui-input" placeholder="Vui lòng tải lên ảnh bìa ngang của truyện tranh hoặc nhập URL hình ảnh" value="<?=$picx?>">
                    <div class="layui-btn layui-btn-normal uppicx" style="position: absolute;top: 0px;right: 0;">Tải lên ảnh bìa</div>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-col-xs12 layui-col-md3">
                <label class="layui-form-label">Lượt xem hôm nay</label>
                <div class="layui-input-block">
                    <input type="number" name="rhits" class="layui-input" value="<?=$rhits?>" placeholder="Vui lòng nhập lượt xem hôm nay của truyện tranh">
                </div>
            </div>
            <div class="layui-col-xs12 layui-col-md3">
                <label class="layui-form-label">Lượt xem tuần này</label>
                <div class="layui-input-block">
                    <input type="number" name="zhits" class="layui-input" value="<?=$zhits?>" placeholder="Vui lòng nhập lượt xem tuần này của truyện tranh">
                </div>
            </div>
            <div class="layui-col-xs12 layui-col-md3">
                <label class="layui-form-label">Lượt xem tháng này</label>
                <div class="layui-input-block">
                    <input type="number" name="yhits" class="layui-input" value="<?=$yhits?>" placeholder="Vui lòng nhập lượt xem tháng này của truyện tranh">
                </div>
            </div>
            <div class="layui-col-xs12 layui-col-md3">
                <label class="layui-form-label">Tổng lượt xem</label>
                <div class="layui-input-block">
                    <input type="number" name="hits" class="layui-input" value="<?=$hits?>" placeholder="Vui lòng nhập tổng lượt xem của truyện tranh">
                </div>
            </div>
        </div>
        <?php foreach($type as $k=>$row): ?>
        <div class="layui-col-xs12 layui-col-md6">
            <div class="layui-form-item" pane="">
                <label class="layui-form-label"><?=$row['name']?></label>
                <?php
                $n = $k+1;
                $array = $this->mcdb->get_select('type','id,name',array('fid'=>$row['id']),'xid ASC',100);
                
                echo '<div class="layui-input-block type-input">';
                foreach($array as $v){
                    $tt = $row['cid'] == 0 ? 'checkbox' : 'radio';
                    $check = '';
                    if($id > 0){
                        $isrow = $this->mcdb->get_row('comic_type','id',array('mid'=>$id,'tid'=>$v['id']));
                        if($isrow) $check = ' checked';
                    }
                    echo '<input value="'.$v['id'].'" type="'.$tt.'" name="type['.$row['zd'].'][]" lay-skin="primary" title="'.$v['name'].'"'.$check.'>';
                }
                ?>
                </div>
            </div>
        </div>
        <?php endforeach; ?>
        <div class="layui-form-item">
            <div class="layui-col-xs12 layui-col-md6">
                <label class="layui-form-label">Họa sĩ</label>
                <div class="layui-input-block">
                    <input type="text" name="pic_author" class="layui-input" placeholder="Vui lòng nhập tên họa sĩ" value="<?=$pic_author?>">
                </div>
            </div>
            <div class="layui-col-xs12 layui-col-md6">
                <label class="layui-form-label">Tác giả</label>
                <div class="layui-input-block">
                    <input type="text" name="txt_author" class="layui-input" placeholder="Vui lòng nhập tên tác giả" value="<?=$txt_author?>">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">Thông báo của tác giả</label>
            <div class="layui-input-block">
                <textarea id="editor2" name="notice" placeholder="Thông báo truyện tranh của tác giả" class="layui-textarea"><?=$notice?></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">Giới thiệu truyện tranh</label>
            <div class="layui-input-block">
                <textarea id="editor2" name="content" placeholder="Giới thiệu truyện tranh" class="layui-textarea" style="min-height:100px;"><?=$content?></textarea>
            </div>
        </div>
        <div class="layui-form-item" style="text-align: center;">
            <input type="hidden" name="id" value="<?=$id?>">
            <button class="layui-btn" lay-filter="*" lay-submit>Lưu</button>
            <button type="reset" class="layui-btn layui-btn-primary">Đặt lại</button>
        </div>
    </form>
</div>
<script>
layui.use(['form','upload'], function(){
    var upload = layui.upload,
        form = layui.form;
    upload.render({
        elem: '.uppic',
        url: '<?=links('ajax','upload')?>',
        accept: 'file',
        acceptMime: 'image/*',
        exts: '<?=Annex_Ext?>',
        done: function(res){
            if(res.code == 0){
                layer.msg(res.msg,{icon: 1});
                $('#pic').val(res.url);
            }else{
                layer.msg(res.msg,{icon: 2});
            }
        }
    });
    upload.render({
        elem: '.uppicx',
        url: '<?=links('ajax','upload')?>',
        accept: 'file',
        acceptMime: 'image/*',
        exts: '<?=Annex_Ext?>',
        done: function(res){
            if(res.code == 0){
                layer.msg(res.msg,{icon: 1});
                $('#picx').val(res.url);
            }else{
                layer.msg(res.msg,{icon: 2});
            }
        }
    });
    form.on('select(yid)', function(data){
        if(data.value == 2){
            $('#yid').show();
        }else{
            $('#yid').hide();
        }
    });
})
</script>
</body>
</html>