<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cấu hình Website</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="<?=Web_Base_Path?>admin/css/style.css">
    <script src="<?=Web_Base_Path?>jquery/jquery.min.js"></script>
    <!-- Hỗ trợ truy vấn phương tiện cho IE8/9, tương thích với lưới -->
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
        <a>Cấu hình Hệ thống</a>
        <a><cite>Cấu hình Website</cite></a>
    </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="Làm mới"><i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-card">
        <form class="layui-form" action="<?=links('setting','save')?>">
            <div class="layui-card-body">
                <div class="layui-tab layui-tab-brief" lay-filter="setting">

                    <ul class="layui-tab-title">
                        <li lay-id="t1" class="layui-this">Cấu hình Cơ bản</li>
                        <li lay-id="t2">Cấu hình An toàn</li>
                        <li lay-id="t3">Bình luận và Lưu ý</li>
                        <li lay-id="t4">Cấu hình URL</li>
                        <li lay-id="t5">Cấu hình SEO</li>
                        <li lay-id="t6">Cấu hình Ứng dụng công cộng</li>
                    </ul>

                    <div class="layui-tab-content">
                        <div class="layui-tab-item layui-show">
                            <div class="layui-text" style="max-width: 700px;padding-top: 25px;">
    <div class="layui-form-item w120">
        <label class="layui-form-label layui-form-required">Tên Website:</label>
        <div class="layui-input-block">
            <input type="text" name="Web_Name" placeholder="Tên Website" value="<?=Web_Name?>" class="layui-input" lay-verify="required" required/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label layui-form-required">Tên miền Website:</label>
        <div class="layui-input-block">
            <input type="text" name="Web_Url" placeholder="Tên miền Website" value="<?=Web_Url?>" class="layui-input pdl60" lay-verify="required" required/>
            <div class="select-ssl">
                <select name="Web_Ssl_Mode">
                    <option value="0">http://</option>
                    <option value="1">https://</option>
                </select>
            </div>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label layui-form-required">Thư mục cài đặt:</label>
        <div class="layui-input-block">
            <input type="text" name="Web_Path" placeholder="Thư mục cài đặt Website" value="<?=Web_Path?>" class="layui-input" lay-verify="required" required/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Tên miền truyện:</label>
        <div class="layui-input-block">
            <input type="text" name="Web_Book_Url" placeholder="Tên miền riêng cho phần truyện, để trống nếu giống với phần truyện tranh" value="<?=Web_Book_Url?>" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Chế độ Website:</label>
        <div class="layui-input-inline" style="display: block;width: auto;float: none;">
            <input lay-filter="none" xs="no" type="radio" name="Web_Mode" value="0" title="Mở"<?php if(Web_Mode == 0) echo ' checked';?>>
            <input lay-filter="none" xs="yes" type="radio" name="Web_Mode" value="1" title="Đóng"<?php if(Web_Mode == 1) echo ' checked';?>>
        </div>
    </div>
    <div class="layui-form-item w120" id="Web_Mode"<?php if(Web_Mode == 0) echo ' style="display: none;"';?>>
        <label class="layui-form-label">Thông báo khi đóng:</label>
        <div class="layui-input-block">
            <textarea name="Web_Close_Txt" placeholder="Thông báo khi đóng Website, hỗ trợ HTML" class="layui-textarea"><?=Web_Close_Txt?></textarea>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Số công bố Website:</label>
        <div class="layui-input-block">
            <input type="text" name="Web_Icp" placeholder="Số công bố Website" value="<?=Web_Icp?>" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Mã thống kê:</label>
        <div class="layui-input-block">
            <textarea name="Web_Stat" placeholder="Mã thống kê Website" class="layui-textarea"><?=Web_Stat?></textarea>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Thẻ chủ đề truyện:</label>
        <div class="layui-input-block">
            <textarea name="Web_Book_Tags" placeholder="Thẻ chủ đề truyện, nhiều thẻ cách nhau bằng dấu '|' " class="layui-textarea"><?=Web_Book_Tags?></textarea>
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
                            <div class="layui-form layui-text" style="max-width: 700px;padding-top: 25px;">
                                <div class="layui-form-item w120">
    <label class="layui-form-label layui-form-required">Mã xác thực phía sau:</label>
    <div class="layui-input-block">
        <input type="text" name="Admin_Code" placeholder="Mã xác thực đăng nhập phía sau" value="<?=Admin_Code?>" class="layui-input" lay-verify="required" required/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label layui-form-required">Số ngày lưu trữ nhật ký:</label>
    <div class="layui-input-block">
        <input type="text" name="Admin_Log_Day" placeholder="Số ngày lưu trữ nhật ký đăng nhập quản trị viên" value="<?=Admin_Log_Day?>" class="layui-input" lay-verify="number"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Danh sách trắng IP phía sau:</label>
    <div class="layui-input-block">
        <textarea name="Admin_Ip" placeholder="Danh sách trắng IP phía sau, sử dụng “|” để phân tách nhiều IP, để trống nếu không giới hạn" class="layui-textarea"><?=Admin_Ip?></textarea>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Mật khẩu nhập kho từ bên ngoài:</label>
    <div class="layui-input-block">
        <input type="text" name="Web_Rkpass" placeholder="Mật khẩu nhập kho từ bên ngoài" value="<?=Web_Rkpass?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">QQ hỗ trợ khách hàng:</label>
    <div class="layui-input-block">
        <input type="text" name="Web_QQ" placeholder="QQ liên hệ hỗ trợ khách hàng" value="<?=Web_QQ?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Điện thoại hỗ trợ khách hàng:</label>
    <div class="layui-input-block">
        <input type="text" name="Web_Tel" placeholder="Điện thoại liên hệ hỗ trợ khách hàng" value="<?=Web_Tel?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Email hỗ trợ khách hàng:</label>
    <div class="layui-input-block">
        <input type="text" name="Web_Mail" placeholder="Email liên hệ hỗ trợ khách hàng" value="<?=Web_Mail?>" class="layui-input"/>
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
                            <div class="layui-form layui-text" style="max-width: 700px;padding-top: 25px;">
                                <div class="layui-form-item w120">
    <label class="layui-form-label">Chế độ bình luận:</label>
    <div class="layui-input-inline" style="display: block;width: auto;float: none;">
        <input type="radio" name="Pl_Mode" value="0" title="Mở"<?php if(Pl_Mode == 0) echo ' checked';?>>
        <input type="radio" name="Pl_Mode" value="1" title="Đóng"<?php if(Pl_Mode == 1) echo ' checked';?>>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Thời gian giữa các bình luận (giây):</label>
    <div class="layui-input-block">
        <input type="text" name="Pl_Time" placeholder="Thời gian giữa các bình luận, nếu nhỏ hơn sẽ được xem là spam" value="<?=Pl_Time?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Số lượng bình luận tối đa mỗi ngày:</label>
    <div class="layui-input-block">
        <input type="text" name="Pl_Add_Num" placeholder="Số lượng bình luận tối đa mỗi ngày, 0 là không giới hạn" value="<?=Pl_Add_Num?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Từ khóa lọc:</label>
    <div class="layui-input-block">
        <textarea name="Pl_Str" placeholder="Từ khóa lọc khi bình luận, sử dụng “|” để phân tách" class="layui-textarea" style="min-height: 100px;"><?=Pl_Str?></textarea>
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
                            <div class="layui-text" style="max-width: 900px;padding-top: 25px;">
                                <div class="layui-form-item w120">
    <label class="layui-form-label">Chế độ chạy:</label>
    <div class="layui-input-inline" style="display: block;width: auto;float: none;">
        <input lay-filter="none" nid="1" type="radio" name="Url_Mode" value="0" title="Động"<?php if(Url_Mode == 0) echo ' checked';?>>
        <input lay-filter="none" nid="2" type="radio" name="Url_Mode" value="1" title="Tĩnh"<?php if(Url_Mode == 1) echo ' checked';?>>
    </div>
