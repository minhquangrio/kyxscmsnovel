<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách quản trị viên</title>
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
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-xs12 layui-col-md12" id="mccms_left">
		    <div class="layui-row layui-col-space15">
		        <div class="layui-col-xs6 layui-col-sm6 layui-col-md2 lay-hits">
		            <div class="layui-card">
		                <div class="layui-card-header">
		                    Người dùng APP<span class="layui-badge layui-badge-pink pull-right">Tổng cộng</span>
		                </div>
		                <div class="layui-card-body">
		                    <p class="lay-big-font"><?=format_wan($app1)?> <span style="font-size:24px;line-height: 1;">người</span></p>
		                    <p style="font-size:12px;">Hoạt động hôm nay<span class="pull-right"><?=format_wan($app2)?> người</span></p>
		                </div>
		            </div>
		        </div>
		        <div class="layui-col-xs6 layui-col-sm6 layui-col-md2 lay-hits">
		            <div class="layui-card">
		                <div class="layui-card-header">
		                    Lượt xem truyện tranh<span class="layui-badge layui-badge-green pull-right">Hôm nay</span>
		                </div>
		                <div class="layui-card-body">
		                    <p class="lay-big-font"><?=format_wan($rhits)?></p>
		                    <p style="font-size:12px;">Tổng lượt xem<span class="pull-right"><?=format_wan($hits)?></span></p>
		                </div>
		            </div>
		        </div>
		        <div class="layui-col-xs6 layui-col-sm6 layui-col-md2 lay-hits">
		            <div class="layui-card">
		                <div class="layui-card-header">
		                    Lượt xem tiểu thuyết<span class="layui-badge layui-badge-red pull-right">Hôm nay</span>
		                </div>
		                <div class="layui-card-body">
		                    <p class="lay-big-font"><?=format_wan($brhits)?></p>
		                    <p style="font-size:12px;">Tổng lượt xem<span class="pull-right"><?=format_wan($bhits)?></span></p>
		                </div>
		            </div>
		        </div>
		        <div class="layui-col-xs6 layui-col-sm6 layui-col-md2 lay-hits">
		            <div class="layui-card">
		                <div class="layui-card-header">
		                    Số tiền nạp<span class="layui-badge layui-badge-blue pull-right">Hôm nay</span>
		                </div>
		                <div class="layui-card-body">
		                    <p class="lay-big-font"><span style="font-size:25px;line-height: 1;"></span><?=format_wan($rmb)?> đồng</p>
		                    <p style="font-size:12px;">Số tiền thành công<span class="pull-right"><?=format_wan($rmb2)?></span></p>
		                </div>
		            </div>
		        </div>
		        <div class="layui-col-xs6 layui-col-sm6 layui-col-md2 lay-hits">
		            <div class="layui-card">
		                <div class="layui-card-header">
		                    Số lượng đơn hàng<span class="layui-badge layui-badge-red pull-right">Hôm nay</span>
		                </div>
		                <div class="layui-card-body">
		                    <p class="lay-big-font"><?=format_wan($dd)?></p>
		                    <p style="font-size:12px;">Tỷ lệ chuyển đổi<span class="pull-right"><?=$bi?>%</span></p>
		                </div>
		            </div>
		        </div>
		        <div class="layui-col-xs6 layui-col-sm6 layui-col-md2 lay-hits">
		            <div class="layui-card">
		                <div class="layui-card-header">
		                    Người dùng đăng ký<span class="layui-badge layui-badge-pink pull-right">Hôm nay</span>
		                </div>
		                <div class="layui-card-body">
		                    <p class="lay-big-font"><?=format_wan($u1)?> <span style="font-size:24px;line-height: 1;">người</span></p>
		                    <p style="font-size:12px;">Tổng số đăng ký<span class="pull-right"><?=format_wan($u2)?> người</span></p>
		                </div>
		            </div>
		        </div>
		    </div>
		    <div class="layui-col-md12" style="margin-top: 15px;">
		        <div class="layui-card">
		            <div class="layui-card-header">Thông tin hệ thống</div>
		            <div class="layui-card-body ">
		                <table class="layui-table">
		                	<colgroup>
							    <col width="150">
							    <col>
							</colgroup>
		                    <tbody>
		                        <tr>
		                            <th>Tên hệ thống</th>
		                            <td>Mccms comic system</td>
		                        </tr>
		                        <tr>
		                            <th>Tên miền chạy</th>
		                            <td><?=$_SERVER["HTTP_HOST"]?><span id="cscms_sq"></span></td>
		                        </tr>
		                        <tr>
		                            <th>IP máy chủ</th>
		                            <td><?=GetHostByName($_SERVER['SERVER_NAME'])?></td>
		                        </tr>
		                        <tr>
		                            <th>Hệ điều hành</th>
		                            <td><?php $os = explode(" ", php_uname()); echo $os[0];?></td>
		                        </tr>
		                        <tr>
		                            <th>Môi trường chạy</th>
		                            <td><?php if('/'==DIRECTORY_SEPARATOR){echo $os[2];}else{echo $os[1];} ?> /   <?php echo $_SERVER['SERVER_SOFTWARE'];?></td>
		                        </tr>
		                        <tr>
		                            <th>Phiên bản PHP</th>
		                            <td><?=PHP_VERSION?></td>
		                        </tr>
		                        <tr>
		                            <th>Phiên bản Mysql</th>
		                            <td><?=$this->db->version()?></td>
		                        </tr>
		                        <tr>
		                            <th>Thời gian hệ thống</th>
		                            <td><?=date('Y-m-d H:i:s')?></td>
		                        </tr>
		                    </tbody>
		                </table>
		            </div>
		        </div>
		    </div>
		    <div class="layui-row">
		        <div class="layui-card">
		            <div class="layui-card-header">Nhóm phát triển</div>
		            <div class="layui-card-body ">
		                <table class="layui-table">
		                	<colgroup>
							    <col width="150">
							    <col>
							 </colgroup>
		                    <tbody>
		                        <tr>
		                            <th>Bản quyền</th>
		                            <td><a href="http://www.mccms.cn/" target="_blank">Công ty TNHH Công nghệ mạng Quế Lâm Chongsheng</a></td>
		                        </tr>
		                        <tr>
		                            <th>Nhà phát triển</th>
		                            <td>Mưa bụi Giang Nam(2811358863@qq.com)</td></tr>
		                    </tbody>
		                </table>
		            </div>
		        </div>
    		</div>
    	</div>
    	<!--<div class="layui-col-xs12 layui-col-md2" id="mccms_right">
		    <div class="layui-row">
		        <div class="layui-card">
		            <div class="layui-card-header">Thông báo chính thức</div>
		            <div class="layui-card-body mccmsgg">
			        	<table class="layui-table" lay-skin="nob" lay-even lay-size="sm">
							<colgroup>
								<col>
								<col width="70">
							</colgroup>
							<tbody>
								<tr>
									<td><a href="http://www.mccms.cn/" target="_blank">1. Phiên bản mã nguồn mở Mancheng CMS 2020.03.01 chính thức được phát hành</a></td>
									<td>1 tháng trước</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
	        </div>
	    </div>-->
    </div>
</div>
<script type="text/javascript">
var config = <?=$config;?>;
$(function(){
	Admin.get_main();
});
</script>
</body>
</html>