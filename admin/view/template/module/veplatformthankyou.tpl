
<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <!--<button onclick="$('#form').submit();" type="submit" form="form-banner" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary">
          <i class="fa fa-save"></i>
        </button>-->
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default">
              <i class="fa fa-reply"></i>
        </a>
      </div>
      <h1>
        <?php echo $heading_title; ?>
      </h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="box">
    <div class="content">
      <div id="veinteractive_main">
        <div class="ve_header">
          <div class="header_top content_grid">
            <div class="left_header">
              <img src="view/image/veplatform/main-logo.png"/ alt="VeInteractive"></img>
            </div>
            <div class="right_header">
              <nav class="main_menu">
                <ul>
                  <li id="veClient" class="hidden">
                    <span class="cli_quest">
                      <?php echo $VE_ALREADY_CLIENT ?>
                    </span>
                    <a href="http://veplatform.veinteractive.com/Account/Login?ReturnUrl=%2f" target="_blank">
                      <?php echo VE_LOGIN ?>
                    </a>
                  </li>
                </ul>
              </nav>
            </div>
          </div>
          <div class="faint-line">
            <div class="main_messages content_grid">
              <h2 id="thanks_installing" class="thx-msg">
                <?php echo $VE_THANK_YOU_FOR_INSTALLING ?>
              </h2>
              <h2 id="choose_apps" class="conf-msg">
                <?php echo $VE_NOW_CHOOSE_APPLICATIONS ?>
              </h2>
            </div>
          </div>

        </div>

        <div class="ve_main">
          <div class="company_info content_grid">
            <div class="logo_content">
              <img src="view/image/veplatform/opencart_logo_blue.png" alt="Zencart">
           </div>
          </div>
          <div class="thanks_info content_grid">
            <div class="info_text">
              <p>
                <?php echo $VE_THANK_YOU_FOR_SELECTING_APP ?>
              </p>
              <p>
                <?php echo $VE_ACCOUNT_MANAGER_CONTACT ?>
              </p>
              <p>
                <?php echo $VE_CREATIVE_EXAMPLES_APP ?>
              </p>
              <ul class="social-info">
                <li>
                  <span class="icons-envelope"></span>
                  <?php echo $VE_THANKS_LETTER ?>
                </li>
                <li>
                  <span class="icons-phone"></span>
                  <?php echo $VE_THANKS_PHONE_US ?>
                </li>
                <li>
                  <span class="icons-phone"></span>
                  <?php echo $VE_THANKS_PHONE_UK ?>
                </li>
              </ul>
              <p>
                <?php echo $VE_BEST_REGARDS ?>
              </p>
              <p>
                <?php echo $VE_VEINTERACTIVE ?>
              </p>
            </div>
          </div>
        </div>

        <div class="ve_footer">
          <div class="footer-content content_grid">
            <div class="footer-left">
              <span>
                <?php echo $VE_FOOTER_VEINTERACTIVE; ?>
              </span>
            </div>

            <div class="footer-right">
              <span>
                <?php echo $VE_FOOTER_ALL_RIGHTS; ?>
                <?php echo date("Y"); ?>
                <?php echo $VE_FOOTER_RESERVED; ?>
              </span>
            </div>
            <div class="footer_img">
              <img src="view/image/veplatform/opencart_logo_white.png" alt="Shopify_icon">
                    </div>
          </div>
        </div>

      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>
