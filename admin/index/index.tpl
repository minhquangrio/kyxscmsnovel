<!doctype html>
<html>
<head>
    <meta charset="UTF-8"> <title><?=Web_Name?> - Hệ thống quản trị</title> 
    <meta name="renderer" content="webkit|ie-comp|ie-stand"> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="<?=Web_Base_Path?>admin/css/style.css"> 
    <script src="<?=Web_Base_Path?>jquery/jquery.min.js"></script> 
    <!-- Cho phép IE8/9 hỗ trợ media query, tương thích với grid -->
    <!--[if lt IE 9]>
    <script src="<?=Web_Base_Path?>jquery/jquery-1.9.1.min.js"></script>
    <script src="<?=Web_Base_Path?>admin/js/html5.min.js"></script>
    <script src="<?=Web_Base_Path?>admin/js/respond.min.js"></script>
    <![endif]-->
    <script src="<?=Web_Base_Path?>layui/layui.js"></script>
    <script src="<?=Web_Base_Path?>admin/js/md5.js"></script>
    <script src="<?=Web_Base_Path?>admin/js/common.js"></script>
</head>
<body class="index">
<!-- Phần đầu trang bắt đầu -->
<div class="container">
    <div class="logo"><a>Hệ thống quản trị</a></div> <div class="left_open">
        <a><i title="Mở rộng cột trái" class="layui-icon"></i></a>
    </div>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item"><a onclick="Admin.delcache('<?=links('index','caches')?>');" title="Làm mới bộ nhớ cache"><i class="layui-icon" style="font-size:16px;"></i></a></li>
        <li class="layui-nav-item">
            <a href="javascript:;"><?=$this->cookie->get('admin_nichen')?></a>
            <dl class="layui-nav-child">
                <dd><a onclick="get_pass();">Thay đổi mật khẩu</a></dd>
                <dd><a href="<?=links('logout')?>">Đăng xuất</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item to-index"><a href="<?=Web_Path?>" target="_blank">Trang chủ</a></li>
    </ul>
</div>
<!-- Phần đầu trang kết thúc -->
<!-- Phần nội dung bắt đầu -->
<!-- Menu bên trái bắt đầu -->
<div class="layui-side left-nav">
    <div class="layui-side-scroll" id="side-nav">
        <ul id="nav">
                <!--echo "<pre>"; print_r($nav); echo "</pre>";-->

        <?php 


        foreach($nav as $k=>$v){
            $uarr = explode(',',$v['file']);
            $qx = 1;
            if(!empty($admin['qx'])){
                $qx = 0;
                foreach($uarr as $v2){
                    if(strpos($admin['qx'],$v2) !== false){
                        $qx = 1;
                        break;
                    }
                }
            }
            if($qx == 1){
        ?>
            <li>
                <a href="javascript:;" class="left-nav-li" lay-tips="<?=$v['name']?>">
                    <i class="layui-icon nav-tps"><?=$v['icon']?></i>
                    <cite><?=$v['name']?></cite>
                    <i class="layui-icon nav_right"></i>
                </a>
                <ul class="sub-menu">
                    <?php 
                    foreach($v['list'] as $kk=>$vv){ 
                        if($vv['init'] == 1){
                            $urls = explode(',',$vv['url']);
                            if(empty($admin['qx']) || strstr($admin['qx'],$urls[0])){
                    ?>
                    <li>
                        <a onclick="Admin.add_tab('<?=$vv['name']?>','<?=links($urls[0])?>')">
                            <i class="layui-icon"></i>
                            <cite><?=$vv['name']?></cite>
                        </a>
                    </li>
                    <?php } } } ?>
                </ul>
            </li>
        <?php } } ?>
        </ul>
    </div>
</div>
<!-- Menu bên trái kết thúc -->
<!-- Nội dung bên phải bắt đầu -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="iframe" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon"></i>Trang chủ</li>
        </ul>
        <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
            <dl>
                <dd data-type="this">Đóng tab hiện tại</dd>
                <dd data-type="other">Đóng các tab khác</dd>
                <dd data-type="all">Đóng tất cả</dd>
            </dl>
        </div>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show" style="padding-bottom:44px;">
                <iframe src='<?=links('index','main')?>' frameborder="0" scrolling="yes" class="iframe"></iframe>
            </div>
        </div>
        <div id="tab_show"></div>
    </div>
</div>
<div class="layui-footer layui-text">
    <?=base64decode('Y29weXJpZ2h0IMKpIDIwMjAgPGEgaHJlZj0iaHR0cDovL3d3dy5tY2Ntcy5jbi8iIHRhcmdldD0iX2JsYW5rIj7mvKvln45DTVPns7vnu588L2E-IGFsbCByaWdodHMgcmVzZXJ2ZWQu')?> 
    <span class="pull-right">Phiên bản <?=Ver?></span>
</div>
<!-- Nội dung bên phải kết thúc -->
<!-- Phần nội dung kết thúc -->
<script type="text/javascript">
function get_pass(){
    layer.prompt({title: 'Nhập mật khẩu mới',area: ['200px', '150px']},function(value, index, elem){
        $.post('<?=links('ajax','passedit')?>', {pass:value}, function(res) {
            if(res.code == 0){
                layer.msg('Thay đổi thành công',{icon: 1});
                setTimeout(function() {
                    location.reload();
                }, 1000);
            }else{
                layer.msg(res.msg,{icon: 2});
                layer.close(index);
            }
        },'json');
    });
}
</script>
</body>
</html>