</div>

                                <div id="Url_Mode1"<?php if(Url_Mode == 1) echo ' style="display: none;"';?>>
                                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend style="font-size:15px;">Định tuyến truyện tranh</legend>
</fieldset>
<div class="layui-form-item w120">
    <label class="layui-form-label">Định tuyến trang danh mục:</label>
    <div class="layui-inline select120">
        <select name="" data-id="Url_Web_List" lay-filter="url">
            <option value="">Cấu trúc thông dụng</option>
            <option value="<?=Web_Path?>lists/[id]/[page]">1.lists/id/page</option>
            <option value="<?=Web_Path?>lists/[en]/[page]">2.lists/en/page</option>
            <option value="<?=Web_Path?>lists_[id]_[page].html">3.lists_id_page.html</option>
            <option value="<?=Web_Path?>lists_[en]_[page].html">4.lists_en_page.html</option>
            <option value="<?=Web_Path?>lists-[id]-[page].html">5.lists-id-page.html</option>
            <option value="<?=Web_Path?>lists-[en]-[page].html">6.lists-en-page.html</option>
        </select>
    </div>
    <div class="layui-inline w400">
        <input type="text" name="Url_Web_List" placeholder="URL định tuyến danh mục, có thể sử dụng các thẻ: [id]、[en]、[page]" value="<?=Url_Web_List?>" class="layui-input"/>
    </div>
