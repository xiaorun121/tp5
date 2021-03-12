<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:82:"D:\phpstudy_pro\WWW\shangdonglichang/application/sdlcadmin\view\index\content.html";i:1615354248;}*/ ?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--360浏览器优先以webkit内核解析-->
    <title><?php echo $website['name']; ?></title>
    <link rel="shortcut icon" href="favicon.ico"> <link href="__ADMIN__/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="__ADMIN__/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="__ADMIN__/css/animate.min.css" rel="stylesheet">
    <link href="__ADMIN__/css/style.min862f.css?v=4.1.0" rel="stylesheet">
</head>

<body class="gray-bg">
    <div class="row  border-bottom white-bg dashboard-header">
        <!-- <div class="col-sm-3">
            <h2></h2>
            <small><a href="" target="_blank">全景医学上海中心手机站</a> </small><br><br><small>上海全景医学影像诊断中心微信二维码</small>
            <br>
            <br>
            <img src="__ADMIN__/img/qjewm.jpg" width="100%" style="max-width:264px;">
            <br>
        </div> -->
        <div class="col-sm-1"></div>
        <div class="col-sm-10">
            <h2><?php echo $website['name']; ?>定位：</h2>
            <p><?php echo $website['keywords']; ?></p>
            <p>
                <?php echo $website['description']; ?>
            </p>
            <p><img src="__UPLOADS__/<?php echo $website['logo']; ?>"  height: 75px; /></p>
            <br>
            <br>
            <p>
                <i class="fa fa-phone"> </i> 咨询热线：13671666073（微信同号）肖润

            </p>
        </div>
    </div>
    <script src="__ADMIN__/js/jquery.min.js?v=2.1.4"></script>
    <script src="__ADMIN__/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="__ADMIN__/js/plugins/layer/layer.min.js"></script>
    <script src="__ADMIN__/js/content.min.js"></script>
    <script src="__ADMIN__/js/welcome.min.js"></script>
</body>

</html>
