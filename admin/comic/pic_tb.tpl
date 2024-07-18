<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đồng bộ ảnh chương</title>
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
    <script src="<?=Web_Base_Path?>admin/js/md5.js"></script>
    <script src="<?=Web_Base_Path?>admin/js/common.js"></script>
<style type="text/css">
.html{
    overflow-y: auto;
    height: 230px;
    width: 100%;
    margin-top: 10px;
}
.html::-webkit-scrollbar {
    /*Kiểu dáng thanh cuộn*/
    width : 10px;  /*Chiều cao và chiều rộng tương ứng với kích thước của thanh cuộn ngang và dọc*/
    height: 1px;
}
.html::-webkit-scrollbar-thumb {
    /*Khối nhỏ bên trong thanh cuộn*/
    border-radius: 10px;
    box-shadow   : inset 0 0 5px rgba(0, 0, 0, 0.2);
    background   : #666;
}
.html::-webkit-scrollbar-track {
    /*Đường ray bên trong thanh cuộn*/
    box-shadow   : inset 0 0 5px rgba(0, 0, 0, 0.2);
    border-radius: 10px;
    background   : #ededed;
}
.layui-table td{padding: 3px 15px;}
</style>
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row" style="padding:10px;">
        <fieldset class="layui-elem-field layui-field-title" style="margin: 0;">
            <legend>Đang đồng bộ ảnh chương</legend>
        </fieldset>
        <div class="html" id="html">
            <table class="layui-table" lay-even lay-skin="row" id="mark"></table>
        </div>
    </div>
</div>
<script type="text/javascript">
var post = {mid:<?=$mid?>,cid:<?=$cid?>,tb:<?=$tb?>};
layui.use('element', function(){
    var element = layui.element;
    get_mark(element);
})
function get_mark(element){
    var index = layer.load();
    $.post('<?=links('comic','tbpic_save')?>',post, function(res) {
        layer.close(index);
        if(res.code == 2){
            $('#mark').append(res.html);
        } else if(res.code == 1){
            post.cid = res.cid;
            $('#mark').append(res.html);
            setTimeout(function() {
                get_mark(element);
            },1000);
        }else{
            layer.msg(res.msg,{icon: 2});
        }
        var divscll = document.getElementById('html');
        divscll.scrollTop = divscll.scrollHeight;
    },'json');
}
</script>
</body>
</html>