</div>

                                    <div class="layui-form-item w120">
    <label class="layui-form-label">Đường dẫn trang nội dung:</label>
    <div class="layui-inline select120">
        <select name="" data-id="Url_Web_Show" lay-filter="url">
            <option value="">Cấu trúc thông thường</option>
            <option value="<?=Web_Path?>comic/[id]">1.comic/id</option>
            <option value="<?=Web_Path?>comic/[en]">2.comic/en</option>
            <option value="<?=Web_Path?>comic_[id].html">3.comic_id.html</option>
            <option value="<?=Web_Path?>comic_[en].html">4.comic_en.html</option>
            <option value="<?=Web_Path?>comic-[id].html">5.comic-id.html</option>
            <option value="<?=Web_Path?>comic-[en].html">6.comic-en.html</option>
        </select>
    </div>
    <div class="layui-inline w400">
        <input type="text" name="Url_Web_Show" placeholder="Đường dẫn URL trang nội dung, có thể sử dụng các thẻ: [id], [en]" value="<?=Url_Web_Show?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Đường dẫn trang đọc:</label>
    <div class="layui-inline select120">
        <select name="" data-id="Url_Web_Pic" lay-filter="url">
            <option value="">Cấu trúc thông thường</option>
            <option value="<?=Web_Path?>chapter/[mid]/[id]">1.chapter/mid/id</option>
            <option value="<?=Web_Path?>chapter_[mid]_[id].html">2.chapter_mid_id.html</option>
            <option value="<?=Web_Path?>chapter-[mid]-[id].html">3.chapter-mid-id.html</option>
            <option value="<?=Web_Path?>chapter/[id]">4.chapter/id</option>
            <option value="<?=Web_Path?>chapter_[id].html">5.chapter_id.html</option>
            <option value="<?=Web_Path?>chapter-[id].html">6.chapter-id.html</option>
        </select>
    </div>
    <div class="layui-inline w400">
        <input type="text" name="Url_Web_Pic" placeholder="Đường dẫn URL trang đọc, có thể sử dụng các thẻ: [mid], [id]" value="<?=Url_Web_Pic?>" class="layui-input"/>
    </div>
</div>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend style="font-size:15px;">Đường dẫn tiểu thuyết</legend>
</fieldset>


                                    <div class="layui-form-item w120">
    <label class="layui-form-label">Trang phân loại:</label>
    <div class="layui-inline select120">
        <select name="" data-id="Url_Book_Web_List" lay-filter="url">
            <option value="">Cấu trúc phổ biến</option>
            <option value="<?=Web_Path?>book/lists/[id]/[page]">1.book/lists/id/page</option>
            <option value="<?=Web_Path?>book/lists/[en]/[page]">2.book/lists/en/page</option>
            <option value="<?=Web_Path?>book_lists_[id]_[page].html">3.book_lists_id_page.html</option>
            <option value="<?=Web_Path?>book_lists_[en]_[page].html">4.book_lists_en_page.html</option>
            <option value="<?=Web_Path?>book-lists-[id]-[page].html">5.book-lists-id-page.html</option>
            <option value="<?=Web_Path?>book-lists-[en]-[page].html">6.book-lists-en-page.html</option>
        </select>
    </div>
    <div class="layui-inline w400">
        <input type="text" name="Url_Book_Web_List" placeholder="Đường dẫn phân loại URL, có thể sử dụng các thẻ: [id]、[en]、[page]" value="<?=Url_Book_Web_List?>" class="layui-input"/>
    </div>
