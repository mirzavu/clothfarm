<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
   <div class="page-header">
    <div class="container-fluid">
        <div class="pull-right">
            <div id="activate_product_btn">
                <button onclick="$('#form').submit();" type="submit" form="form-banner" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary">
                    <i class="fa fa-save"></i>
                </button>
            </div>
            <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default">
                <i class="fa fa-reply"></i>
            </a>
        </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
          <div id="veinteractive_main">
            <div class="ve_header">
                <label id="veChatInstalled" style="display:none" ><?php echo $veapi->isProductActive('vechat') ?></label>
                <label id="veContactInstalled" style="display:none" ><?php echo $veapi->isProductActive('vecontact') ?></label>
                <label id="veAdsInstalled" style="display:none" ><?php echo $veapi->isProductActive('veads') ?></label>
                <label id="veAssistInstalled" style="display:none" ><?php echo $veapi->isProductActive('veassist') ?></label>
                <div class="header_top content_grid">
                    <div class="left_header">
                        <img src="view/image/veplatform/main-logo.png"/ alt="VeInteractive"></img>
                    </div>

                    <div class="right_header">
                        <nav class="main_menu">
                          <ul>
                            <?php if($veapi->showLogin()) { ?>
                            <li>
                              <span class="cli_quest">
                                <?php echo $VE_ALREADY_CLIENT ?>
                              </span>
                              <a href="http://veplatform.veinteractive.com/Account/Login?ReturnUrl=%2f" target="_blank">
                                <?php echo $VE_LOGIN ?>
                              </a>
                            </li>
                            <?php } ?>
                          </ul>
                        </nav>
                    </div><!--FIN right_header-->
                </div><!--FIN header_top content_grid-->
                    <div class="faint-line">
                        <div class="main_messages content_grid">
                            <h2 class="thx-msg">
                                <?php echo $VE_THANK_YOU_FOR_INSTALLING ?>
                            </h2>
                            <h2 class="conf-msg">
                                <?php echo $VE_NOW_CHOOSE_APPLICATIONS ?>
                            </h2>
                        </div>
                    </div><!--FIN faint line-->
            </div><!--FIN ve_header-->

               <div class="ve_main">
                <div class="company_info content_grid">
                    <div class="logo_content">
                        <img src="view/image/veplatform/opencart_logo_blue.png" alt="Opencart_icon">
                    </div>
                    <div class="info_text">
                        <p><?php echo $VE_BY_INTEGRATING_VEPLATFORM ?></p>
                        <ul class="ve-list">
                            <li><?php echo $VE_REDUCE_BOUNCE_RATE ?></li>
                            <li><?php echo $VE_RECOVER_LOST_SALES ?></li>
                            <li><?php echo $VE_INCREASE_CONVERSION ?></li>
                            <li><?php echo $VE_REACH_PROSPECTS ?></li>
                        </ul>
                        <p><?php echo $VE_ACTIVATING_VE_APPS ?></p>
                    </div><!--fin info_text-->
                </div><!--FIN company_info content_grid-->
                <div class="product_activation">
                    <div class="product_activation_content content_grid">
                        <h2 class="product_act_title"><?php echo $VE_PLEASE_SELECT_APPS ?></h2>
                        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
                        <div id="veads-section" class="veads product">
                            <div id="veadsLogo" class="click_div" onclick="veLogo('adsCb')">
                                <div class="product_logo"></div>
                                <div class="product_name">
                                    <p><?php echo $VE_DYNAMIC_DISPLAY_ADVERTISING ?></p>
                                </div>
                                <input type="checkbox" id="adsCb" name="products[]" value="veads" checked></input>
                                <label for="adsCb"></label>
                            </div>
                            <a class="smooth_scroll" href="#veads_info_content">
                                <button id="veads_moreinfo" class="quest_btn" data-target="veads_info_content">
                                    <?php echo $VE_FIND_OUT_MORE ?> <span class="icons-pike"></span>
                                </button>
                            </a>
                        </div><!--FIN veads product-->
                         <div id="veassist-section" class="veassist product">
                            <div id="veassistLogo" class="click_div" onclick="veLogo('assistCb')">
                                <div class="product_logo"></div>
                                <div class="product_name">
                                    <p><?php echo $VE_SEARCH_OPTIMIZATION ?></p>
                                </div>
                                <input type="checkbox" id="assistCb" name="products[]" value="veassist" checked></input>
                                <label for="assistCb"></label>
                            </div>
                            <a class="smooth_scroll" href="#veassist_info_content">
                                <button id="veassist_moreinfo" class="quest_btn" data-target="veassist_info_content">
                                    <?php echo $VE_FIND_OUT_MORE ?> <span class="icons-pike"></span>
                                </button>
                            </a>
                        </div><!--FIN veassist product-->
                         <div id="vechat-section" class="vechat product">
                            <div id="vechatLogo" class="click_div" onclick="veLogo('chatCb')">
                                <div class="product_logo"></div>
                                <div class="product_name">
                                    <p><?php echo $VE_INCREASE_WEBSITE_CONVERSION ?></p>
                                </div>

                                <input type="checkbox" id="chatCb" name="products[]" value="vechat" checked></input>
                                <label for="chatCb"></label>
                            </div>
                            <a class="smooth_scroll" href="#vechat_info_content">
                                <button id="vechat_moreinfo" class="quest_btn" data-target="vechat_info_content">
                                    <?php echo $VE_FIND_OUT_MORE ?> <span class="icons-pike"></span>
                                </button>
                            </a>
                        </div><!--FIN vechat product-->
                        <div id="vecontact-section" class="vecontact product">
                            <div id="vecontactLogo" class="click_div" onclick="veLogo('contactCb')">
                                <div class="product_logo"></div>
                                <div class="product_name">
                                    <p><?php echo $VE_RECOVER_LOST_SHOPPING_CARTS ?></p>
                                </div>
                                <input type="checkbox" id="contactCb" name="products[]" value="vecontact" checked></input>
                                <label for="contactCb"></label>
                            </div>
                            <a class="smooth_scroll" href="#vecontact_info_content">
                                <button id="vecontact_moreinfo" class="quest_btn" data-target="vecontact_info_content">
                                    <?php echo $VE_FIND_OUT_MORE ?><span class="icons-pike"></span>
                                </button>
                            </a>
                        </div><!--FIN vecontact product-->
                        </form>

                        <div class="product-extra-info">
                            <div id="vechat_info_content" class="hidden">
                                <div class="extra_content content_grid">
                                    <h2 class="product_act_title">VeChat: <?php echo $VE_INCREASE_WEBSITE_CONVERSION ?></h2>
                                    <div class="product_logo"></div>
                                    <p>
                                        <?php echo $VE_DESCRIPTION_VECHAT ?>
                                     </p>
                                    <a class="smooth_scroll" href="#vechat-section"><button id="vechat_closeinfo" class="quest_btn"><?php echo $VE_CLOSE_APP_DETAILS ?></button></a>
                                </div>
                            </div>
                            <div id="vecontact_info_content" class="hidden">
                                <div class="extra_content content_grid">
                                    <h2 class="product_act_title">VeContact: <?php echo $VE_RECOVER_LOST_SHOPPING_CARTS ?></h2>
                                    <div class="product_logo"></div>
                                    <p>
                                        <?php echo $VE_DESCRIPTION_VECONTACT ?>
                                    </p>
                                    <a class="smooth_scroll" href="#vecontact-section"><button id="vecontact_closeinfo" class="quest_btn"><?php echo $VE_CLOSE_APP_DETAILS ?></button></a>
                                </div>
                            </div>
                            <div id="veassist_info_content" class="hidden">
                                <div class="extra_content content_grid">
                                    <h2 class="product_act_title">VeAssist: <?php echo $VE_SEARCH_OPTIMIZATION ?></h2>
                                    <div class="product_logo"></div>
                                    <p>
                                        <?php echo $VE_DESCRIPTION_VEASSIST ?>
                                    </p>
                                    <a class="smooth_scroll" href="#veassist-section"><button id="veassist_closeinfo" class="quest_btn"><?php echo $VE_CLOSE_APP_DETAILS ?></button></a>
                                </div>
                            </div>
                            <div id="veads_info_content" class="hidden">
                                <div class="extra_content content_grid">
                                    <h2 class="product_act_title">VeAds: <?php echo $VE_DYNAMIC_DISPLAY_ADVERTISING; ?></h2>
                                    <div class="product_logo"></div>
                                    <p><?php echo $VE_DESCRIPTION_VEADS; ?></p>
                                    <a class="smooth_scroll" href="#veads-section"><button id="veads_closeinfo" class="quest_btn"><?php echo $VE_CLOSE_APP_DETAILS; ?></button></a>
                                </div>
                            </div><!--FIN hidden-->
                        </div><!--FIN "product-extra-info-->
                    </div><!--FIN product_activation_content content_grid-->
                    <div class="a_product" id="activate_product">
                        <input onclick="$('#form').submit();" class="btn_product" type="submit" value="Confirm selection" name="formSubmit" id="confirm_selection_btn">
                    </div>
                </div><!--FIN product_activation-->

                <div class="legal_info content_grid">
                    <div class="info_text">
                        <p><?php echo $VE_INFO_LEGAL_TEXT; ?></p>
                    </div>
                </div><!--FIN legal_info content_grid-->
            </div><!--FIN ve_main-->

            <div class="ve_footer">
                <div class="footer-content content_grid">
                    <div class="footer-left">
                      <span><?php echo $VE_FOOTER_VEINTERACTIVE; ?></span>
                    </div>
                    <div class="footer-right">
                      <span><?php echo $VE_FOOTER_ALL_RIGHTS; ?>  <?php echo date("Y"); ?> <?php echo $VE_FOOTER_RESERVED; ?></span>
                    </div>
                    <div class="footer_img">
                        <img src="view/image/veplatform/opencart_logo_white.png" alt="Opencart_icon">
                    </div>
                </div><!--FIN footer-content content_grid-->
            </div><!--FIN ve_footer-->
        </div><!--fin veinteractive_main-->
    </div>  <!--- FIN content-->



<?php echo $footer; ?>