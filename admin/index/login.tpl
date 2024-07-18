<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title><?=Web_Name?> - Quản trị đăng nhập</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="<?=Web_Base_Path?>layui/css/layui.css" media="all">
<link rel="stylesheet" href="<?=Web_Base_Path?>admin/css/login.css" media="all">
</head>
<body class="login-bg">
<div class="login layui-anim layui-anim-up">
    <div class="message"><?=Web_Name?>- Quản trị đăng nhập</div>
    <div id="darkbannerwrap"></div>
    <form method="post" class="layui-form" >
        <input name="name" placeholder="Tên đăng nhập" autocomplete="off" type="text" lay-verify="required" class="layui-input" >
        <hr class="hr15">
        <input name="pass" lay-verify="required" autocomplete="off" placeholder="Mật khẩu"  type="password" class="layui-input">
        <hr class="hr15">
        <input name="code" lay-verify="required" autocomplete="off" placeholder="Mã xác nhận"  type="password" class="layui-input">
        <hr class="hr15">
        <input value="Đăng nhập" lay-submit lay-filter="login" style="width:100%;" type="submit">
    </form>
    <div class="text"><p><a href="http://www.mccms.cn/" target="_blank">Được phát triển bởi Công ty TNHH Công nghệ mạng Quế Lâm Trùng Thắng</a></p></div>
</div>
<script src="<?=Web_Base_Path?>jquery/jquery.min.js"></script>
<!--[if IE 8]>
<script src="<?=Web_Base_Path?>jquery/jquery-1.9.1.min.js"></script>
<![endif]-->
<script src="<?=Web_Base_Path?>layui/layui.js"></script>
<script>
    $(function () {
        layui.use('form', function(){
            var form = layui.form;
            //Lắng nghe submit
            form.on('submit(login)', function(data){
                var index = layer.load();
                $.post('<?=links('login','save')?>', data.field, function(res) {
                    layer.close(index);
                    if(res.code == 1){
                        layer.msg('Đăng nhập thành công, vui lòng chờ...',{icon: 1});
                        setTimeout(function() {
                            window.location.href = '<?=links('index')?>';
                        }, 1000);
                    }else{
                        layer.msg(res.msg,{icon: 2});
                    }
                });
                return false;
            });
        });
    })
</script>
</body>
</html>