</div>

                                    <div class="layui-form-item w120">
    <label class="layui-form-label">Đường dẫn trang nội dung:</label>
    <div class="layui-inline select120">
        <select name="" data-id="Url_Book_Web_Info" lay-filter="url">
            <option value="">Cấu trúc phổ biến</option>
            <option value="<?=Web_Path?>book/info/[id]">1.book/info/id</option>
            <option value="<?=Web_Path?>book/info/[en]">2.book/info/en</option>
            <option value="<?=Web_Path?>book_info_[id].html">3.book_info_id.html</option>
            <option value="<?=Web_Path?>book_info_[en].html">4.book_info_en.html</option>
            <option value="<?=Web_Path?>book-info-[id].html">5.book-info-id.html</option>
            <option value="<?=Web_Path?>book-info-[en].html">6.book-info-en.html</option>
        </select>
    </div>
    <div class="layui-inline w400">
        <input type="text" name="Url_Book_Web_Info" placeholder="Đường dẫn nội dung URL, có thể sử dụng các thẻ: [id]、[en]" value="<?=Url_Book_Web_Info?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Đường dẫn trang đọc:</label>
    <div class="layui-inline select120">
        <select name="" data-id="Url_Book_Web_Read" lay-filter="url">
            <option value="">Cấu trúc phổ biến</option>
            <option value="<?=Web_Path?>book/read/[bid]/[id]">1.book/read/bid/id</option>
            <option value="<?=Web_Path?>book_read_[bid]_[id].html">2.book_read_bid_id.html</option>
            <option value="<?=Web_Path?>book-read-[bid]-[id].html">3.book-read-bid-id.html</option>
        </select>
    </div>
    <div class="layui-inline w400">
        <input type="text" name="Url_Book_Web_Read" placeholder="Đường dẫn đọc URL, có thể sử dụng các thẻ: [bid]，[id]" value="<?=Url_Book_Web_Read?>" class="layui-input"/>
    </div>
</div>

                                    <div class="layui-form-item w120">
    <label class="layui-form-label">Loại bỏ index.php:</label>
    <div class="layui-input-inline" style="display: block;width: auto;float: none;">
        <input lay-filter="index-mode" type="radio" name="Url_Index_Mode" value="0" title="Giữ lại"<?php if(Url_Index_Mode == 0) echo ' checked';?>>
        <input lay-filter="index-mode" type="radio" name="Url_Index_Mode" value="1" title="Loại bỏ"<?php if(Url_Index_Mode == 1) echo ' checked';?>>
    </div>
</div>
<blockquote class="layui-elem-quote layui-quote-nm l40"<?php if(Url_Index_Mode == 0) echo ' style="display: none;"';?>>
    Thông báo：<br>
    Nếu bật chức năng loại bỏ index.php, cần sử dụng các quy tắc giả tĩnh.<br>
    Mỗi môi trường WEB có quy tắc giả tĩnh khác nhau<br>
    Hệ thống đã viết sẵn quy tắc cho mỗi môi trường, tệp tin tại thư mục <font color=red>./rewrite/</font><br>
    1. Định dạng .htaccess---> cho apache hoặc IIS6.0+Rewrite3, thường đặt quy tắc trong thư mục gốc của trang web<br>
    2. Định dạng .conf---> Thường dùng cho nginx, sao chép nội dung của tệp tin vào tệp cấu hình<br>
    3. Định dạng httpd.ini---> Thường dùng cho IIS6.0+Rewrite2, thường đặt tại thư mục gốc của trang web<br>
    4. Định dạng web.config---> Thường dùng cho IIS7 trở lên, vui lòng sử dụng định dạng .htaccess sau đó nhập vào
</blockquote>

                                </div>
                                <div id="Url_Mode2"<?php if(Url_Mode == 0) echo ' style="display: none;"';?>>
                                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend style="font-size:15px;">Cấu hình tĩnh cho phiên bản di động của truyện tranh</legend>
</fieldset>
<div class="layui-form-item w120">
    <label class="layui-form-label">Thư mục phiên bản di động:</label>
    <div class="layui-input-block w400">
        <input type="text" name="Wap_Html_Dir" placeholder="Thư mục tĩnh cho phiên bản di động của truyện tranh" value="<?=Wap_Html_Dir?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">Tên miền phiên bản di động:</label>
    <div class="layui-input-block">
        <input type="text" name="Wap_Html_Url" placeholder="Tên miền của phiên bản di động của truyện tranh, ví dụ: m.mccms.com, miền này được liên kết với thư mục <?=FCPATH.Wap_Html_Dir?>, để trống là sử dụng tên miền chính" value="<?=Wap_Html_Url?>" class="layui-input"/>
    </div>
