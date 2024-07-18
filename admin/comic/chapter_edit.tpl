<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chỉnh sửa chương</title>
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
.layui-form-item .layui-input-inline{
    width: auto;
    margin-left: 5px;
}
.layui-form-pane .layui-form-checkbox {
    margin: 4px 0 4px 1px;
}
.layui-form-item .layui-col-xs12{
    margin-top: 10px;
}
.layui-pic {
    margin-top: -20px;
}
.layui-pic li {
    float: left;
    width: 15%;
    height: 250px;
    overflow: hidden;
    margin-left:1%;
    margin-bottom:10px;
    position:relative;
    border: 3px solid #eee;
}
.layui-pic li>img {
    width: 100%;
    cursor: pointer;
}
.p2{
    position:absolute;
    bottom:0;
    right:0;
    padding:2px 10px;
    background: #ff5722;
    cursor: pointer;
}
.p2 i{
    font-size: 16px;
    color:#fff;
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
    <form class="layui-form layui-form-pane" action="<?=links('comic','chapter_save',$mid)?>">
        <div class="layui-form-item">
            <label class="layui-form-label">Tiêu đề chương</label>
            <div class="layui-input-block">
                <input type="text" name="name" required lay-verify="required" class="layui-input" value="<?=$name?>" placeholder="Nhập tiêu đề chương">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">Địa chỉ phân giải</label>
            <div class="layui-input-block">
                <input type="text" id="jxurl" name="jxurl" class="layui-input" placeholder="URL địa chỉ phân giải hình ảnh, có thể bỏ trống nếu không phải là thu thập" value="<?=$jxurl?>">
                <div class="layui-btn layui-btn-normal api-pic" style="position:absolute;top: 0px;right: 0;">Phân giải tất cả hình ảnh</div>
            </div>
        </div>
        <div id="yid" class="layui-col-xs12 layui-col-md12"<?php if($yid < 2) echo ' style="display: none;"';?>>
            <label class="layui-form-label">Lý do không được phê duyệt</label>
            <div class="layui-input-block">
                <input type="text" name="msg" class="layui-input" value="<?=$msg?>" placeholder="Nhập lý do không được phê duyệt">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-col-xs12 layui-col-md3">
                <label class="layui-form-label">Quyền VIP</label>
                <div class="layui-input-block">
                    <select name="vip">
                        <option value="0">Đọc miễn phí</option>
                        <option value="1"<?php if($vip == 1) echo 'selected';?>>Đọc VIP</option>
                    </select>
                </div>
            </div>
            <div class="layui-col-xs12 layui-col-md3">
                <label class="layui-form-label">Số lượng <?=Pay_Cion_Name?></label>
                <div class="layui-input-block">
                    <input type="number" name="cion" class="layui-input" value="<?=$cion?>" placeholder="Có cần <?=Pay_Cion_Name?> để đọc chương này không">
                </div>
            </div>
            <div class="layui-col-xs12 layui-col-md3">
                <label class="layui-form-label">Trạng thái kiểm duyệt</label>
                <div class="layui-input-block">
                    <select name="yid" lay-filter="yid">
                        <option value="0">Đã được phê duyệt</option>
                        <option value="1"<?php if($yid == 1) echo 'selected';?>>Chờ kiểm duyệt</option>
                        <option value="2"<?php if($yid == 2) echo 'selected';?>>Không được phê duyệt</option>
                    </select>
                </div>
            </div>
            <div class="layui-col-xs12 layui-col-md3">
                <label class="layui-form-label">ID sắp xếp</label>
                <div class="layui-input-block">
                    <input type="number" name="xid" class="layui-input" value="<?=$xid?>" placeholder="ID sắp xếp, càng nhỏ càng lên trước">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">Hình ảnh chương</label>
            <div class="layui-input-block" style="border: 1px solid #e6e6e6;padding:0 0 0 10px;">
                <div class="layui-row">
                    <ul class="layui-pic">
                    <?php 
                    foreach($pic as $_p){
                        echo '<li class="p1"><input type="hidden" name="pic[]" value="'.$_p['id'].'"><img src="'.getpic($_p['img']).'"><span class="p2" data-id="'.$_p['id'].'" title="Xóa"><i class="layui-icon"></i></span></li>';
                    }
                    ?>
                    </ul>
                </div>
                <div class="layui-btn layui-btn-danger all-del" style="position:absolute;top: 0px;left: 0;">Xóa tất cả hình ảnh</div>
                <div class="layui-btn inppic layui-btn-normal" style="position:absolute;top: 0px;right: 100px;">Điền thủ công</div>
                <div class="layui-btn uppic" style="position:absolute;top: 0px;right: 0;">Tải lên hình ảnh</div>
            </div>
        </div>
        <div class="layui-form-item" style="text-align: center;">
            <input type="hidden" name="id" value="<?=$id?>">
            <button class="layui-btn" lay-filter="*" lay-submit>Lưu</button>
            <button type="reset" class="layui-btn layui-btn-primary">Đặt lại</button>
        </div>
    </form>
</div>
<script type="text/javascript" src="<?=Web_Base_Path?>admin/js/jquery-migrate-1.1.1.js"></script>
<script type="text/javascript" src="<?=Web_Base_Path?>admin/js/jquery.dragsort-0.5.1.min.js"></script>
<script type="text/javascript">
layui.use(['form','upload'], function(){
    var upload = layui.upload,
        form = layui.form;
    upload.render({
        elem: '.uppic',
        url: '<?=links('ajax','upload',($id==0?$mid:$id))?>',
        number: 100,
        multiple: true,
        accept: 'file',
        acceptMime: 'image/*',
        exts: '<?=Annex_Ext?>',
        done: function(res){
            if(res.code == 0){
                layer.msg(res.msg,{icon: 1});
                var html='<li><input type="hidden" name="pic[]" value="'+res.pid+'"><img src="'+res.img+'"><span title="Xóa" class="p2" data-id="'+res.pid+'"><i class="layui-icon"></i></span></li>';
                $('.layui-pic').append(html);
                get_pic_px();
            }else{
                layer.msg(res.msg,{icon: 2});
            }
        }
    });
    //Tải lên hình ảnh
    $('.api-pic').click(function(){
        var url = $('#jxurl').val();
        var index = layer.load();
        $.post('<?=links('comic','pic_api')?>', {url:url,mid:<?=$mid?>,cid:<?=$id?>}, function(res) {
            layer.close(index);
            if(res.code == 1){
                layer.msg('Phân giải thành công, lấy được '+res.pic.length+' hình ảnh, đã thêm vào hàng đợi',{icon: 1});
                var html = '';
                for (var i = 0; i < res.pic.length; i++) {
                    html+='<li><input type="hidden" name="pic[]" value="'+res.pic[i]['id']+'"><img src="'+res.pic[i]['img']+'"><span title="Xóa" class="p2" data-id="'+res.pic[i]['id']+'"><i class="layui-icon"></i></span></li>';
                }
                $('.layui-pic').append(html);
                get_pic_px();
                layer.tips('Kéo hình ảnh để sắp xếp tự do',$('.layui-pic'),{tips: 1});
            }else{
                layer.msg(res.msg,{icon: 2});
            }
        },'json');
    });
    //Xóa tất cả hình ảnh
    $('.all-del').click(function(){
        layer.confirm('Không thể khôi phục, bạn có chắc chắn muốn xóa không', {
            title:'Xác nhận xóa',
            btn: ['Xác nhận', 'Hủy'], //nút
            shade:0.001
        }, function(index) {
            var index = layer.load();
            $.post('<?=links('comic','pic_del')?>', {id:<?=$id?>,ac:'all'}, function(res) {
                layer.close(index);
                if(res.code == 1){
                    layer.msg('Xóa thành công...',{icon: 1});
                    $('.layui-pic').html('');
                }else{
                    layer.msg(res.msg,{icon: 2});
                }
            },'json');
        }, function(index) {
            layer.close(index);
        });
    });
    //Xóa một hình ảnh
    $('body').delegate(".p2", "click", function(){
        var _this = $(this);
        var pid = $(this).attr('data-id');
        layer.confirm('Không thể khôi phục, bạn có chắc chắn muốn xóa không', {
            title:'Xác nhận xóa',
            btn: ['Xác nhận', 'Hủy'], //nút
            shade:0.001
        }, function(index) {
            var index = layer.load();
            $.post('<?=links('comic','pic_del')?>',{id:pid},function(res) {
                layer.close(index);
                if(res.code == 1){
                    layer.msg('Xóa thành công...',{icon: 1});
                    $(_this).parent().remove();
                }else{
                    layer.msg(res.msg,{icon: 2});
                }
            },'json');
        }, function(index) {
            layer.close(index);
        });
    });
    form.on('select(yid)', function(data){
        if(data.value == 2){
            $('#yid').show();
        }else{
            $('#yid').hide();
        }
    });
    //Điền thủ công địa chỉ hình ảnh
    var pindex = null,tb = 1;
    $('.inppic').click(function(){
        pindex = layer.open({
            type: 1,
            title: 'Điền thủ công hình ảnh',
            area: ['800px', '500px'],
            content: '<div class="piclist" style="padding:15px;"><form class="layui-form layui-form-pane"><div class="layui-form-item"><label class="layui-form-label">Địa chỉ hình ảnh</label><div class="layui-input-block"><textarea style="min-height:300px;" name="pic" placeholder="Mỗi dòng một địa chỉ hình ảnh" class="layui-textarea"></textarea></div></div><div class="layui-form-item" pane><label class="layui-form-label">Đồng bộ hóa hình ảnh:</label><div class="layui-input-inline"><input lay-filter="tb" type="radio" name="tb" value="1" title="Có" checked><input lay-filter="tb" type="radio" name="tb" value="0" title="Không"></div></div><div class="layui-form-item" style="text-align: center;"><button type="button" class="layui-btn layui-btn-fluid picsave">Lưu tất cả hình ảnh</button></div></form></div>'
        });
        form.render();
    });
    form.on('radio(tb)', function(data){
        tb = data.value;
    });
    $('body').delegate(".picsave", "click", function(){
        var pic = $('.piclist textarea').val();
        if(pic == ''){
            layer.msg('Bạn cần điền ít nhất một địa chỉ hình ảnh',{icon: 2});
        }else{
            var index = layer.load();
            $.post('<?=links('comic','pic_save')?>',{pic: pic,mid:<?=$mid?>,cid:<?=$id?>,xid:$('.layui-pic li').length,tb:tb},function(res) {
                layer.close(index);
                if(res.code == 1){
                    layer.close(pindex);
                    layer.msg('Đã thêm thành công '+res.pic.length+' hình ảnh, đã thêm vào hàng đợi',{icon: 1});
                    var html = '';
                    for (var i = 0; i < res.pic.length; i++) {
                        html+='<li><input type="hidden" name="pic[]" value="'+res.pic[i]['id']+'"><img src="'+res.pic[i]['img']+'"><span title="Xóa" class="p2" data-id="'+res.pic[i]['id']+'"><i class="layui-icon"></i></span></li>';
                    }
                    $('.layui-pic').append(html);
                    get_pic_px();
                    layer.tips('Kéo hình ảnh để sắp xếp tự do',$('.layui-pic'),{tips: 1});
                }else{
                    layer.msg(res.msg,{icon: 2});
                }
            },'json');
        }
    });
    get_pic_px();
    <?php if(!empty($pic)): ?>
    layer.tips('Kéo hình ảnh để sắp xếp tự do',$('.layui-pic'),{tips: 1});
    <?php endif;?>
});
function get_pic_px(){
    $(".layui-pic").dragsort({
        dragSelector: "img",
        dragBetween: true
    });
}
</script>
</body>
</html>