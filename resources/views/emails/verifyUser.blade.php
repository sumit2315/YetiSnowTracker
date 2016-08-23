@include('emails.emailHeader')
<tr style='background: none repeat scroll 0% 0% rgb(255, 255, 255);'> 
    <td> 
        <table width='100%' cellspacing='0' cellpadding='0'>
            <tr>
                <td colspan='4' style='padding: 0px 0px 2px; text-align: center;
                    font-size: 20px; font-family:Antic Slab;'>
                    <table width='100%' border='0'
                           cellspacing='0' cellpadding='0'>
                        <tr>
                            <td align='left' valign='top' style='padding:5px 0px 16px 10px;'>
                                <table width='99%' border='0' cellspacing='0' cellpadding='0'  style='float:left; margin-right:10px;text-align: justify;'>
                                    <tr> 
                                        <td style='color: #212121;font-size: 16px;line-height:
                                            24px;font-family:Antic Slab;'>
                                        </td> 
                                    </tr> 
                                    <tr> 
                                        <td style='color: #212121;font-size: 16px;line-height:
                                            24px;font-family:Antic Slab;'>
                                            Hello   <?php echo $name; ?>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td style='color: #212121;font-size: 16px;line-height:
                                            24px;font-family:Antic Slab;'>
                                            <br>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td style='color: #212121;font-size: 16px;line-height:
                                            24px;font-family:Antic Slab;'>
                                            Greeting for the day.
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td style='color: #212121;font-size: 16px;line-height:
                                            24px;font-family:Antic Slab;'>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style='color: #212121;font-size: 16px;line-height:
                                            24px;font-family:Antic Slab;'>
                                            Thanks for using our services ,please find your login credentials below:
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style='color: #212121;font-size: 16px;line-height:
                                            24px;font-family:Antic Slab;'>
                                            Login Sub-Domain Url : <b><?php echo $subdomain; ?></b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style='color: #212121;font-size: 16px;line-height:
                                            24px;font-family:Antic Slab;'>
                                            Login Email : <b><?php echo $email; ?></b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style='color: #212121;font-size: 16px;line-height:
                                            24px;font-family:Antic Slab;'>
                                            Login Password : <b><?php echo $password; ?></b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style='color: #212121;font-size: 16px;line-height:
                                            24px;font-family:Antic Slab;'>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style='color: #212121;font-size: 20px;line-height:
                                            24px;font-family:Antic Slab;'>
                                            <b>NOTE*</b> : Please click <a href="<?php echo "http://".$url; ?>">Activation Link!!</a> to activate your account.
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style='color: #212121;font-size: 16px;line-height:
                                            24px;font-family:Antic Slab;'>
                                            Regards,
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style='color: #212121;font-size: 16px;line-height:
                                            24px;font-family:Antic Slab;'>
                                            Team Yeti Snow Tracker
                                        </td>
                                    </tr>
                                    @include('emails.emailFooter')
