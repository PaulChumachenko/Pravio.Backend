<?php

include('kcaptcha/kcaptcha.php');
session_start();
require_once("config.php");


if ($_POST['act']== "y")
{
if(isset($_SESSION['captcha_keystring']) && $_SESSION['captcha_keystring'] ==  $_POST['keystring'])
{

if (isset($_POST['posName']) && $_POST['posName'] == "")
{
$statusError = "$errors_name";
}
elseif (isset($_POST['posEmail']) && $_POST['posEmail'] == "")
{
$statusError = "$errors_mailfrom";
}
elseif(isset($_POST['posEmail']) && !preg_match("/^([a-z,._,0-9])+@([a-z,._,0-9])+(.([a-z])+)+$/", $_POST['posEmail']))
{
$statusError = "$errors_incorrect";

unset($_POST['posEmail']);
}
elseif (isset($_POST['posRegard']) && $_POST['posRegard'] == "")
{
$statusError = "$errors_subject";
}
elseif (isset($_POST['posText']) && $_POST['posText'] == "")
{
$statusError = "$errors_message";
}

elseif (!empty($_POST))
{
$headers  = "MIME-Version: 1.0\r\n";
$headers .= "Content-Type: $content  charset=$charset\r\n";
$headers .= "Date: ".date("Y-m-d (H:i:s)",time())."\r\n";
$headers .= "From: \"".$_POST['posName']."\" <".$_POST['posEmail'].">\r\n";
$headers .= "X-Mailer: My Send E-mail\r\n";

mail($mailto,$subject,$message,$headers);

unset($name, $posText, $mailto, $subject, $posRegard, $message);

$statusSuccess = "$send";
}

}else{
$statusError = "$captcha_error";
unset($_SESSION['captcha_keystring']);
}
}
?>

<html>
<head>
    <title>Обратная связь</title>
    <link href="styling.css" rel="stylesheet" type="text/css" media='screen,projection' />
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="author" content="name2" />
    <link rel="stylesheet" type="text/css" href="../style.css" />
    <style>
        label{
            padding-left: 10px;
            text-align: left;
        }
    </style>
</head>
<body>


    
<div id="top_bg">
    <center>
        <div id="top">
            <div id="logo">
                <a href="../index.htm"><img src="../images/logo.png" /></a>
            </div>
            <div id="top_menu">
                <a class="top_menu_item" href="../index.htm">Home</a>
                <a class="top_menu_item" href="#">About Us</a>
                <a class="top_menu_item" href="#">Portfolio</a>
                <a class="top_menu_item" href="/photo/sendmail">Contacts</a>
            </div>
        </div>
    </center>
</div>

<center>
    
    <div class="separator"></div>

    <div id="container">
        <div class="line"></div>
        <h2 class="header">Lorem ipsum dolor sit amet</h2>
        <p class="par-14">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dius tellus.<br />Donec ante dolor, iaculis nec, gravida ac, cursus in, eros.</p>
        <a href="../index.htm" class="circle celeste">
            <img src="../images/camera.png" /><br />Главная
        </a>
        <a href="#" class="circle green">
            <img src="../images/camera.png" /><br />Обо мне
        </a>
        <a href="#" class="circle red">
            <img src="../images/camera.png" /><br />Портфолио
        </a>
        <a href="/photo/sendmail" class="circle orange">
            <img src="../images/devices.png" /><br />Контакты
        </a>
    </div>
    
    <div class="separator"></div>
    
    <div id="posts">
        <div class="line"></div>
    </div>
</center>   

<center>
<div id="contact">
        <div id="contactInfo">
            <h2 class="header" align="left">Свяжитесь со мной по телефону</h2>
            <h2 class="status">066-16-46-777</h2>
            <h2 class="status">093-60-65-294</h2>
            <br /><br /><br />
            <h2 class="header" align="left">Или найдите меня в социальных сетях</h2>
            <table id="contactInfoTable">
                <tr>
                    <td class="socialLinkTD">
                        <a href="http://vk.com/olenamart">
                            <img src="../images/vk.png" class="socialLink" />
                        </a>
                    </td>
                    <td class="socialLinkTD">
                        <a href="https://www.facebook.com/">
                            <img src="../images/fb.png" class="socialLink" />
                        </a>
                    </td>
                    <td class="socialLinkTD">
                        <a href="http://www.flickr.com/photos/106590477@N08/">
                            <img src="../images/flickr.png" class="socialLink" />
                        </a>
                    </td>
                </tr>
            </table>
        </div>
    
        <div id="contactForm">
            <center><h2 class="header">Обратная связь</h2></center>
            <h2 class="status" style="color:#6fc125;">
                <?php echo "$statusSuccess" ?>
            </h2>
            <h2 class="status" style="color:#ff5649;">
               <?php echo "$statusError" ?>
            </h2>

            <div id="contactFormArea">
                <form action="./" method="post" id="cForm">
                    <input type="hidden" name="act" value="y" />
                        <fieldset>
                            <p class="label"><label for="posName" >Ваше имя:</label></p>
                            <input class="text" type="text" size="25" name="posName" id="posName" />
                            <p class="label"><label for="posEmail">Ваш E-mail адрес:</label></p>
                            <input class="text" type="text" size="25" name="posEmail" id="posEmail" />
                            <p class="label"><label for="posRegard">Тема сообщения:</label></p>
                            <input class="text" type="text" size="25" name="posRegard" id="posRegard" />
                            <p class="label"><label for="posText">Сообщение:</label></p>
                            <textarea cols="50" rows="20" name="posText" id="posText"></textarea>
                            <br />
                           <p class="label"><label for="posCaptcha">Текст на изображении (цифры):</label></p>                            
                            <table border="0" align="left" class="captcha">
                                <tr>
                                    <td>
                                        <img id="captchImg" src="kcaptcha?<?php echo session_name() ?>=<?php echo session_id() ?>" >
                                    </td>
                                    <td>
                                        <input class="text" type="text" size="25" name="keystring" id="keystring" />
                                    </td>
                                </tr>
                            </table>
                            <br /><br />
                            <input class="submit" type="submit" name="selfCC" id="selfCC" value=" Отправить " />
                        </fieldset>
                    <?php include 'kcaptcha/kcaptcha_rand.php' ?>
                </form>
            </div>
        </div>
    </div>
    </center>


   <center> 
       <div id="posts">
            <div class="line"></div>
       </div>
    </center>

<div id="footer">
    <div id="footer_line">
    <center>
        <div id="footer_cont">
            <div id="terms">
                <p class="par-12" align="justify">Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                Dius tellus. Donec ante dolor, iaculis nec, gravida ac, cursus in, eros.
                Mauris vestibulum, felis et egestasullamcorper, purus nibh vehicula sem, eu egestas antenisl non justo. 
                Fusce tincidunt, lorem nev dapibusconsectetuer, leo orci mollis ipsum, eget suscipit erospurus in ante.</p>
            </div>
            <div id="social">Social buttons</div>
            <div id="copyright">
                <p class="par-14">&copy;<font color="black">Olena</font><font color="#b73958">Mart</font> 2014</p>
            </div>
        </div>
    </center>
    </div>
</div>

</body>
</html>