</div>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend style="font-size:15px;">Quy tắc tĩnh cho truyện tranh</legend>
</fieldset>
<div class="layui-form-item w120">
    <label class="layui-form-label">URL trang chủ:</label>
    <div class="layui-inline select120">
        <select name="" data-id="Url_Html_Index" lay-filter="url">
            <option value="">Cấu trúc phổ biến</option>
            <option value="<?=Web_Path?>index.html">1.index.html</option>
            <option value="<?=Web_Path?>index.shtml">2.index.shtml</option>
            <option value="<?=Web_Path?>index.htm">3.index.htm</option>
            <option value="<?=Web_Path?>index.shtm">4.index.shtm</option>
        </select>
    </div>
    <div class="layui-inline w400">
        <input type="text" name="Url_Html_Index" placeholder="Tệp tin trang chủ tĩnh" value="<?=Url_Html_Index?>" class="layui-input"/>
    </div>
</div>

                                    <div class="layui-form-item w120">
    <label class="layui-form-label">URL trang phân loại:</label>
    <div class="layui-inline select120">
        <select name="" data-id="Url_Html_List" lay-filter="url">
            <option value="">Cấu trúc phổ biến</option>
            <option value="<?=Web_Path?>list/[id]/[page]/">1.list/id/page/</option>
            <option value="<?=Web_Path?>list/[en]/[page]/">2.list/en/page/</option>
            <option value="<?=Web_Path?>list_[id]_[page].html">3.list_id_page.html</option>
            <option value="<?=Web_Path?>list_[en]_[page].html">4.list_en_page.html</option>
            <option value="<?=Web_Path?>list-[id]-[page].html">5.list-id-page.html</option>
            <option value="<?=Web_Path?>list-[en]-[page].html">6.list-en-page.html</option>
        </select>
    </div>
    <div class="layui-inline w400">
        <input type="text" name="Url_Html_List" placeholder="URL tĩnh cho trang phân loại, có thể sử dụng các thẻ: [id]、[en]、[page]" value="<?=Url_Html_List?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">URL trang nội dung:</label>
    <div class="layui-inline select120">
        <select name="" data-id="Url_Html_Show" lay-filter="url">
            <option value="">Cấu trúc phổ biến</option>
            <option value="<?=Web_Path?>comic/[id]/">1.comic/id/</option>
            <option value="<?=Web_Path?>comic/[en]/">2.comic/en/</option>
            <option value="<?=Web_Path?>comic_[id].html">3.comic_id.html</option>
            <option value="<?=Web_Path?>comic_[en].html">4.comic_en.html</option>
            <option value="<?=Web_Path?>comic-[id].html">5.comic-id.html</option>
            <option value="<?=Web_Path?>comic-[en].html">6.comic-en.html</option>
        </select>
    </div>
    <div class="layui-inline w400">
        <input type="text" name="Url_Html_Show" placeholder="URL tĩnh cho trang nội dung, có thể sử dụng các thẻ: [id]、[en]" value="<?=Url_Html_Show?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">URL trang đọc:</label>
    <div class="layui-inline select120">
        <select name="" data-id="Url_Html_Pic" lay-filter="url">
            <option value="">Cấu trúc phổ biến</option>
            <option value="<?=Web_Path?>chapter/[mid]/[id]/">1.chapter/mid/id/</option>
            <option value="<?=Web_Path?>chapter_[mid]_[id].html">2.chapter_mid_id.html</option>
            <option value="<?=Web_Path?>chapter-[mid]-[id].html">3.chapter-mid-id.html</option>
            <option value="<?=Web_Path?>chapter/[id]/">4.chapter/id/</option>
            <option value="<?=Web_Path?>chapter_[id].html">5.chapter_id.html</option>
            <option value="<?=Web_Path?>chapter-[id].html">6.chapter-id.html</option>
        </select>
    </div>
    <div class="layui-inline w400">
        <input type="text" name="Url_Html_Pic" placeholder="URL tĩnh cho trang đọc, có thể sử dụng các thẻ: [mid]，[id]" value="<?=Url_Html_Pic?>" class="layui-input"/>
    </div>
