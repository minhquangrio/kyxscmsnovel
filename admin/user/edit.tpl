<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chỉnh sửa thành viên</title>
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
    /*Kiểu dáng thanh cuộn*/
    width : 10px;  /*Chiều cao và chiều rộng tương ứng với kích thước của thanh cuộn ngang và dọc*/
    height: 1px;
}
.type-input::-webkit-scrollbar-thumb {
    /*Khối nhỏ bên trong thanh cuộn*/
    border-radius: 10px;
    box-shadow   : inset 0 0 5px rgba(0, 0, 0, 0.2);
    background   : #666;
}
.type-input::-webkit-scrollbar-track {
    /*Đường ray bên trong thanh cuộn*/
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
    <form class="layui-form layui-form-pane" action="<?=links('user','save')?>">
        <div class="layui-tab layui-tab-brief">
            <ul class="layui-tab-title">
                <li class="layui-this">Thông tin cơ bản</li>
                <li>Thông tin xác thực</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <div class="layui-form-item">
                        <div class="layui-col-xs12 layui-col-md4">
                            <label class="layui-form-label">Tài khoản đăng nhập</label>
                            <div class="layui-input-block">
                                <input type="text" name="name" autocomplete="off" required lay-verify="required" class="layui-input" value="<?=$name?>" placeholder="Vui lòng nhập tài khoản đăng nhập">
                            </div>
                        </div>
                        <div class="layui-col-xs12 layui-col-md4">
                            <label class="layui-form-label">Mật khẩu đăng nhập</label>
                            <div class="layui-input-block">
                                <input type="password" name="pass" autocomplete="off" class="layui-input" value="" placeholder="Vui lòng nhập mật khẩu đăng nhập<?php if($id > 0) echo '，Để trống nếu không thay đổi';?>">
                            </div>
                        </div>
                        <div class="layui-col-xs12 layui-col-md4">
                            <label class="layui-form-label">Giới tính</label>
                            <div class="layui-input-block">
                                <select name="sex">
                                    <option value="Nam">Nam</option>
                                    <option value="Nữ"<?php if($sex=='Nữ') echo 'selected';?>>Nữ</option>
                                    <option value="Giữ bí mật"<?php if($sex=='Giữ bí mật') echo 'selected';?>>Giữ bí mật</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-col-xs12 layui-col-md6">
                            <label class="layui-form-label">Biệt danh/Bút danh</label>
                            <div class="layui-input-block">
                                <input type="text" name="nichen" autocomplete="off" required lay-verify="required" class="layui-input" value="<?=$nichen?>" placeholder="Vui lòng nhập biệt danh người dùng">
                            </div>
                        </div>
                        <div class="layui-col-xs12 layui-col-md6">
                            <label class="layui-form-label">Ảnh đại diện</label>
                            <div class="layui-input-block">
                                <input type="text" id="pic" name="pic" class="layui-input" placeholder="Vui lòng tải lên ảnh đại diện hoặc nhập URL hình ảnh" value="<?=$pic?>">
                                <div class="layui-btn layui-btn-normal uppic" style="position: absolute;top: 0px;right: 0;">Tải lên ảnh đại diện</div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-col-xs12 layui-col-md4">
                            <label class="layui-form-label">Số điện thoại liên lạc</label>
                            <div class="layui-input-block">
                                <input type="number" name="tel" required lay-verify="required" class="layui-input" value="<?=$tel?>" placeholder="Vui lòng nhập số điện thoại liên lạc">
                            </div>
                        </div>
                        <div class="layui-col-xs12 layui-col-md4">
                            <label class="layui-form-label">Email liên lạc</label>
                            <div class="layui-input-block">
                                <input type="text" name="email" class="layui-input" value="<?=$email?>" placeholder="Vui lòng nhập email liên lạc">
                            </div>
                        </div>
                        <div class="layui-col-xs12 layui-col-md4">
                            <label class="layui-form-label">Thành phố/Khu vực</label>
                            <div class="layui-input-block">
                                <input type="text" name="city" class="layui-input" value="<?=$city?>" placeholder="Vui lòng điền thành phố/khu vực">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-col-xs12 layui-col-md3">
                            <label class="layui-form-label">QQ</label>
                            <div class="layui-input-block">
                                <input type="number" name="qq" class="layui-input" value="<?=$qq?>" placeholder="Vui lòng nhập QQ">
                            </div>
                        </div>
                        <div class="layui-col-xs12 layui-col-md3">
                            <label class="layui-form-label">Khóa tài khoản?</label>
                            <div class="layui-input-block">
                                <select name="sid">
                                    <option value="0">Chưa khóa</option>
                                    <option value="1"<?php if($sid == 1) echo 'selected';?>>Đã khóa</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-col-xs12 layui-col-md3">
                            <label class="layui-form-label">Là Vip?</label>
                            <div class="layui-input-block">
                                <select name="vip" lay-filter="vip">
                                    <option value="0">Không</option>
                                    <option value="1"<?php if($vip == 1) echo 'selected';?>>Có</option>
                                </select>
                            </div>
                        </div>
                        <div id="viptime" class="layui-col-xs12 layui-col-md3"<?php if($vip == 0) echo ' style="display: none;
                        "';?>>
                            <label class="layui-form-label">Thời hạn Vip</label>
                            <div class="layui-input-block">
                                <input id="time" type="text" name="viptime" class="layui-input" value="<?=$viptime > 0 ? date('Y-m-d H:i:s',$viptime):'';?>" placeholder="Vui lòng chọn thời hạn Vip">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-col-xs12 layui-col-md3">
                            <label class="layui-form-label">Đã ký hợp đồng?</label>
                            <div class="layui-input-block">
                                <select name="signing">
                                    <option value="0">Chưa ký</option>
                                    <option value="1"<?php if($signing == 1) echo 'selected';?>>Đã ký</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-col-xs12 layui-col-md3">
                            <label class="layui-form-label">Số dư</label>
                            <div class="layui-input-block">
                                <input type="number" name="rmb" class="layui-input" value="<?=$rmb?>" placeholder="Số dư">
                            </div>
                        </div>
                        <div class="layui-col-xs12 layui-col-md3">
                            <label class="layui-form-label">Số lượng <?=Pay_Cion_Name?></label>
                            <div class="layui-input-block">
                                <input type="number" name="cion" class="layui-input" value="<?=$cion?>" placeholder="Số dư <?=Pay_Cion_Name?>">
                            </div>
                        </div>
                        <div class="layui-col-xs12 layui-col-md3">
                            <label class="layui-form-label">Số lượng phiếu tháng</label>
                            <div class="layui-input-block">
                                <input type="number" name="ticket" class="layui-input" value="<?=$ticket?>" placeholder="Số lượng phiếu tháng">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">Giới thiệu</label>
                        <div class="layui-input-block">
                            <textarea name="text" placeholder="Giới thiệu" class="layui-textarea"><?=$text?></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item" style="text-align: center;">
                        <input type="hidden" name="id" value="<?=$id?>">
                        <button class="layui-btn" lay-filter="*" lay-submit>Lưu</button>
                        <button type="reset" class="layui-btn layui-btn-primary">Đặt lại</button>
                    </div>
                </div>
                <div class="layui-tab-item">
                    <div class="layui-form-item">
                        <div class="layui-col-xs12 layui-col-md3">
                            <label class="layui-form-label">Trạng thái xác thực</label>
                            <div class="layui-input-block">
                                <select name="cid" lay-filter="rz">
                                    <option value="0">Chưa xác thực</option>
                                    <option value="1"<?php if($cid == 1) echo 'selected';?>>Đang chờ xác thực</option>
                                    <option value="2"<?php if($cid == 2) echo 'selected';?>>Xác thực thất bại</option>
                                    <option value="3"<?php if($cid == 3) echo 'selected';?>>Xác thực cá nhân</option>
                                    <option value="4"<?php if($cid == 4) echo 'selected';?>>Xác thực doanh nghiệp</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-col-xs12 layui-col-md4">
                            <label class="layui-form-label"><?=$rz_type == 1 ? 'Họ và tên':'Tên doanh nghiệp';?></label>
                            <div class="layui-input-block">
                                <input type="text" name="realname" class="layui-input" value="<?=$realname?>" placeholder="Vui lòng điền <?=$rz_type == 1 ? 'họ và tên':'tên doanh nghiệp';?>">
                            </div>
                        </div>
                        <div class="layui-col-xs12 layui-col-md5">
                            <label class="layui-form-label">Số CMND/CCCD</label>
                            <div class="layui-input-block">
                                <input type="text" name="idcard" class="layui-input" value="<?=$idcard?>" placeholder="Số CMND/CCCD">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item" id="rz"<?php if($cid != 2) echo ' style="display: none;"';?>>
                        <div class="layui-col-xs12 layui-col-md12">
                            <label class="layui-form-label">Lý do thất bại</label>
                            <div class="layui-input-block">
                                <input type="text" name="rz_msg" class="layui-input" value="<?=$rz_msg?>" placeholder="Vui lòng điền lý do thất bại">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-col-xs12 layui-col-md3">
                            <label class="layui-form-label">Tên ngân hàng</label>
                            <div class="layui-input-block">
                                <select name="bank" lay-verify="" lay-search>
                                    <?php if(!empty($bank)) echo '<option value="'.$bank.'">'.$bank.'</option>';?>
                                    <option value='Ngân hàng China Merchants Bank'>Ngân hàng China Merchants Bank</option>
                                    <option value='Ngân hàng Bưu điện Trung Quốc'>Ngân hàng Bưu điện Trung Quốc</option>                                                      
                                </select>
                            </div>
                        </div>
                        <div class="layui-col-xs12 layui-col-md4">
                            <label class="layui-form-label">Số tài khoản ngân hàng</label>
                            <div class="layui-input-block">
                                <input type="text" name="card" class="layui-input" value="<?=$card?>" placeholder="Số tài khoản ngân hàng">
                            </div>
                        </div>
                        <div class="layui-col-xs12 layui-col-md5">
                            <label class="layui-form-label">Địa chỉ chi nhánh ngân hàng</label>
                            <div class="layui-input-block">
                                <input type="text" name="bankcity" class="layui-input" value="<?=$bankcity?>" placeholder="Địa chỉ chi nhánh ngân hàng">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item" style="text-align: center;">
                        <button class="layui-btn" lay-filter="*" lay-submit>Lưu</button>
                        <button type="reset" class="layui-btn layui-btn-primary">Đặt lại</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<script>
layui.use(['form','upload','laydate'], function(){
    var form = layui.form,
        upload = layui.upload,
        laydate = layui.laydate;
    //VIP
    form.on('select(vip)', function(r){
        if(r.value == 1){
            $('#viptime').show();
        }else{
            $('#viptime').hide();
        }
    });
    //Xác thực
    form.on('select(rz)', function(r){
        if(r.value == 2){
            $('#rz').show();
        }else{
            $('#rz').hide();
        }
    });
    laydate.render({
        elem: '#time',
        type: 'datetime'
    });
    upload.render({
        elem: '.uppic',
        url: '<?=links('ajax','upload')?>?dir=<?=sys_auth('user')?>&sy=no',
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
})
</script>
</body>
</html>