</div>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend style="font-size:15px;">Cấu hình tĩnh cho phiên bản di động của tiểu thuyết</legend>
</fieldset>
<div class="layui-form-item w120">
    <label class="layui-form-label">Thư mục phiên bản di động:</label>
    <div class="layui-input-block w400">
        <input type="text" name="Wap_Book_Html_Dir" placeholder="Thư mục tĩnh cho phiên bản di động của tiểu thuyết" value="<?=Wap_Book_Html_Dir?>" class="layui-input"/>
    </div>
</div>

                                    <div class="layui-form-item w120">
    <label class="layui-form-label">Tên miền phiên bản di động:</label>
    <div class="layui-input-block">
        <input type="text" name="Wap_Book_Html_Url" placeholder="Tên miền phiên bản di động của tiểu thuyết: ví dụ: m.mccms.com, miền này liên kết đến thư mục <?=FCPATH.Wap_Book_Html_Dir?>, để trống là sử dụng tên miền chính" value="<?=Wap_Book_Html_Url?>" class="layui-input"/>
    </div>
</div>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend style="font-size:15px;">Quy tắc tĩnh cho tiểu thuyết</legend>
</fieldset>
<div class="layui-form-item w120">
    <label class="layui-form-label">URL trang chủ:</label>
    <div class="layui-inline select120">
        <select name="" data-id="Url_Book_Html_Index" lay-filter="url">
            <option value="">Cấu trúc phổ biến</option>
            <option value="<?=Web_Path?>book/">1.book/</option>
            <option value="<?=Web_Path?>book/index.shtml">2.book/index.shtml</option>
            <option value="<?=Web_Path?>book/index.htm">3.book/index.htm</option>
            <option value="<?=Web_Path?>book/index.shtm">4.book/index.shtm</option>
        </select>
    </div>
    <div class="layui-inline w400">
        <input type="text" name="Url_Book_Html_Index" placeholder="Tệp tin trang chủ tĩnh" value="<?=Url_Book_Html_Index?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">URL trang phân loại:</label>
    <div class="layui-inline select120">
        <select name="" data-id="Url_Book_Html_List" lay-filter="url">
            <option value="">Cấu trúc phổ biến</option>
            <option value="<?=Web_Path?>book/list/[id]/[page]/">1.book/list/id/page/</option>
            <option value="<?=Web_Path?>book/list/[en]/[page]/">2.book/list/en/page/</option>
            <option value="<?=Web_Path?>book/list/[id]_[page].html">3.book/list/id_page.html</option>
            <option value="<?=Web_Path?>book/list/[en]_[page].html">4.book/list/en_page.html</option>
            <option value="<?=Web_Path?>book/list/[id]-[page].html">5.book/list/id-page.html</option>
            <option value="<?=Web_Path?>book/list/[en]-[page].html">6.book/list/en-page.html</option>
        </select>
    </div>
    <div class="layui-inline w400">
        <input type="text" name="Url_Book_Html_List" placeholder="URL tĩnh cho trang phân loại, có thể sử dụng các thẻ: [id]、[en]、[page]" value="<?=Url_Book_Html_List?>" class="layui-input"/>
    </div>
</div>

                                    <div class="layui-form-item w120">
    <label class="layui-form-label">URL trang nội dung:</label>
    <div class="layui-inline select120">
        <select name="" data-id="Url_Book_Html_Info" lay-filter="url">
            <option value="">Cấu trúc phổ biến</option>
            <option value="<?=Web_Path?>book/info/[id]/">1.book/info/id/</option>
            <option value="<?=Web_Path?>book/info/[en]/">2.book/info/en/</option>
            <option value="<?=Web_Path?>book/info_[id].html">3.book/info_id.html</option>
            <option value="<?=Web_Path?>book/info_[en].html">4.book/info_en.html</option>
            <option value="<?=Web_Path?>book/info-[id].html">5.book/info-id.html</option>
            <option value="<?=Web_Path?>book/info-[en].html">6.book/info-en.html</option>
        </select>
    </div>
    <div class="layui-inline w400">
        <input type="text" name="Url_Book_Html_Info" placeholder="URL tĩnh cho trang nội dung, có thể sử dụng các thẻ: [id]、[en]" value="<?=Url_Book_Html_Info?>" class="layui-input"/>
    </div>
</div>
<div class="layui-form-item w120">
    <label class="layui-form-label">URL trang đọc:</label>
    <div class="layui-inline select120">
        <select name="" data-id="Url_Book_Html_Read" lay-filter="url">
            <option value="">Cấu trúc phổ biến</option>
            <option value="<?=Web_Path?>book/read/[bid]/[id]/">1.book/read/bid/id/</option>
            <option value="<?=Web_Path?>book/read/[bid]_[id].html">2.book/read/bid_id.html</option>
            <option value="<?=Web_Path?>book/read/[bid]-[id].html">3.book/read/bid-id.html</option>
        </select>
    </div>
    <div class="layui-inline w400">
        <input type="text" name="Url_Book_Html_Read" placeholder="URL tĩnh cho trang đọc, có thể sử dụng các thẻ: [bid]，[id]" value="<?=Url_Book_Html_Read?>" class="layui-input"/>
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
                        <div class="layui-tab-item">
                            <div class="layui-form layui-text" style="max-width: 700px;padding-top: 25px;">
    <div class="layui-form-item w120">
        <label class="layui-form-label layui-form-required">Đường dẫn đính kèm:</label>
        <div class="layui-input-block">
            <input type="text" name="Web_Base_Path" placeholder="Mặc định trong thư mục pccks dưới thư mục gốc của trang web, ví dụ: http://cdn.abc.com/" value="<?=Web_Base_Path?>" class="layui-input" lay-verify="required" required/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Tiêu đề trang web:</label>
        <div class="layui-input-block">
            <input type="text" name="Seo_Title" placeholder="Tiêu đề trang web" value="<?=Seo_Title?>" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Từ khóa trang web:</label>
        <div class="layui-input-block">
            <textarea name="Seo_Keywords" placeholder="Từ khóa trang web" class="layui-textarea"><?=Seo_Keywords?></textarea>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Mô tả trang web:</label>
        <div class="layui-input-block">
            <textarea name="Seo_Description" placeholder="Mô tả trang web, giới hạn trong 80 ký tự tiếng Trung hoặc 160 ký tự" class="layui-textarea"><?=Seo_Description?></textarea>
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
                            <div class="layui-form layui-text" style="max-width: 700px;padding-top: 25px;">
    <div class="layui-form-item w120">
        <label class="layui-form-label">Mã thông báo (Token):</label>
        <div class="layui-input-block">
            <input type="text" name="Wx_Token" placeholder="Mã thông báo (Token) cho việc giao tiếp giữa công cộng và trang web, xem trong nền tảng công cộng" value="<?=Wx_Token?>" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Nội dung phản hồi khi theo dõi:</label>
        <div class="layui-input-block">
            <textarea name="Wx_Gz_Msg" placeholder="Nội dung phản hồi khi người dùng theo dõi" class="layui-textarea" style="min-height: 100px;"><?=Wx_Gz_Msg?></textarea>
        </div>
    </div>
    <div class="layui-form-item w120">
        <label class="layui-form-label">Nội dung phản hồi theo từ khóa:</label>
        <div class="layui-input-block">
            <textarea name="Wx_Key_Msg" placeholder="Định dạng: Từ khóa|Nội dung phản hồi, mỗi dòng một cặp" class="layui-textarea" style="min-height: 100px;"><?=Wx_Key_Msg?></textarea>
        </div>
    </div>
    <blockquote class="layui-elem-quote layui-quote-nm">
        Thông báo:<br>
        1. Đăng nhập vào tài khoản công cộng WeChat - Phát triển - Cấu hình cơ bản - Sửa đổi cấu hình máy chủ<br>
        2. Địa chỉ máy chủ (URL): <?=(is_ssl()?'https://':'http://').Web_Url.Web_Path.(Url_Index_Mode==0?'index.php/':'')?>api/wxapp<br>
        3. Mã thông báo (Token) cần phải giống với mã bạn điền vào ở phần quản trị, sau đó kích hoạt nó.
    </blockquote>
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
layui.use(['layer', 'form'], function () {
    var form = layui.form,
        layer = layui.layer;
    //Nghe tĩnh
    form.on('radio(index-mode)', function (r) {
        if(r.value == '1'){
            $('blockquote').show();
        }else{
            $('blockquote').hide();
        }
    });
    form.on('select(url)', function (r) {
        var _id = $(r.elem).attr('data-id');
        console.log(_id);
        $("input[name='"+_id+"']").val(r.value);
    });
    var tps = '';
    $('.layui-input,.layui-textarea').click(function(){
        if($(this).attr('placeholder') != tps){
            tps = $(this).attr('placeholder');
            layer.tips(tps, $(this),{tips:1});    
        }
    });
});
</script>
</body>
</html>