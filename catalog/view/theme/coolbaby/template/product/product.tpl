<?php 
    global $config, $loader, $registry;
    $store_id = $config->get('config_store_id');
$lang = $config->get('config_language_id');
$customisation_products = $config->get('customisation_products_store');

$loader->model('custom/general');
$model_product = $registry->get('model_custom_general');


$youtube_link = $model_product->getProductOption($product_id, 'video1');

$youtube_video = isset($youtube_link) && $youtube_link != '' ? $youtube_link : false;

$short_descr = $model_product->getProductOption($product_id, 'short_description', '1');

$custom_right_block = $model_product->getProductOption($product_id, 'html_product_right', '1');

$tab_title = $model_product->getProductOption($product_id, 'tab_title');
$html_product_tab = $model_product->getProductOption($product_id, 'html_product_tab', '1');

$product_page_type = $model_product->getProductOptionSlick($product_id, 'product_page_type');

if (isset($product_page_type)) {
    $page_type = $product_page_type;
} else {
    $page_type = 1;
}

$this->model('catalog/product');

$additional_images = $this->registry->get('model_catalog_product')->getProductImages($product_id);

if ($additional_images) :
    foreach ($additional_images as $additional_image) :
        if (isset($additional_image["default_of_color"])) :
            $default_of_color = $additional_image["default_of_color"];
        endif;
    endforeach;
endif;


$option_color = ($page_type != 0 && sizeof($options) > 0 && file_exists('catalog/model/module/advanced_colors.php') && isset($default_of_color) && $default_of_color != 0) ? true : false;

$option_color_cr = (sizeof($options) > 0 && file_exists('catalog/model/module/advanced_colors.php') && isset($default_of_color) && $default_of_color != 0) ? true : false;

if (file_exists('catalog/model/module/advanced_colors.php')) :
$this->model('module/advanced_colors');
endif;


?>

<?php echo $header; ?>
<?php echo $loader->controller('common/top_promo'); ?>
<?php
$loader->model('custom/general');
$model_breadcrumbs = $registry->get('model_custom_general');
$breadcrumbs = $model_breadcrumbs->getBreadcrumbs($breadcrumbs);
echo '<div class="product_page_type'.$page_type.'">'.$breadcrumbs.'</div>';
?>

<!--full container-->
<div class="container" itemscope itemtype="http://schema.org/Product">
<?php echo $content_top; ?>


  <div id="content" class="product-view product-info row <?php echo ($option_color ? 'content' : ''); ?>">

        <?php if ($page_type != 0) : ?><?php echo $column_left; ?><?php endif; ?>

        <!--options-->

        <?php
        if ($option_color) {
        $page_type = 3;
        ?>

        <div class="col-sm-6 col-md-6 col-lg-4 content-image product_page_type3">
        <?php
        if ($option_color) :
            $this->registry->get('model_module_advanced_colors')->renderImagesBlock($this->registry->get('request')->get['product_id'], $thumb, $popup, $heading_title, $youtube_video);
        endif;
        ?>

        </div>
        <?php
        } else {
        ?>


        <?php if ($page_type == 0) : ?><div class="product-images-cell"><?php endif; ?>
            <div class="<?php echo ($page_type == 0 ? 'single-carousel-outer' : 'col-sm-6 col-md-6 col-lg-4 content-image'); ?>">
                <?php if ($page_type == 0) : ?>
                <div id="hover-left"></div>
                <div id="hover-right"></div>
                <?php endif; ?>

                <?php if ($thumb || $images) { ?>

                <div class="<?php echo ($page_type == 0 ? 'single-product-carousel slick-style4' : 'single-product'); ?>">
                    <?php if ($thumb) : ?>
                        <div class="carousel-item">
                            <img itemprop="image" class="cloudzoom" src="<?php echo $thumb; ?>" data-cloudzoom = "zoomImage: '<?php echo $popup; ?>', autoInside : 991, zoomSizeMode: 'image'" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                        </div>
                    <?php endif; ?>

                    <?php if ($images) : ?>
                        <?php foreach ($images as $image) : ?>
                            <div class="carousel-item">
                                <img class="cloudzoom" src="<?php echo $image['thumb']; ?>" data-cloudzoom = "zoomImage: '<?php echo $image['popup']; ?>', autoInside : 991, zoomSizeMode: 'image'" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>"  />
                            </div>
                        <?php endforeach; ?>

                        <?php if (count($images) < 4) : ?>
                            <?php foreach ($images as $image1) : ?>
                                <div class="creative-item-double carousel-item">
                                    <img class="cloudzoom" src="<?php echo $image1['thumb']; ?>" data-cloudzoom = "zoomImage: '<?php echo $image1['popup']; ?>', autoInside : 991, zoomSizeMode: 'image'" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>"  />
                                </div>
                            <?php endforeach; ?>
                        <?php endif; ?>


                    <?php endif; ?>

                </div>


                <?php if ($images || $youtube_video) : ?>
                <?php if ($page_type == 0) : ?>
                <div class="slider-nav-outer">
                    <?php endif; ?>

                    <div class="wrapper">
                        <div class="<?php echo ($page_type == 0 ? 'slider-nav' : 'slider-nav-simple'); ?>">
                            <?php if ($thumb) : ?>
                            <div class="carousel-item">
                                <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                            </div>
                            <?php endif; ?>

                            <?php if ($images) : ?>
                                <?php foreach ($images as $image) : ?>
                                    <div class="creative-item carousel-item">
                                        <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                                    </div>
                                <?php endforeach; ?>

                                <?php if (count($images) < 4) : ?>
                                    <?php foreach ($images as $image1) : ?>
                                    <div class="creative-item-double carousel-item">
                                        <img src="<?php echo $image1['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                                    </div>
                                    <?php endforeach; ?>
                                <?php endif; ?>

                            <?php endif; ?>

                        </div>

                        <?php if ($youtube_video) : ?>
                        <div class="video-link">
                            <a href="<?php echo $youtube_video; ?>" class="video-popup">
                            <span class="img-outer">
                                <?php if (isset($customisation_products['video_image'][$store_id]) && $customisation_products['video_image'][$store_id] != '') { ?>
                                    <img src="image/catalog/<?php echo $customisation_products['video_image'][$store_id]; ?>" alt="">
                                <?php } elseif ($thumb) { ?>
                                    <img src="<?php echo $thumb; ?>" alt="">
                                <?php } else { ?>
                                VIDEO
                                <?php } ?>

                            </span>
                            </a>
                        </div>
                        <?php endif; ?>
                    </div>


                    <?php if ($page_type == 0) : ?>
                </div>
                <?php endif; ?>

                <?php endif; ?>
                <?php } ?>

            </div>

            <!--options-->
            <?php } ?>
            <!--options-->

            <?php if ($page_type == 0) : ?></div><?php endif; ?>

        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6 col-md-6 col-lg-5'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-4'; ?>
        <?php } ?>


        <?php if ($page_type != 0) : ?><div class="clearfix visible-xs"></div><?php endif; ?>
        <div class="<?php echo ($page_type == 0 ? 'product-info-cell' : $class); ?> product-description content_info">

        <h1 class="product_title" itemprop="name"><?php echo $heading_title; ?></h1>
        <span class="display_none" itemprop="model"><?php echo $model; ?></span>
        <span  itemprop="brand" class="display_none"><?php echo $manufacturer; ?></span>

        <!--Google rich snippets offers-->
        <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
          <?php if (!isset($customisation_products['product_catalog_mode'][$store_id]) || $customisation_products['product_catalog_mode'][$store_id] != 1) : ?>
          <?php if ($price) : ?>
          <div class="product_page_price">
              <meta itemprop="priceCurrency" content="<?php echo $_SESSION['currency']; ?>" />
              <?php if (!$special) { ?>
              <?php echo '<span class="price price-regular" itemprop="price">'.$price.'</span>'; ?>
              <?php } else { ?>
              <span class="price old price-old"><?php echo $price; ?></span>
              <span class="price new price-new" itemprop="price"><?php echo $special; ?></span>
              <?php } ?>
              <br />
              <?php if ($tax) { ?>
              <span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span><br />
              <?php } ?>
              <?php if ($points) { ?>
              <span class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></span><br />
              <?php } ?>
              <?php if ($discounts) { ?>
              <div class="discount">
                  <?php foreach ($discounts as $discount) { ?>
                  <?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?>
                  <?php } ?>
              </div>
              <?php } ?>
          </div>
          <?php endif; ?>
          <?php endif; ?>


          <?php if ($review_status) { ?>
          <div class="divider divider-sm"></div>

            <?php if (isset($rating) && $rating > 0) : ?>
            <span class="display_none" itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
                <span itemprop="ratingValue"><?php echo $rating; ?></span>
                <?php preg_match ('%\d+%', $reviews, $matches); ?>
                <span itemprop="reviewCount"><?php echo $matches[0]; ?></span>
            </span>
            <?php endif; ?>


          <div class="rating">
                  <p>
                      <?php for ($i = 1; $i <= 5; $i++) { ?>
                      <?php if ($rating < $i) { ?>
                      <span class="fa fa-stack">
                          <i class="fa fa-star-o fa-stack-1x"></i>
                      </span>
                      <?php } else { ?>
                      <span class="fa fa-stack">
                          <i class="fa fa-star fa-stack-1x"></i>
                          <i class="fa fa-star-o fa-stack-1x"></i>
                      </span>
                      <?php } ?>
                      <?php } ?>
                      <a class="reviews_button" href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a> / <a class="write_review_button" href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a>
                  </p>
              </div>
          <?php } ?>
		  
		    


          <ul class="list-unstyled">
              <li><?php echo $text_model; ?> <?php echo $model; ?></li>
              <?php if ($reward) { ?>
              <li><?php echo $text_reward; ?> <?php echo $reward; ?></li>
              <?php } ?>
		 <?php if ($seller) { ?>
            <li><?php echo $text_seller; ?> <a href="<?php echo $sellers; ?>"><?php echo $seller; ?></a></li>
            <?php } ?>	
              <li>
                  <link itemprop="availability" href="http://schema.org/InStock"/><?php echo $text_stock; ?> <strong><?php echo $stock; ?></strong>
              </li>
          </ul>
        </div>
        <!--end Google rich snippets offers-->

          <?php
            if ($manufacturer) :
            $manufacturer_image = $model_product->getManufacturerImage($manufacturers);
          ?>
          <div class="brand-row">
              <?php if ($manufacturer_image || $manufacturer) : ?>
              <div class="<?php echo (isset($short_descr) && $short_descr != '' ? 'col-xs-4' : 'col-xs-4 manufacturer_image'); ?>">
                  <a href="<?php echo $manufacturers; ?>" title="<?php echo $manufacturer; ?>">
                      <?php if ($manufacturer_image) { ?>
                      <img src="image/<?php echo $manufacturer_image; ?>" alt="" class="img-responsive">
                      <?php } else {echo '<span itemprop="brand">'.$manufacturer;} ?>
                  </a>
              </div>
              <?php endif; ?>

              <?php if (isset($short_descr) && $short_descr != '') : ?>
              <div class="col-xs-8"><?php echo $short_descr; ?></div>
              <?php endif; ?>

          </div>
          <?php endif; ?>

          <div class="divider divider-sm"></div>
          <div class="line-divider"></div>

          <div id="product">
            <?php if ($options) { ?>
              <div class="divider divider-md"></div>
              <?php
              if ($option_color_cr) :
              $this->registry->get('model_module_advanced_colors')->renderProductPage($this->registry->get('request')->get['product_id']);
              endif;
              ?>
              <?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'select') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
                </option>
                <?php } ?>
              </select>
            </div>
            <?php } ?>

            <?php if ($option['type'] == 'radio') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>

            <?php if ($option['type'] == 'checkbox') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="checkbox">
                  <label>
                    <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'image') { ?>
              <div class="image_option_type form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                  <label class="control-label"><?php echo $option['name']; ?></label>
                  <div class="product-options" id="input-option<?php echo $option['product_option_id']; ?>">
                      <?php foreach ($option['product_option_value'] as $option_value) { ?>
                      <div class="radio">
                          <label>
                              <input class="image_radio" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                              <img data-toggle="tooltip" title="<?php echo $option_value['name']; ?><?php if ($option_value['price']) { ?>
                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                        <?php } ?>" src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail icon icon-color" />
                          </label>
                      </div>
                      <?php } ?>
                  </div>
              </div>
            <?php } ?>
            <?php if ($option['type'] == 'text') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'textarea') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'file') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'date') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group date">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'datetime') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group datetime">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'time') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group time">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php if ($recurrings) { ?>
            <hr>
            <h3><?php echo $text_payment_recurring ?></h3>
            <div class="form-group required">
              <select name="recurring_id" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($recurrings as $recurring) { ?>
                <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                <?php } ?>
              </select>
              <div class="help-block" id="recurring-description"></div>
            </div>
            <?php } ?>


              <?php if (!isset($customisation_products['product_catalog_mode'][$store_id]) || $customisation_products['product_catalog_mode'][$store_id] != 1) : ?>
              <div class="cart">
                  <div class="option quantity form-inputs">
                      <label><?php echo $entry_qty; ?></label>
                      <div class="input-group quantity-control">
                          <span class="input-group-addon">−</span>
                          <input class="form-control input-quantity" type="text" name="quantity" value="<?php echo $minimum; ?>" />
                          <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                          <input type="hidden" id="input-measures" name="test" value="" />
                          <input type="hidden" id="input-stitch-type" name="stitch_type" value="none" />
                          <span class="input-group-addon">+</span>
                      </div>
                  </div>
                  <div class="clearfix visible-xs"></div>
                  <?php 
                  if($stitch == "ready")
                  {
                  ?>
                    <a class="mam btn btn-cool btn-lg" href="#stitch-pop"><i class="icon flaticon-shopping66">  </i>Add to Cart</a>
                    <a style="display: none" id="measure-trigger" class="mam2" href="#measure"></a>
                    <div style="display: none">
                              <div id="stitch-pop">
                                <div style="float:left" id="stitch-ready"><button class="btn btn-cool btn-lg" id="button-stitch"><i class="icon icon flaticon-star129"></i>Stitch Farm</button></div>
                                <div style="float:left;padding-left:15px;" id="nostitch"><button class="btn btn-cool btn-lg" id="button-no-stitch"><i class="icon icon"></i>Continue to Checkout</button></div>
                              </div>
                    </div>
                    <button style="display: none" class="btn btn-cool btn-lg" type="submit" id="button-cart" data-loading-text="<?php echo $text_loading; ?>"><i class="icon flaticon-shopping66"></i><?php echo $button_cart; ?></button>

                  <?php 
                  }
                  else if($stitch == "material")
                  {
                    ?>
                    <a class="mam btn btn-cool btn-lg" href="#stitch-pop"><i class="icon flaticon-shopping66">  </i>Add to Cart</a>
                    <a style="display: none" id="measure-trigger" class="mam2" href="#measure"></a>
                    <div style="display: none">
                              <div id="stitch-pop">
                                <div style="float:left" id="stitch-material"><button class="btn btn-cool btn-lg" id="button-stitch"><i class="icon icon flaticon-star129"></i>Stitch Farm</button></div>
                                <div style="float:left;padding-left:15px;" id="nostitch"><button class="btn btn-cool btn-lg" id="button-no-stitch"><i class="icon icon"></i>Continue to Checkout</button></div>
                              </div>
                    </div>
                    <button style="display: none" class="btn btn-cool btn-lg" type="submit" id="button-cart" data-loading-text="<?php echo $text_loading; ?>"><i class="icon flaticon-shopping66"></i><?php echo $button_cart; ?></button>

                  <?php
                  }
                  else
                  {
                  ?>
                    <button class="btn btn-cool btn-lg" type="submit" id="button-cart" data-loading-text="<?php echo $text_loading; ?>"><i class="icon flaticon-shopping66"></i><?php echo $button_cart; ?></button>
                  <?php
                  }
                  ?>

                  <div class="product-controls">
                      <a onclick="wishlist_theme.add('<?php echo $product_id; ?>');" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>">
                          <span class="icon flaticon-heart68"></span>
                      </a>
                      <a onclick="compare_theme.add('<?php echo $product_id; ?>');" data-toggle="tooltip" title="<?php echo $button_compare; ?>">
                          <span class="icon flaticon-bars34"></span>
                      </a>
                  </div>
                  <?php if ($minimum > 1) : ?><div class="minimum"><?php echo $text_minimum; ?></div><?php endif; ?>

              </div>
              <?php endif; ?>
          </div>
          <div class="divider divider-xs"></div>


        <!--tabs for creative product view-->
        <?php if ($page_type == 0) : ?>
        <div class="panel-group accordion-simple" id="product-accordion">

            <?php if ($review_status) : ?>
            <div class="panel">
                <div class="panel-heading">
                    <a data-toggle="collapse" data-parent="#product-accordion" href="#product-review" class="collapsed">
                        <span class="arrow-down">+</span>
                        <span class="arrow-up">-</span> <?php echo $tab_review; ?>
                    </a>
                </div>
                <div id="product-review" class="panel-collapse collapse">
                    <div class="panel-body">
                        <form class="form-horizontal" id="form-review">
                                <div id="review" class="rating"></div>
                                <div>
                                    <h2 id="seller_write_review"><?php echo $text_write; ?></h2>
                                    <?php if ($review_guest) { ?>
                                    <div class="form-group required">
                                        <div class="col-sm-12">
                                            <input id="input-name" type="text" name="name" class="form-control" value="<?php echo $entry_name; ?>..." onblur="if (this.value == '') {this.value = '<?php echo $entry_name; ?>...';}" onfocus="if(this.value == '<?php echo $entry_name; ?>...') {this.value = '';}">
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <div class="col-sm-12">
                                            <textarea id="input-review" class="form-control" rows="5" name="text" onblur="if (this.value == '') {this.value = '<?php echo $entry_review; ?>...';}" onfocus="if(this.value == '<?php echo $entry_review; ?>...') {this.value = '';}"><?php echo $entry_review; ?>...</textarea>
                                            <div class="help-block"><?php echo $text_note; ?></div>
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <div class="col-sm-12">
                                            <label class="control-label"><?php echo $entry_rating; ?></label>
                                            &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                                            <input type="radio" name="rating" value="1" />
                                            &nbsp;
                                            <input type="radio" name="rating" value="2" />
                                            &nbsp;
                                            <input type="radio" name="rating" value="3" />
                       ?>
                     &nbsp;
                                            <input type="radio" name="rating" value="4" />
                                            &nbsp;
                                            <input type="radio" name="rating" value="5" />
                                            &nbsp;<?php echo $entry_good; ?></div>
                                    </div>
                                    <!--   <?php if ($site_key) { ?>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <div id="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
                                        </div>
                                    </div>
                                    <?php } ?> -->
                                    <div class="buttons clearfix">
                                        <button class="button btn-cool" type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>"><span class="icon flaticon-star129"></span><?php echo $button_continue; ?></button>

                                    </div>
                                    <?php } else { ?>
                                    <?php echo $text_login; ?>
                                    <?php } ?>

                                </div>
                        </form>
                    </div>
                </div>
            </div>
            <?php endif; ?>
      
           <?php if ($description) : ?>
                <div class="panel">
                    <div class="panel-heading">
                        <a data-toggle="collapse" data-parent="#product-accordion" href="#product-description" class="collapsed">
                            <span class="arrow-down">+</span>
                            <span class="arrow-up">-</span> <?php echo $tab_description; ?>
                        </a>
                    </div>
                    <div id="product-description" class="panel-collapse collapse">
                        <div class="panel-body"><span itemprop="description"><?php echo $description; ?></span></div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if ($attribute_groups) : ?>
                <div class="panel">
                    <div class="panel-heading">
                        <a data-toggle="collapse" data-parent="#product-accordion" href="#product-attribute" class="collapsed">
                            <span class="arrow-down">+</span>
                            <span class="arrow-up">-</span> <?php echo $tab_attribute; ?>
                        </a>
                    </div>
                    <div id="product-attribute" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="<?php echo (!$description ? 'tab-pane active' : 'tab-pane'); ?>" id="tab-specification">
                                <table class="table table-bordered">
                                    <?php foreach ($attribute_groups as $attribute_group) { ?>
                                    <thead>
                                    <tr>
                                        <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                    <tr>
                                        <td><?php echo $attribute['name']; ?></td>
                                        <td><?php echo $attribute['text']; ?></td>
                                    </tr>
                                    <?php } ?>
                                    </tbody>
                                    <?php } ?>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if ($seller_review_status) : ?>
            <div class="panel">
                <div class="panel-heading">
                    <a data-toggle="collapse" data-parent="#product-accordion" href="#product-review-seller" class="collapsed">
                        <span class="arrow-down">+</span>
                        <span class="arrow-up">-</span> <?php echo $tab_seller_review; ?>
                    </a>
                </div>
                <div id="product-seller_review" class="panel-collapse collapse">
                    <div class="panel-body">
                        <form class="form-horizontal" id="form-seller-review">
                                <div id="review" class="rating"></div>
                                <div>
                                    <h2 id="write_review"><?php echo $text_write; ?></h2>
                                    <?php if ($review_guest) { ?>
                                    <div class="form-group required">
                                        <div class="col-sm-12">
                                            <input id="input-name" type="text" name="name" class="form-control" value="<?php echo $entry_name; ?>..." onblur="if (this.value == '') {this.value = '<?php echo $entry_name; ?>...';}" onfocus="if(this.value == '<?php echo $entry_name; ?>...') {this.value = '';}">
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <div class="col-sm-12">
                                            <textarea id="input-review" class="form-control" rows="5" name="text" onblur="if (this.value == '') {this.value = '<?php echo $entry_review; ?>...';}" onfocus="if(this.value == '<?php echo $entry_review; ?>...') {this.value = '';}"><?php echo $entry_review; ?>...</textarea>
                                            <div class="help-block"><?php echo $text_note; ?></div>
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <div class="col-sm-12">
                                            <label class="control-label"><?php echo $entry_rating; ?></label>
                                            &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                                            <input type="radio" name="rating" value="1" />
                                            &nbsp;
                                            <input type="radio" name="rating" value="2" />
                                            &nbsp;
                                            <input type="radio" name="rating" value="3" />
                                            &nbsp;
                                            <input type="radio" name="rating" value="4" />
                                            &nbsp;
                                            <input type="radio" name="rating" value="5" />
                                            &nbsp;<?php echo $entry_good; ?></div>
                                    </div>
                                   <!--   <?php if ($site_key) { ?>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <div id="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
                                        </div>
                                    </div>
                                    <?php } ?> -->
                                    <div class="buttons clearfix">
                                        <button class="button btn-cool" type="button" id="button-seller_review" data-loading-text="<?php echo $text_loading; ?>"><span class="icon flaticon-star129"></span><?php echo $button_continue; ?></button>

                                    </div>
                                    <?php } else { ?>
                                    <?php echo $text_login; ?>
                                    <?php } ?>

                                </div>
                        </form>
                    </div>
                </div>
            </div>
            <?php endif; ?>
			
			

            <?php if ($tags) : ?>
            <div class="panel">
                <div class="panel-heading">
                    <a data-toggle="collapse" data-parent="#product-accordion" href="#product-tags" class="collapsed">
                        <span class="arrow-down">+</span>
                        <span class="arrow-up">-</span>
                        <?php echo (isset($customisation_translation[$lang]["tags_tab_title"][$store_id]) ? $customisation_translation[$lang]["tags_tab_title"][$store_id] : 'TAGS'); ?>
                    </a>
                </div>
                <div id="product-tags" class="panel-collapse collapse">
                    <div class="panel-body">
                        <?php for ($i = 0; $i < count($tags); $i++) { ?>
                        <?php if ($i < (count($tags) - 1)) { ?>
                        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
                        <?php } else { ?>
                        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
                        <?php } ?>
                        <?php } ?>                    </div>
                </div>
            </div>
            <?php endif; ?>

            <?php if (!empty($html_product_tab)) : ?>
            <div class="panel">
                <div class="panel-heading">
                    <a data-toggle="collapse" data-parent="#product-accordion" href="#product-custom" class="collapsed">
                        <span class="arrow-down">+</span>
                        <span class="arrow-up">-</span> <?php echo (!empty($tab_title) ? $tab_title : 'Custom block'); ?>
                    </a>
                </div>
                <div id="product-custom" class="panel-collapse collapse">
                    <div class="panel-body"><?php echo $html_product_tab; ?></div>
                </div>
            </div>
            <?php endif; ?>


        </div>

        <?php endif; ?>
        <!--end tabs for creative product view-->

        <div class="divider divider-xs"></div>
          <?php
          if (isset($customisation_products['product_page_button'][$store_id]) && $customisation_products['product_page_button'][$store_id] != '') {
          echo '<div class="social-buttons">'.html_entity_decode($customisation_products['product_page_button'][$store_id], ENT_QUOTES, 'UTF-8').'</div>';
        } else { ?>
          <div class="social-buttons">
              <span class="pull-left">Share:&nbsp;&nbsp;&nbsp;&nbsp;</span>
              <ul class="socials">
                  <li><a href="#"><span class="icon flaticon-facebook12"></span></a></li>
                  <li><a href="#"><span class="icon flaticon-twitter20"></span></a></li>
                  <li><a href="#"><span class="icon flaticon-google10"></span></a></li>
                  <li><a href="#"><span class="icon flaticon-pinterest9"></span></a></li>
              </ul>
          </div>
          <?php } ?>
        </div>


      <?php if ($column_right && $page_type != 0) : ?>
      <div class="col-sm-12 col-md-3 col-lg-3 module column-right product_right column">
          <?php if (isset($custom_right_block) && $custom_right_block != '') : echo $custom_right_block; endif; ?>
          <?php echo $column_right; ?>
      </div>
    <?php endif; ?>





</div>

<?php
if($stitch=="ready")
{
?>
<div id="content-new" style="display:none" class="product-view product-info row <?php echo ($option_color ? 'content' : ''); ?>">

  <div>
    <br><br>
  <!-- Nav tabs -->
  <ul id="measure-nav" class="nav nav-tabs" role="tablist">
    <li id="salwartab" role="presentation" class="active"><a href="#salwar-tab" aria-controls="home" role="tab" data-toggle="tab">SALWAR KAMEEZ</a></li>
    <li id="sareetab" role="presentation"><a href="#saree-tab" aria-controls="profile" role="tab" data-toggle="tab">SAREE</a></li>
    <li id="cholitab" role="presentation"><a href="#choli-tab" aria-controls="messages" role="tab" data-toggle="tab">LEHENGA CHOLI</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
        <div role="tabpanel" class="tab-pane fade in active" id="salwar-tab">
              <div style="float:left;" class="product-info-cell product-description content_info">
              <h1 class="product_title" itemprop="name" align="center">MEASUREMENT</h1>
                <div class="line-divider"></div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="around-bust" id="txtbust" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Bust</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                
                <div class="line-divider"></div>

                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="around-above-waist" id="txtawaist" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Above Waist</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="line-divider"></div>

                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="shoulder" id="txtshoulder" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Shoulder</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="line-divider"></div>

                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="around-arm-hole" id="txtarmhole" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Arm Hole</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="around-arm" id="txtarm" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Arm</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="txtheight" rel="skd-height" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Your Height</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="txtfrontneckdepth" rel="frontneckdepth" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Front Neck Depth</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="txtbackneckdepth" rel="backneckdepth" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Back Neck Depth</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="txtsleevelength" rel="sleevelength" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Sleeve Length</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="txtuppertoplength" rel="uppertoplength" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Kameez Length</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="around-waist" id="txtwaist" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Waist</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="around-hips" id="txthips" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Hips</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="txtbottomlength" rel="salwarlength" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Salwar Length</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="txtknee" rel="knee" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Knee</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="txtthigh" rel="thigh" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Thigh</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="txtankle" rel="ankle" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Ankle</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="txtcalf" rel="calf" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Calf</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="txtbottom" rel="bottom" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Bottom</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="measure-done-salwar" style="width:100%" class="btn btn-cool"><i class="icon flaticon-pencil43">  </i> Add to Cart</button>
                </div>


                      <!--end tabs for creative product view-->

              <div class="line-divider"></div>
         </div>

         <!-- images-->


          <!-- popup div-->
         <div class="demoRgt demoWidth rgt">
                                    <div class="lft mesureUnit">
                                        <div class="clr">
                                        </div>
                                        <div id="txtbusttext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Bust</strong></h3>
                                            <p>
                                               Measure under arms around the fullest part of the bust. Be sure to keep tape level across back and comfortably loose as per your wearing habits. 
                                            </p>
                                        </div>
                                        <div id="txtawaisttext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Above Waist</strong></h3>
                                            <p>
                                                
                                                Place the tape just under the mid-section below the bust, where the blouse will
                                                end. Take the measurement from just under the bust and just above the waist.
                                            </p>
                                        </div>
                                        <div id="txtshouldertext" class="howMesure  fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Shoulder</strong></h3>
                                            <p>
                                                Measure shoulder from one shoulder point to other shoulder point horizontally from
                                                back.
                                            </p>
                                        </div>
                                        <div id="txtarmholetext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Arm Hole</strong></h3>
                                            <p>
                                                From the highest point on the shoulder measure around arm hole with your arm hanging
                                                down.
                                            </p>
                                        </div>
                                        <div id="txtarmtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Arm</strong></h3>
                                            <p>
                                                Measure the middle of bisceps level of your arm keeping the hand relaxed.
                                            </p>
                                        </div>
                                        <div id="txtheighttext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Your Height</strong></h3>
                                            <p>
                                                Stand in your stocking feet with your feet slightly apart and your back to a wall.
                                                Measure from the floor to the top of your head.
                                            </p>
                                        </div>
                                        <div id="txtheightCmtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Your Height</strong></h3>
                                            <p>
                                                Stand in your stocking feet with your feet slightly apart and your back to a wall.
                                                Measure from the floor to the top of your head.
                                            </p>
                                        </div>
                                        <div id="txtfrontneckdepthtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Front Neck Depth</strong></h3>
                                            <p>
                                                Measuring from the front neck point to your desired depth diagonally.
                                            </p>
                                        </div>
                                        <div id="txtbackneckdepthtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Back Neck Depth</strong></h3>
                                            <p>
                                                Measuring from the back neck point to your desired depth diagonally.
                                            </p>
                                        </div>
                                        <div id="txtsleevelengthtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Sleeve Length</strong></h3>
                                            <p>
                                                Starting from the outside edge of the shoulder bone, measure upto the desired length.
                                            </p>
                                        </div>
                                        <div id="txtuppertoplengthtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Kameez Length</strong></h3>
                                            <p>
                                                Measure length from the shoulder point to your desired length like shown in the image.
                                            </p>
                                        </div>

                                        <div id="txtwaisttext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Waist</strong></h3>
                                            <p>
                                                Measure around waist keeping the tape straight from back.
                                            </p>
                                        </div>
                                        <div id="txthipstext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Hips</strong></h3>
                                            <p>
                                                Measure around the upper part of the hip, keeping the tape straight from the back
                                                and front.
                                            </p>
                                        </div>
                                        <div id="txtbottomlengthtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Salwar Length</strong></h3>
                                            <p>
                                                Measuring from the waist, measuring upto the desired length.
                                            </p>
                                        </div>
                                        <div class="howMesure fit" id="txtkneetext" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Knee</strong></h3>
                                            <p>
                                                Measure around the knee, while keeping your posture straight.
                                            </p>
                                        </div>                                        <div class="howMesure fit" id="txtthightext" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Thigh</strong></h3>
                                            <p>
                                                Measure around thigh of the leg, while keeping your posture straight.
                                            </p>
                                        </div>
                                        <div class="howMesure fit" id="txtankletext" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Ankle</strong></h3>
                                            <p>
                                                Measure around ankle of the foot, while keeping your posture straight
                                            </p>
                                        </div>
                                        <div class="howMesure fit" id="txtcalftext" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Calf</strong></h3>
                                            <p>
                                                Measure around calf of the leg, while keeping your posture straight.
                                            </p>
                                        </div>
                                        <div class="howMesure fit" id="txtbottomtext" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Bottom</strong></h3>
                                            <p>
                                                Measure around bottom of the salwar.
                                            </p>
                                        </div>
                                        <div class="clr">
                                        </div>
                                        
                                    </div>
                                    <div class="rgt">
                                        <img alt="" src="images/stitch/measure-dummy.jpg" class="DummyImg" id="fitdummy"></div>
                                </div> 


    </div>

    <!--  SAREE TAB-->
    <div role="tabpanel" class="tab-pane fade" id="saree-tab">

        <div style="float:left;" class="product-info-cell product-description content_info">
              <h1 class="product_title" itemprop="name" align="center">MEASUREMENT</h1>
                <div class="line-divider"></div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="saree-aroundbust" id="stxtbust" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Bust</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                
                <div class="line-divider"></div>

                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="saree-around-above-waist" id="stxtawaist" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Above Waist</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="line-divider"></div>

                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="saree-shoulder" id="stxtshoulder" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Shoulder</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="line-divider"></div>

                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="saree-around-arm-hole" id="stxtarmhole" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Arm Hole</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="saree-around-arm" id="stxtarm" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Arm</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="stxtheight" rel="saree-height" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Your Height</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="txtfrontneckdepth" rel="saree-frontneck-depth" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Front Neck Depth</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="stxtbackneckdepth" rel="saree-backneck-depth" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Back Neck Depth</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="stxtsleevelength" rel="saree-sleeve-length" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Sleeve Length</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="saree-blouse-length" id="stxtuppertoplength" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Blouse Length</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="measure-done-saree" style="width:100%" class="btn btn-cool"><i class="icon flaticon-pencil43">  </i> Add to Cart</button>
                </div>
                <!--End measure for saree-->

              <div class="line-divider"></div>
         </div>

        <div class="demoRgt demoWidth rgt">
                                    <div class="lft mesureUnit">
                                        <div class="clr">
                                        </div>
                                        <div id="stxtbusttext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Bust</strong></h3>
                                            <p>
                                                Measure under arms around the fullest part of the bust. Be sure to keep tape level across back and comfortably loose as per your wearing habits. 
                                            </p>
                                        </div>
                                        <div id="stxtawaisttext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Above Waist</strong></h3>
                                            <p>
                                                Place the tape well under arms, straight across the back and measure this from just
                                                under the bust and just above the waist.
                                            </p>
                                        </div>
                                        <div id="stxtshouldertext" class="howMesure  fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Shoulder</strong></h3>
                                            <p>
                                                Measure shoulder from one shoulder point to other shoulder point horizontally from
                                                back.
                                            </p>
                                        </div>
                                        <div id="stxtarmholetext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Arm Hole</strong></h3>
                                            <p>
                                                From the highest point on the shoulder measure around arm hole with your arm hanging
                                                down.
                                            </p>
                                        </div>
                                        <div id="stxtarmtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Arm</strong></h3>
                                            <p>
                                                Measure the middle of bisceps level of your arm keeping the hand relaxed.
                                            </p>
                                        </div>
                                        <div id="stxtheighttext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Your Height</strong></h3>
                                            <p>
                                                Stand in your stocking feet with your feet slightly apart and your back to a wall.
                                                Measure from the floor to the top of your head.
                                            </p>
                                        </div>
                                        <div id="stxtheightCmtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Your Height</strong></h3>
                                            <p>
                                                Stand in your stocking feet with your feet slightly apart and your back to a wall.
                                                Measure from the floor to the top of your head.
                                            </p>
                                        </div>
                                        <div id="stxtfrontneckdepthtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Front Neck Depth</strong></h3>
                                            <p>
                                                Measuring from the neck to your desired depth diagonally back neck point.
                                            </p>
                                        </div>
                                        <div id="stxtbackneckdepthtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Back Neck Depth</strong></h3>
                                            <p>
                                                Measuring from the back neck point to your desired depth diagonally.
                                            </p>
                                        </div>
                                        <div id="stxtsleevelengthtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Sleeve Length</strong></h3>
                                            <p>
                                                Starting from the outside edge of the shoulder bone and measure upto the desired
                                                length.
                                            </p>
                                        </div>
                                        <div id="stxtuppertoplengthtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Blouse Length</strong></h3>
                                            <p>
                                                Measure length from to point of your shoulder to desired length like show in the
                                                how to measure image.
                                            </p>
                                        </div>
                                        <div class="clr">
                                        </div>
                                        
                                    </div>                                    <div class="rgt">
                                        <img alt="" src="images/stitch/saree-dummy.jpg" class="DummyImg" id="fitdummy"></div>
                                </div>
    </div>

    <!-- CHOLI TAB-->
    <div role="tabpanel" class="tab-pane fade" id="choli-tab">

          <div style="float:left;" class="product-info-cell product-description content_info">
              <h1 class="product_title" itemprop="name" align="center">MEASUREMENT</h1>
                <div class="line-divider"></div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="lehenga-bust" id="ctxtbust" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Bust</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                
                <div class="line-divider"></div>

                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="lehenga-around_above_waist" id="ctxtawaist" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Above Waist</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="line-divider"></div>

                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="lehenga-shoulder" id="ctxtshoulder" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Shoulder</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="line-divider"></div>

                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="lehenga-around_arm" id="ctxtarmhole" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Arm Hole</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="lehenga-arm" id="ctxtarm" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Arm</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="ctxtheight" rel="lgn-height" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Your Height</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="ctxtfrontneckdepth" rel="lehenga-front_neck_depth" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Front Neck Depth</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="ctxtbackneckdepth" rel="lehenga-back_neck" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Back Neck Depth</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="ctxtsleevelength" rel="lehenga-sleeves_length" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Sleeve Length</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="ctxtuppertoplength" rel="lehenga-top_length" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Choli Length</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="lehenga-waist" id="ctxtwaist" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Waist</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="lehenga-hips" id="ctxthips" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Hips</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="txtbottomlength" rel="lehenga_length" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Lehenga Length</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="measure-done-choli" style="width:100%" class="btn btn-cool"><i class="icon flaticon-pencil43">  </i> Add to Cart</button>
                </div>
                      <!--end tabs for creative product view-->

              <div class="line-divider"></div>
         </div>

          <div class="demoRgt demoWidth rgt">
                                    <div class="lft mesureUnit">
                                        <div class="clr">
                                        </div>
                                        <div id="ctxtbusttext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Bust</strong></h3>
                                            <p>
                                                Measure under arms around the fullest part of the bust. Be sure to keep tape level across back and comfortably loose as per your wearing habits. 
                                            </p>
                                        </div>
                                        <div id="ctxtawaisttext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Above Waist</strong></h3>
                                            <p>
                                                Place the tape well under arms, straight across the back and measure this from just
                                                under the bust and just above the waist.
                                            </p>
                                        </div>
                                        <div id="ctxtshouldertext" class="howMesure  fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Shoulder</strong></h3>
                                            <p>
                                                Measure shoulder from one shoulder point to other shoulder point horizontally from
                                                back.
                                            </p>
                                        </div>
                                        <div id="ctxtarmholetext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Arm Hole</strong></h3>
                                            <p>
                                                From the highest point on the shoulder measure around arm hole with your arm hanging
                                                down.
                                            </p>
                                        </div>
                                        <div id="ctxtarmtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Arm</strong></h3>
                                            <p>
                                                Measure the middle of bisceps level of your arm keeping the hand relaxed.
                                            </p>
                                        </div>
                                        <div id="ctxtheighttext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Your Height</strong></h3>
                                            <p>
                                                Stand in your stocking feet with your feet slightly apart and your back to a wall.
                                                Measure from the floor to the top of your head.
                                            </p>
                                        </div>
                                        <div id="ctxtheightCmtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Your Height</strong></h3>
                                            <p>
                                                Stand in your stocking feet with your feet slightly apart and your back to a wall.
                                                Measure from the floor to the top of your head.
                                            </p>
                                        </div>
                                         <div id="ctxtfrontneckdepthtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Front Neck Depth</strong></h3>
                                            <p>
                                                Measuring from the front neck point to your desired depth diagonally.
                                            </p>
                                        </div>
                                        <div id="ctxtbackneckdepthtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Back Neck Depth</strong></h3>
                                            <p>
                                                Measuring from the back neck point to your desired depth diagonally.
                                            </p>
                                        </div>
                                        <div id="ctxtsleevelengthtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Sleeve Length</strong></h3>
                                            <p>
                                                Starting from the outside edge of the shoulder bone, measure upto the desired length.
                                            </p>
                                        </div>
                                        <div id="ctxtuppertoplengthtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Choli Length</strong></h3>
                                            <p>
                                                Measure length from the shoulder point to your desired length like shown in the image.
                                            </p>
                                        </div>
                                        <div id="ctxtwaisttext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Waist</strong></h3>
                                            <p>
                                                Measure around waist keeping the tape straight from back.
                                            </p>
                                        </div>
                                        <div id="ctxthipstext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Hips</strong></h3>
                                            <p>
                                                Measure around the upper part of the hip, keeping the tape straight from the back
                                                and front.
                                            </p>
                                        </div>
                                        <div id="ctxtbottomlengthtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong> Lehenga Length</strong></h3>
                                            <p>
                                                Measuring from the waist, measuring upto the desired length.
                                            </p>
                                        </div>
                                        <div class="clr">
                                        </div>
                                        
                                    </div>                                    <div class="rgt">
                                        <img alt="" src="images/stitch/lehenga-dummy.jpg" class="DummyImg" id="fitdummy"></div>
                                </div>
    </div>

  </div>



</div> 




  </div><!--content-new-->
<?php
}

if($stitch=="material")
{
?>
  <div id="content-dress" style="display:none" class="product-view product-info row <?php echo ($option_color ? 'content' : ''); ?>">

  <div>
    <br><br>
  <!-- Nav tabs -->
  <ul id="measure-nav" class="nav nav-tabs" role="tablist">
    <li id="salwartab" role="presentation" class="active"><a href="#salwar-tab" aria-controls="home" role="tab" data-toggle="tab">SALWAR KAMEEZ</a></li>
    <li id="sareetab" role="presentation"><a href="#saree-tab" aria-controls="profile" role="tab" data-toggle="tab">SAREE</a></li>
    <li id="cholitab" role="presentation"><a href="#choli-tab" aria-controls="messages" role="tab" data-toggle="tab">LEHENGA CHOLI</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
        <div role="tabpanel" class="tab-pane fade in active" id="salwar-tab">
              <div style="float:left;" class="product-info-cell product-description content_info">
              <h1 class="product_title" itemprop="name" align="center">MEASUREMENT</h1>
                <div class="line-divider"></div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="around-bust" id="txtbust" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Bust</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                
                <div class="line-divider"></div>

                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="around-above-waist" id="txtawaist" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Above Waist</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="line-divider"></div>

                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="shoulder" id="txtshoulder" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Shoulder</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="line-divider"></div>

                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="around-arm-hole" id="txtarmhole" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Arm Hole</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="around-arm" id="txtarm" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Arm</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="txtheight" rel="skd-height" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Your Height</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="txtfrontneckdepth" rel="frontneckdepth" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Front Neck Depth</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="txtbackneckdepth" rel="backneckdepth" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Back Neck Depth</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="txtsleevelength" rel="sleevelength" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Sleeve Length</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="txtuppertoplength" rel="uppertoplength" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Kameez Length</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="around-waist" id="txtwaist" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Waist</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="around-hips" id="txthips" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Hips</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="txtbottomlength" rel="salwarlength" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Salwar Length</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="txtknee" rel="knee" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Knee</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="txtthigh" rel="thigh" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Thigh</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="txtankle" rel="ankle" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Ankle</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="txtcalf" rel="calf" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Calf</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="txtbottom" rel="bottom" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Bottom</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="material-done-salwar" style="width:100%" class="btn btn-cool"><i class="icon flaticon-pencil43">  </i> Add to Cart</button>
                </div>


                      <!--end tabs for creative product view-->

              <div class="line-divider"></div>
         </div>

         <!-- images-->


          <!-- popup div-->
         <div class="demoRgt demoWidth rgt">
                                    <div class="lft mesureUnit">
                                        <div class="clr">
                                        </div>
                                        <div id="txtbusttext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Bust</strong></h3>
                                            <p>
                                               Measure under arms around the fullest part of the bust. Be sure to keep tape level across back and comfortably loose as per your wearing habits. 
                                            </p>
                                        </div>
                                        <div id="txtawaisttext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Above Waist</strong></h3>
                                            <p>
                                                
                                                Place the tape just under the mid-section below the bust, where the blouse will
                                                end. Take the measurement from just under the bust and just above the waist.
                                            </p>
                                        </div>
                                        <div id="txtshouldertext" class="howMesure  fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Shoulder</strong></h3>
                                            <p>
                                                Measure shoulder from one shoulder point to other shoulder point horizontally from
                                                back.
                                            </p>
                                        </div>
                                        <div id="txtarmholetext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Arm Hole</strong></h3>
                                            <p>
                                                From the highest point on the shoulder measure around arm hole with your arm hanging
                                                down.
                                            </p>
                                        </div>
                                        <div id="txtarmtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Arm</strong></h3>
                                            <p>
                                                Measure the middle of bisceps level of your arm keeping the hand relaxed.
                                            </p>
                                        </div>
                                        <div id="txtheighttext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Your Height</strong></h3>
                                            <p>
                                                Stand in your stocking feet with your feet slightly apart and your back to a wall.
                                                Measure from the floor to the top of your head.
                                            </p>
                                        </div>
                                        <div id="txtheightCmtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Your Height</strong></h3>
                                            <p>
                                                Stand in your stocking feet with your feet slightly apart and your back to a wall.
                                                Measure from the floor to the top of your head.
                                            </p>
                                        </div>
                                        <div id="txtfrontneckdepthtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Front Neck Depth</strong></h3>
                                            <p>
                                                Measuring from the front neck point to your desired depth diagonally.
                                            </p>
                                        </div>
                                        <div id="txtbackneckdepthtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Back Neck Depth</strong></h3>
                                            <p>
                                                Measuring from the back neck point to your desired depth diagonally.
                                            </p>
                                        </div>
                                        <div id="txtsleevelengthtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Sleeve Length</strong></h3>
                                            <p>
                                                Starting from the outside edge of the shoulder bone, measure upto the desired length.
                                            </p>
                                        </div>
                                        <div id="txtuppertoplengthtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Kameez Length</strong></h3>
                                            <p>
                                                Measure length from the shoulder point to your desired length like shown in the image.
                                            </p>
                                        </div>

                                        <div id="txtwaisttext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Waist</strong></h3>
                                            <p>
                                                Measure around waist keeping the tape straight from back.
                                            </p>
                                        </div>
                                        <div id="txthipstext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Hips</strong></h3>
                                            <p>
                                                Measure around the upper part of the hip, keeping the tape straight from the back
                                                and front.
                                            </p>
                                        </div>
                                        <div id="txtbottomlengthtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Salwar Length</strong></h3>
                                            <p>
                                                Measuring from the waist, measuring upto the desired length.
                                            </p>
                                        </div>
                                        <div class="howMesure fit" id="txtkneetext" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Knee</strong></h3>
                                            <p>
                                                Measure around the knee, while keeping your posture straight.
                                            </p>
                                        </div>                                        <div class="howMesure fit" id="txtthightext" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Thigh</strong></h3>
                                            <p>
                                                Measure around thigh of the leg, while keeping your posture straight.
                                            </p>
                                        </div>
                                        <div class="howMesure fit" id="txtankletext" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Ankle</strong></h3>
                                            <p>
                                                Measure around ankle of the foot, while keeping your posture straight
                                            </p>
                                        </div>
                                        <div class="howMesure fit" id="txtcalftext" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Calf</strong></h3>
                                            <p>
                                                Measure around calf of the leg, while keeping your posture straight.
                                            </p>
                                        </div>
                                        <div class="howMesure fit" id="txtbottomtext" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Bottom</strong></h3>
                                            <p>
                                                Measure around bottom of the salwar.
                                            </p>
                                        </div>
                                        <div class="clr">
                                        </div>
                                        
                                    </div>
                                    <div class="rgt">
                                        <img alt="" src="images/stitch/measure-dummy.jpg" class="DummyImg" id="fitdummy"></div>
                                </div> 
                                                      <div class="bottomStyle mrgTop">
                      <span>Front Neck Style</span>
                      <p>Pep up your Salwar Kameez with fancy and elegant front neck styles. </p>
                      <div class="lftArr"></div>
                      <div class="imgbox" id="1">
                      <ul style="width: 4440px;">
                      <li><img src="images/stitch/asymmetrical-slanting-v.jpg" alt="Asymmetrical Slanting V"><span>Asymmetrical Slanting V</span></li>
                      <li><img src="images/stitch/scalloped-with-v-neck.jpg" alt="Scalloped with V Neck"><span>Scalloped with V Neck</span></li>
                      <li><img src="images/stitch/inverted-paisley.jpg" alt="Inverted Paisley"><span>Inverted Paisley</span></li>
                      <li><img src="images/stitch/scalloped-u.jpg" alt="Scalloped U"><span>Scalloped U</span></li>
                      <li><img src="images/stitch/curved-square.jpg" alt="Curved Square"><span>Curved Square</span></li>
                      <li><img src="images/stitch/bateau-or-boat.jpg" alt="Bateau or Boat"><span>Bateau or Boat</span></li>
                      <li><img src="images/stitch/decollate.jpg" alt="Decollate"><span>Decollate</span></li>
                      <li><img src="images/stitch/key-hole.jpg" alt="Key Hole"><span>Key Hole</span></li>
                      <li><img src="images/stitch/deep-round.jpg" alt="Deep Round"><span>Deep Round</span></li>
                      <li><img src="images/stitch/horse-shoe.jpg" alt="Horse Shoe"><span>Horse Shoe</span></li>
                      <li><img src="images/stitch/square.jpg" alt="Square"><span>Square</span></li>
                      <li><img src="images/stitch/sweet-heart-neck.jpg" alt="Sweetheart Neck"><span>Sweetheart Neck</span></li>
                      <li><img src="images/stitch/simple-u.jpg" alt="Simple U"><span>Simple U</span></li>
                      <li><img src="images/stitch/simple-v.jpg" alt="Simple V"><span>Simple V</span></li>
                      <li><img src="images/stitch/chinese-collar.jpg" alt="Chinese Collar"><span>Chinese Collar</span></li>
                      <li><img src="images/stitch/asymmetrical-with-string.jpg" alt="Asymmetrical with String"><span>Asymmetrical with String</span></li>
                      <li><img src="images/stitch/asymmetrical-u.jpg" alt="Asymmetrical U"><span>Asymmetrical U</span></li>
                      <li><img src="images/stitch/asymmetrical-v.jpg" alt="Asymmetrical V"><span>Asymmetrical V</span></li>
                      <li><img src="images/stitch/deep-v-with-patch.jpg" alt="Deep V with Patch"><span>Deep V with Patch</span></li>
                      <li><img src="images/stitch/temple-shape.jpg" alt="Temple Shape"><span>Temple Shape</span></li>
                      <li><img src="images/stitch/star-neck.jpg" alt="Star Neck"><span>Star Neck</span></li>
                      <li><img src="images/stitch/temple-neck.jpg" alt="Temple Neck"><span>Temple Neck</span></li>
                      <li><img src="images/stitch/glass-with-string.jpg" alt="Glass with String"><span>Glass with String</span></li>
                      <li><img src="images/stitch/boat-string.jpg" alt="Boat String"><span>Boat String</span></li>
                      <li><img src="images/stitch/petal-neck.jpg" alt="Petal Neck"><span>Petal Neck</span></li>
                      <li><img src="images/stitch/string-style.jpg" alt="String Style"><span>String Style</span></li>
                      <li><img src="images/stitch/opposite-collar.jpg" alt="Opposite Collar"><span>Opposite Collar</span></li>
                      <li><img src="images/stitch/two-string.jpg" alt="Two String"><span>Two String</span></li>
                      <li><img src="images/stitch/kite-neck.jpg" alt="Kite Neck"><span>Kite Neck</span></li>
                      <li><img src="images/stitch/inverted-tomb.jpg" alt="Inverted Tomb"><span>Inverted Tomb</span></li>
                      </ul>
                      </div>
                      <div class="rgtArr"></div>
                      </div>

                      <div class="bottomStyle mrgTop">
                      <span>Back Neck Style</span>
                      <p>Let the bold be beautiful, with a variety of back neck styles.</p>
                      <div class="lftArr"></div>
                      <div class="imgbox" id="2">
                      <ul style="width: 3848px;">
                      <li><img src="images/stitch/glass-neck.jpg" alt="Glass Neck"><span>Glass Neck</span></li>
                      <li><img src="images/stitch/kurti-neck.jpg" alt="Kurti Neck"><span>Kurti Neck</span></li>
                      <li><img src="images/stitch/back-star.jpg" alt="Back Star"><span>Back Star</span></li>
                      <li><img src="images/stitch/glass-with-string.jpg" alt="Glass with String"><span>Glass with String</span></li>
                      <li><img src="images/stitch/piggy-neck.jpg" alt="Piggy Neck"><span>Piggy Neck</span></li>
                      <li><img src="images/stitch/twisted-back.jpg" alt="Twisted Back"><span>Twisted Back</span></li>
                      <li><img src="images/stitch/pot-neck.jpg" alt="Pot Neck"><span>Pot Neck</span></li>
                      <li><img src="images/stitch/polygon-neck.jpg" alt="Polygon Neck"><span>Polygon Neck</span></li>
                      <li><img src="images/stitch/bottom-glass.jpg" alt="Bottom Glass"><span>Bottom Glass</span></li>
                      <li><img src="images/stitch/key-hole.jpg" alt="Key Hole"><span>Key Hole</span></li>
                      <li><img src="images/stitch/bateau-or-boat.jpg" alt="Bateau or Boat"><span>Bateau or Boat</span></li>
                      <li><img src="images/stitch/round-with-string.jpg" alt="Round with String"><span>Round with String</span></li>
                      <li><img src="images/stitch/horse-shoe.jpg" alt="Horse Shoe"><span>Horse Shoe</span></li>
                      <li><img src="images/stitch/pointed.jpg" alt="Pointed"><span>Pointed</span></li>
                      <li><img src="images/stitch/round.jpg" alt="Round"><span>Round</span></li>
                      <li><img src="images/stitch/square.jpg" alt="Square"><span>Square</span></li>
                      <li><img src="images/stitch/sweet-heart.jpg" alt="Sweet Heart"><span>Sweet Heart</span></li>
                      <li><img src="images/stitch/back-chinese-collar.jpg" alt="Back Chinese Collar"><span>Back Chinese Collar</span></li>
                      <li><img src="images/stitch/simply-u.jpg" alt="Simply U"><span>Simply U</span></li>
                      <li><img src="images/stitch/tree-string.jpg" alt="Tree String"><span>Tree String</span></li>
                      <li><img src="images/stitch/step-neck.jpg" alt="Step Neck"><span>Step Neck</span></li>
                      <li><img src="images/stitch/block-neck.jpg" alt="Block Neck"><span>Block Neck</span></li>
                      <li><img src="images/stitch/asymmetrical-strings.jpg" alt="Asymmetrical Strings"><span>Asymmetrical Strings</span></li>
                      <li><img src="images/stitch/back-kite.jpg" alt="Back Kite"><span>Back Kite</span></li>
                      <li><img src="images/stitch/triple-thread.jpg" alt="Triple Thread"><span>Triple Thread</span></li>
                      <li><img src="images/stitch/fish-tail.jpg" alt="Fish Tail"><span>Fish Tail</span></li>
                      </ul>
                      </div>
                      <div class="rgtArr"></div>
                      </div>

                      <div class="bottomStyle mrgTop">
                      <span>Sleeve Style</span>
                      <p>Define your Salwar Kameez with these contemporary yet traditional sleeve styles.</p>
                      <div class="lftArr"></div>
                      <div class="imgbox" id="3">
                      <ul style="width: 2812px;">
                      <li><img src="images/stitch/cap-sleeves.jpg" alt="Cap Sleeves"><span>Cap Sleeves</span></li>
                      <li><img src="images/stitch/half-sleeves.jpg" alt="Half Sleeves"><span>Half Sleeves</span></li>
                      <li><img src="images/stitch/megan-sleeves.jpg" alt="Megan Sleeves"><span>Megan Sleeves</span></li>
                      <li><img src="images/stitch/pointed.jpg" alt="Pointed"><span>Pointed</span></li>
                      <li><img src="images/stitch/sleeveless.jpg" alt="Sleeveless"><span>Sleeveless</span></li>
                      <li><img src="images/stitch/tailored-sleeves.jpg" alt="Tailored Sleeves"><span>Tailored Sleeves</span></li>
                      <li><img src="images/stitch/elbow-sleeves.jpg" alt="Elbow Sleeves"><span>Elbow Sleeves</span></li>
                      <li><img src="images/stitch/angel-sleeves.jpg" alt="Angel Sleeves"><span>Angel Sleeves</span></li>
                      <li><img src="images/stitch/heart-shape.jpg" alt="Heart Shape"><span>Heart Shape</span></li>
                      <li><img src="images/stitch/v-cut.jpg" alt="V Cut"><span>V Cut</span></li>
                      <li><img src="images/stitch/bell-sleeves.jpg" alt="Bell Sleeves"><span>Bell Sleeves</span></li>
                      <li><img src="images/stitch/flutter.jpg" alt="Flutter"><span>Flutter</span></li>
                      <li><img src="images/stitch/laces.jpg" alt="Laces"><span>Laces</span></li>
                      <li><img src="images/stitch/lantern-sleeves.jpg" alt="Lantern Sleeves"><span>Lantern Sleeves</span></li>
                      <li><img src="images/stitch/puff-sleeves.jpg" alt="Puff Sleeves"><span>Puff Sleeves</span></li>
                      <li><img src="images/stitch/roll-up-sleeves.jpg" alt="Roll Up Sleeves"><span>Roll Up Sleeves</span></li>
                      <li><img src="images/stitch/bishop-sleeves.jpg" alt="Bishop Sleeves"><span>Bishop Sleeves</span></li>
                      <li><img src="images/stitch/trumpet-1.jpg" alt="Trumpet"><span>Trumpet 1</span></li>
                      <li><img src="images/stitch/trumpet-2.jpg" alt="Trumpet"><span>Trumpet 2</span></li>

                      </ul>
                      </div>
                      <div class="rgtArr"></div>
                      </div>


                      <div class="bottomStyle mrgTop">
                      <span>Bottom Style</span>
                      <p>Enhance your ethnic look by selecting a design from our plethora of bottom style options.</p>
                      <div class="lftArr"></div>
                      <div class="imgbox" id="4">
                      <ul style="width: 1480px;">
                      <li><img src="images/stitch/bootcut-pant-1.jpg" alt="Bootcut Pant"><span>Bootcut Pant</span></li>
                      <li><img src="images/stitch/bootcut-pant-with-slit.jpg" alt="Bootcut Pant with Slit"><span>Bootcut Pant with Slit</span></li>
                      <li><img src="images/stitch/capri-pant.jpg" alt="Capri Pant"><span>Capri Pant</span></li>
                      <li><img src="images/stitch/capri-pant-with-string.jpg" alt="Capri Pant with String"><span>Capri Pant with String</span></li>
                      <li><img src="images/stitch/churidar-with-string.jpg" alt="Churidar with Shirring"><span>Churidar with Shirring</span></li>
                      <li><img src="images/stitch/heavy-churidar.jpg" alt="Heavy Churidar"><span>Heavy Churidar</span></li>
                      <li><img src="images/stitch/patialla-salwar.jpg" alt="Patialla Salwar"><span>Patialla Salwar</span></li>
                      <li><img src="images/stitch/salwar-punjabi.jpg" alt="Salwar Punjabi"><span>Salwar Punjabi</span></li>
                      <li><img src="images/stitch/straight-pant.jpg" alt="Straight Pant"><span>Straight Pant</span></li>
                      <li><img src="images/stitch/churidar.jpg" alt="Churidar"><span>Churidar</span></li>

                      </ul>
                      </div>
                      <div class="rgtArr"></div>
                      </div>

    </div>

    <!--  SAREE TAB-->
    <div role="tabpanel" class="tab-pane fade" id="saree-tab">

        <div style="float:left;" class="product-info-cell product-description content_info">
              <h1 class="product_title" itemprop="name" align="center">MEASUREMENT</h1>
                <div class="line-divider"></div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="saree-aroundbust" id="stxtbust" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Bust</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                
                <div class="line-divider"></div>

                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="saree-around-above-waist" id="stxtawaist" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Above Waist</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="line-divider"></div>

                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="saree-shoulder" id="stxtshoulder" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Shoulder</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="line-divider"></div>

                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="saree-around-arm-hole" id="stxtarmhole" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Arm Hole</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="saree-around-arm" id="stxtarm" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Arm</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="stxtheight" rel="saree-height" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Your Height</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="txtfrontneckdepth" rel="saree-frontneck-depth" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Front Neck Depth</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="stxtbackneckdepth" rel="saree-backneck-depth" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Back Neck Depth</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="stxtsleevelength" rel="saree-sleeve-length" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Sleeve Length</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="saree-blouse-length" id="stxtuppertoplength" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Blouse Length</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="material-done-saree" style="width:100%" class="btn btn-cool"><i class="icon flaticon-pencil43">  </i> Add to Cart</button>
                </div>
                <!--End measure for saree-->

              <div class="line-divider"></div>
         </div>

        <div class="demoRgt demoWidth rgt">
                                    <div class="lft mesureUnit">
                                        <div class="clr">
                                        </div>
                                        <div id="stxtbusttext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Bust</strong></h3>
                                            <p>
                                                Measure under arms around the fullest part of the bust. Be sure to keep tape level across back and comfortably loose as per your wearing habits. 
                                            </p>
                                        </div>
                                        <div id="stxtawaisttext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Above Waist</strong></h3>
                                            <p>
                                                Place the tape well under arms, straight across the back and measure this from just
                                                under the bust and just above the waist.
                                            </p>
                                        </div>
                                        <div id="stxtshouldertext" class="howMesure  fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Shoulder</strong></h3>
                                            <p>
                                                Measure shoulder from one shoulder point to other shoulder point horizontally from
                                                back.
                                            </p>
                                        </div>
                                        <div id="stxtarmholetext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Arm Hole</strong></h3>
                                            <p>
                                                From the highest point on the shoulder measure around arm hole with your arm hanging
                                                down.
                                            </p>
                                        </div>
                                        <div id="stxtarmtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Arm</strong></h3>
                                            <p>
                                                Measure the middle of bisceps level of your arm keeping the hand relaxed.
                                            </p>
                                        </div>
                                        <div id="stxtheighttext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Your Height</strong></h3>
                                            <p>
                                                Stand in your stocking feet with your feet slightly apart and your back to a wall.
                                                Measure from the floor to the top of your head.
                                            </p>
                                        </div>
                                        <div id="stxtheightCmtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Your Height</strong></h3>
                                            <p>
                                                Stand in your stocking feet with your feet slightly apart and your back to a wall.
                                                Measure from the floor to the top of your head.
                                            </p>
                                        </div>
                                        <div id="stxtfrontneckdepthtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Front Neck Depth</strong></h3>
                                            <p>
                                                Measuring from the neck to your desired depth diagonally back neck point.
                                            </p>
                                        </div>
                                        <div id="stxtbackneckdepthtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Back Neck Depth</strong></h3>
                                            <p>
                                                Measuring from the back neck point to your desired depth diagonally.
                                            </p>
                                        </div>
                                        <div id="stxtsleevelengthtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Sleeve Length</strong></h3>
                                            <p>
                                                Starting from the outside edge of the shoulder bone and measure upto the desired
                                                length.
                                            </p>
                                        </div>
                                        <div id="stxtuppertoplengthtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Blouse Length</strong></h3>
                                            <p>
                                                Measure length from to point of your shoulder to desired length like show in the
                                                how to measure image.
                                            </p>
                                        </div>
                                        <div class="clr">
                                        </div>
                                        
                                    </div>                                    <div class="rgt">
                                        <img alt="" src="images/stitch/saree-dummy.jpg" class="DummyImg" id="fitdummy"></div>
                                </div>

                                <div class="bottomStyle">


                                <span>Front Neck Style</span>
                                <p>Optimize your design with classy and chic front neck styles for your blouse.</p>
                                <div class="lftArr"></div>
                                <div class="imgbox" id="1">
                                <ul style="width: 5476px;">
                                <li><img src="images/stitch/saree/chinese-collar.jpg" alt="Chinese Collar"><span>Chinese Collar</span></li>
                                <li><img src="images/stitch/saree/décolleté.jpg" alt="Décolleté"><span>Décolleté</span></li>
                                <li><img src="images/stitch/saree/round-with-oval.jpg" alt="Round with Oval"><span>Round with Oval</span></li>
                                <li><img src="images/stitch/saree/round-with-v.jpg" alt="Round with V"><span>Round with V</span></li>
                                <li><img src="images/stitch/saree/kurti-neck.jpg" alt="Kurti Neck"><span>Kurti Neck</span></li>
                                <li><img src="images/stitch/saree/opposite-glass.jpg" alt="Opposite Glass"><span>Opposite Glass</span></li>
                                <li><img src="images/stitch/saree/flame-neck.jpg" alt="Flame Neck"><span>Flame Neck</span></li>
                                <li><img src="images/stitch/saree/scallop.jpg" alt="Scallop"><span>Scallop</span></li>
                                <li><img src="images/stitch/saree/hexagon.jpg" alt="Hexagon"><span>Hexagon</span></li>
                                <li><img src="images/stitch/saree/leaf-shape.jpg" alt="Leaf Shape"><span>Leaf Shape</span></li>
                                <li><img src="images/stitch/saree/scalloped-u.jpg" alt="Scalloped U"><span>Scalloped U</span></li>
                                <li><img src="images/stitch/saree/glass.jpg" alt="Glass"><span>Glass</span></li>
                                <li><img src="images/stitch/saree/horse-shoe.jpg" alt="Horse Shoe"><span>Horse Shoe</span></li>
                                <li><img src="images/stitch/saree/pointed.jpg" alt="Pointed"><span>Pointed</span></li>
                                <li><img src="images/stitch/saree/rounded-sweet-heart.jpg" alt="Rounded Sweetheart"><span>Rounded Sweetheart</span></li>
                                <li><img src="images/stitch/saree/scalloped-glass.jpg" alt="Scalloped Glass"><span>Scalloped Glass</span></li>
                                <li><img src="images/stitch/saree/square.jpg" alt="Square"><span>Square</span></li>
                                <li><img src="images/stitch/saree/sweet-heart.jpg" alt="Sweetheart"><span>Sweetheart</span></li>
                                <li><img src="images/stitch/saree/sweet-heart-with-collar.jpg" alt="Sweetheart with Collar"><span>Sweetheart with Collar</span></li>
                                <li><img src="images/stitch/saree/simple-u.jpg" alt="Simple U"><span>Simple U</span></li>
                                <li><img src="images/stitch/saree/simple-v.jpg" alt="Simple V"><span>Simple V</span></li>
                                <li><img src="images/stitch/saree/multi-string.jpg" alt="Multi String"><span>Multi String</span></li>
                                <li><img src="images/stitch/saree/wave-neck.jpg" alt="Wave Neck"><span>Wave Neck</span></li>
                                <li><img src="images/stitch/saree/inverted-tomb.jpg" alt="Inverted Tomb"><span>Inverted Tomb</span></li>
                                <li><img src="images/stitch/saree/key-hole.jpg" alt="Key Hole"><span>Key Hole</span></li>
                                <li><img src="images/stitch/saree/key-hole-with-string.jpg" alt="Key Hole with String"><span>Key Hole with String</span></li>
                                <li><img src="images/stitch/saree/square-with-string.jpg" alt="Square with String"><span>Square with String</span></li>
                                <li><img src="images/stitch/saree/oval-with-string.jpg" alt="Oval with String"><span>Oval with String</span></li>
                                <li><img src="images/stitch/saree/butterfly-bustier.jpg" alt="Butterfly Bustier"><span>Butterfly Bustier</span></li>
                                <li><img src="images/stitch/saree/bustier.jpg" alt="Bustier"><span>Bustier</span></li>
                                <li><img src="images/stitch/saree/shape-with-bustier.jpg" alt="Shape with Bustier"><span>Shape with Bustier</span></li>
                                <li><img src="images/stitch/saree/envelope.jpg" alt="Envelope"><span>Envelope</span></li>
                                <li><img src="images/stitch/saree/halter-with-oval.jpg" alt="Halter with Oval"><span>Halter with Oval</span></li>
                                <li><img src="images/stitch/saree/halter.jpg" alt="Halter"><span>Halter</span></li> 
                                <li><img src="images/stitch/saree/halter-with-ring.jpg" alt="Halter with Ring"><span>Halter with Ring</span></li>
                                <li><img src="images/stitch/saree/off-shoulder.jpg" alt="Off Shoulder"><span>Off Shoulder</span></li>
                                <li><img src="images/stitch/saree/one-shoulder.jpg" alt="One Shoulder"><span>One Shoulder</span></li>


                                </ul>
                                </div>
                                <div class="rgtArr"></div>
                                </div>
                                <!--Back Neck Style-->>
                                <div class="bottomStyle mrgTop">
                                <span>Back Neck Style</span>
                                <p>Make a bold statement with the most gorgeous styles in back neck for your blouse.</p>
                                <div class="lftArr"></div>
                                <div class="imgbox" id="2">
                                <ul style="width: 4292px;">
                                <li><img src="images/stitch/saree/chinese-collar.jpg" alt="Chinese Collar"><span>Chinese Collar</span></li>
                                <li><img src="images/stitch/saree/bateau-or-boat.jpg" alt="Bateau or Boat"><span>Bateau or Boat</span></li>
                                <li><img src="images/stitch/saree/curved-square.jpg" alt="Curved Square"><span>Curved Square</span></li>
                                <li><img src="images/stitch/saree/scallop.jpg" alt="Scallop"><span>Scallop</span></li>
                                <li><img src="images/stitch/saree/horse-shoe.jpg" alt="Horse Shoe"><span>Horse Shoe</span></li>
                                <li><img src="images/stitch/saree/pointed.jpg" alt="Pointed"><span>Pointed</span></li>
                                <li><img src="images/stitch/saree/rounded.jpg" alt="Rounded"><span>Rounded</span></li>
                                <li><img src="images/stitch/saree/simple-u.jpg" alt="Simple U"><span>Simple U</span></li>
                                <li><img src="images/stitch/saree/simple-v.jpg" alt="Simple V"><span>Simple V</span></li>
                                <li><img src="images/stitch/saree/asymmetrical.jpg" alt="Asymmetrical"><span>Asymmetrical</span></li>
                                <li><img src="images/stitch/saree/loop-with-button.jpg" alt="Loop with Button"><span>Loop with Button</span></li>
                                <li><img src="images/stitch/saree/asymmetrical-scallop.jpg" alt="Asymmetrical Scallop"><span>Asymmetrical Scallop</span></li>
                                <li><img src="images/stitch/saree/pointed-round.jpg" alt="Pointed Round"><span>Pointed Round</span></li>
                                <li><img src="images/stitch/saree/round-with-string.jpg" alt="Round with String"><span>Round with String</span></li>
                                <li><img src="images/stitch/saree/potli-with-string.jpg" alt="Potli with String"><span>Potli with String</span></li>
                                <li><img src="images/stitch/saree/pointed-with-string.jpg" alt="Pointed with String"><span>Pointed with String</span></li>
                                <li><img src="images/stitch/saree/asymmetrical-with-string.jpg" alt="Asymmetrical with String"><span>Asymmetrical with String</span></li>
                                <li><img src="images/stitch/saree/glass-with-v.jpg" alt="Glass with V"><span>Glass with V</span></li>
                                <li><img src="images/stitch/saree/sweetheart-with-string.jpg" alt="Sweetheart with String"><span>Sweetheart with String</span></li>
                                <li><img src="images/stitch/saree/square-with-lace.jpg" alt="Square with Lace"><span>Square with Lace</span></li>
                                <li><img src="images/stitch/saree/circular-with-string.jpg" alt="Circular with String"><span>Circular with String</span></li>
                                <li><img src="images/stitch/saree/open-with-string.jpg" alt="Open with String"><span>Open with String</span></li>
                                <li><img src="images/stitch/saree/four-string.jpg" alt="Four String"><span>Four String</span></li>
                                <li><img src="images/stitch/saree/bustier.jpg" alt="Bustier"><span>Bustier</span></li>
                                <li><img src="images/stitch/saree/butterfly-bustier.jpg" alt="Butterfly Bustier"><span>Butterfly Bustier</span></li>
                                <li><img src="images/stitch/saree/stringed-deep--neck.jpg" alt="Stringed Deep Neck"><span>Stringed Deep Neck</span></li>
                                <li><img src="images/stitch/saree/off-shoulder.jpg" alt="Off Shoulder"><span>Off Shoulder</span></li>
                                <li><img src="images/stitch/saree/one-shoulder.jpg" alt="One Shoulder"><span>One Shoulder</span></li>
                                <li><img src="images/stitch/saree/backless.jpg" alt="Backless"><span>Backless</span></li>

                                </ul>
                                </div>
                                <div class="rgtArr"></div>
                                </div>

                                <div class="bottomStyle mrgTop">
                                <span>Sleeve Style</span>
                                <p>Let your sleeve speak the twist of fashion identity you carry. Pick from our select range of traditional and designer styles for the most elegant finish for your blouse.</p>
                                <div class="lftArr"></div>
                                <div class="imgbox" id="3">
                                <ul style="width: 1480px;">
                                <li><img src="images/stitch/saree/cap.jpg" alt="Cap"><span>Cap</span></li>
                                <li><img src="images/stitch/saree/elbow-sleeves.jpg" alt="Elbow Sleeves"><span>Elbow Sleeves</span></li>
                                <li><img src="images/stitch/saree/half-sleeves.jpg" alt="Half Sleeves"><span>Half Sleeves</span></li>
                                <li><img src="images/stitch/saree/short-sleeves.jpg" alt="Short Sleeves"><span>Short Sleeves</span></li>
                                <li><img src="images/stitch/saree/sleeveless.jpg" alt="Sleeveless"><span>Sleeveless</span></li>
                                <li><img src="images/stitch/saree/asymmetrical.jpg" alt="Asymmetrical"><span>Asymmetrical</span></li>
                                <li><img src="images/stitch/saree/round-with-string.jpg" alt="Round with String"><span>Round with String</span></li>
                                <li><img src="images/stitch/saree/zig-zag-string.jpg" alt="Zig Zag String"><span>Zig Zag String</span></li>
                                <li><img src="images/stitch/saree/flutter.jpg" alt="Flutter"><span>Flutter</span></li>
                                <li><img src="images/stitch/saree/puff-sleeves.jpg" alt="Puff Sleeves"><span>Puff Sleeves</span></li>
                                </ul>
                                </div>
                                <div class="rgtArr"></div>
                                </div>
    </div>

    <!-- CHOLI TAB-->
    <div role="tabpanel" class="tab-pane fade" id="choli-tab">

          <div style="float:left;" class="product-info-cell product-description content_info">
              <h1 class="product_title" itemprop="name" align="center">MEASUREMENT</h1>
                <div class="line-divider"></div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="lehenga-bust" id="ctxtbust" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Bust</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                
                <div class="line-divider"></div>

                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="lehenga-around_above_waist" id="ctxtawaist" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Above Waist</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="line-divider"></div>

                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="lehenga-shoulder" id="ctxtshoulder" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Shoulder</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="line-divider"></div>

                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="lehenga-around_arm" id="ctxtarmhole" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Arm Hole</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="lehenga-arm" id="ctxtarm" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Arm</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="ctxtheight" rel="lgn-height" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Your Height</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="ctxtfrontneckdepth" rel="lehenga-front_neck_depth" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Front Neck Depth</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="ctxtbackneckdepth" rel="lehenga-back_neck" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Back Neck Depth</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="ctxtsleevelength" rel="lehenga-sleeves_length" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Sleeve Length</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="ctxtuppertoplength" rel="lehenga-top_length" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Choli Length</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="lehenga-waist" id="ctxtwaist" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Waist</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button rel="lehenga-hips" id="ctxthips" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Around Hips</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="txtbottomlength" rel="lehenga_length" class="btn btn-cool btn-measure"><i class="icon flaticon-pencil43">  </i> Lehenga Length</button>

                        <div class="input-measure">
                            <input type="text" name="name" style="margin-bottom: 0px;" class="form-control" placeholder="Enter in Inches">
                        </div>
                </div>
                <div class="measure-tab">    
                        <div class="clearfix visible-xs"></div>
                        <button id="material-done-choli" style="width:100%" class="btn btn-cool"><i class="icon flaticon-pencil43">  </i> Add to Cart</button>
                </div>
                      <!--end tabs for creative product view-->

              <div class="line-divider"></div>
         </div>

          <div class="demoRgt demoWidth rgt">
                                    <div class="lft mesureUnit">
                                        <div class="clr">
                                        </div>
                                        <div id="ctxtbusttext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Bust</strong></h3>
                                            <p>
                                                Measure under arms around the fullest part of the bust. Be sure to keep tape level across back and comfortably loose as per your wearing habits. 
                                            </p>
                                        </div>
                                        <div id="ctxtawaisttext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Above Waist</strong></h3>
                                            <p>
                                                Place the tape well under arms, straight across the back and measure this from just
                                                under the bust and just above the waist.
                                            </p>
                                        </div>
                                        <div id="ctxtshouldertext" class="howMesure  fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Shoulder</strong></h3>
                                            <p>
                                                Measure shoulder from one shoulder point to other shoulder point horizontally from
                                                back.
                                            </p>
                                        </div>
                                        <div id="ctxtarmholetext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Arm Hole</strong></h3>
                                            <p>
                                                From the highest point on the shoulder measure around arm hole with your arm hanging
                                                down.
                                            </p>
                                        </div>
                                        <div id="ctxtarmtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Arm</strong></h3>
                                            <p>
                                                Measure the middle of bisceps level of your arm keeping the hand relaxed.
                                            </p>
                                        </div>
                                        <div id="ctxtheighttext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Your Height</strong></h3>
                                            <p>
                                                Stand in your stocking feet with your feet slightly apart and your back to a wall.
                                                Measure from the floor to the top of your head.
                                            </p>
                                        </div>
                                        <div id="ctxtheightCmtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Your Height</strong></h3>
                                            <p>
                                                Stand in your stocking feet with your feet slightly apart and your back to a wall.
                                                Measure from the floor to the top of your head.
                                            </p>
                                        </div>
                                         <div id="ctxtfrontneckdepthtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Front Neck Depth</strong></h3>
                                            <p>
                                                Measuring from the front neck point to your desired depth diagonally.
                                            </p>
                                        </div>
                                        <div id="ctxtbackneckdepthtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Back Neck Depth</strong></h3>
                                            <p>
                                                Measuring from the back neck point to your desired depth diagonally.
                                            </p>
                                        </div>
                                        <div id="ctxtsleevelengthtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Sleeve Length</strong></h3>
                                            <p>
                                                Starting from the outside edge of the shoulder bone, measure upto the desired length.
                                            </p>
                                        </div>
                                        <div id="ctxtuppertoplengthtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Choli Length</strong></h3>
                                            <p>
                                                Measure length from the shoulder point to your desired length like shown in the image.
                                            </p>
                                        </div>
                                        <div id="ctxtwaisttext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Waist</strong></h3>
                                            <p>
                                                Measure around waist keeping the tape straight from back.
                                            </p>
                                        </div>
                                        <div id="ctxthipstext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong>Around Hips</strong></h3>
                                            <p>
                                                Measure around the upper part of the hip, keeping the tape straight from the back
                                                and front.
                                            </p>
                                        </div>
                                        <div id="ctxtbottomlengthtext" class="howMesure fit" style="display: none;">
                                            <span class="rgtArrow">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <p>
                                                How to Measure</p>
                                            <h3>
                                                <strong> Lehenga Length</strong></h3>
                                            <p>
                                                Measuring from the waist, measuring upto the desired length.
                                            </p>
                                        </div>
                                        <div class="clr">
                                        </div>
                                        
                                    </div>                                    <div class="rgt">
                                        <img alt="" src="images/stitch/lehenga-dummy.jpg" class="DummyImg" id="fitdummy"></div>
                                </div>

                                <div class="bottomStyle">
                                <span>Front Neck Style</span>
                                <p>For an ultra-feminine look, custom-tailor your choli design with these curvaceous front neck style options.</p>
                                <div class="lftArr"></div>
                                <div class="imgbox" id="1">
                                <ul style="width: 5476px;">
                                <li><img src="images/stitch/choli/chinese-collar.jpg" alt="Chinese Collar"><span>Chinese Collar</span></li>
                                <li><img src="images/stitch/choli/décolleté.jpg" alt="Décolleté"><span>Décolleté</span></li>
                                <li><img src="images/stitch/choli/round-with-oval.jpg" alt="Round with Oval"><span>Round with Oval</span></li>
                                <li><img src="images/stitch/choli/round-with-v.jpg" alt="Round with V"><span>Round with V</span></li>
                                <li><img src="images/stitch/choli/kurti-neck.jpg" alt="Kurti Neck"><span>Kurti Neck</span></li>
                                <li><img src="images/stitch/choli/opposite-glass.jpg" alt="Opposite Glass"><span>Opposite Glass</span></li>
                                <li><img src="images/stitch/choli/flame-neck.jpg" alt="Flame Neck"><span>Flame Neck</span></li>
                                <li><img src="images/stitch/choli/scallop.jpg" alt="Scallop"><span>Scallop</span></li>
                                <li><img src="images/stitch/choli/hexagon.jpg" alt="hexagon"><span>hexagon</span></li>
                                <li><img src="images/stitch/choli/leaf-shape.jpg" alt="Leaf Shape"><span>Leaf Shape</span></li>
                                <li><img src="images/stitch/choli/scalloped-u.jpg" alt="Scalloped U"><span>Scalloped U</span></li>
                                <li><img src="images/stitch/choli/glass.jpg" alt="Glass"><span>Glass</span></li>
                                <li><img src="images/stitch/choli/horse-shoe.jpg" alt="Horse Shoe"><span>Horse Shoe</span></li>
                                <li><img src="images/stitch/choli/pointed.jpg" alt="Pointed"><span>Pointed</span></li>
                                <li><img src="images/stitch/choli/rounded-sweet-heart.jpg" alt="Rounded Sweetheart"><span>Rounded Sweetheart</span></li>
                                <li><img src="images/stitch/choli/scalloped-glass.jpg" alt="Scalloped Glass"><span>Scalloped Glass</span></li>
                                <li><img src="images/stitch/choli/square.jpg" alt="Square"><span>Square</span></li>
                                <li><img src="images/stitch/choli/sweet-heart.jpg" alt="Sweetheart"><span>Sweetheart</span></li>
                                <li><img src="images/stitch/choli/sweet-heart-with-collar.jpg" alt="Sweetheart with Collar"><span>Sweetheart with Collar</span></li>
                                <li><img src="images/stitch/choli/simple-u.jpg" alt="Simple U"><span>Simple U</span></li>
                                <li><img src="images/stitch/choli/simple-v.jpg" alt="Simple V"><span>Simple V</span></li>
                                <li><img src="images/stitch/choli/multi-string.jpg" alt="Multi String"><span>Multi String</span></li>
                                <li><img src="images/stitch/choli/wave-neck.jpg" alt="Wave Neck"><span>Wave Neck</span></li>
                                <li><img src="images/stitch/choli/inverted-tomb.jpg" alt="Inverted Tomb"><span>Inverted Tomb</span></li>
                                <li><img src="images/stitch/choli/key-hole.jpg" alt="Key Hole"><span>Key Hole</span></li>
                                <li><img src="images/stitch/choli/key-hole-with-string.jpg" alt="Key Hole with String"><span>Key Hole with String</span></li>
                                <li><img src="images/stitch/choli/square-with-string.jpg" alt="Square with String"><span>Square with String</span></li>
                                <li><img src="images/stitch/choli/oval-with-string.jpg" alt="Oval with String"><span>Oval with String</span></li>
                                <li><img src="images/stitch/choli/butterfly-bustier.jpg" alt="Butterfly Bustier"><span>Butterfly Bustier</span></li>
                                <li><img src="images/stitch/choli/bustier.jpg" alt="Bustier"><span>Bustier</span></li>
                                <li><img src="images/stitch/choli/halter-with-oval.jpg" alt="Halter with Oval"><span>Halter with Oval</span></li>
                                <li><img src="images/stitch/choli/envelope.jpg" alt="Envelope"><span>Envelope</span></li>
                                <li><img src="images/stitch/choli/shape-with-bustier.jpg" alt="Shape with Bustier"><span>Shape with Bustier</span></li>
                                <li><img src="images/stitch/choli/halter.jpg" alt="Halter"><span>Halter</span></li>
                                <li><img src="images/stitch/choli/halter-with-ring.jpg" alt="Halter with Ring"><span>Halter with Ring</span></li>
                                <li><img src="images/stitch/choli/off-shoulder.jpg" alt="Off Shoulder"><span>Off Shoulder</span></li>
                                <li><img src="images/stitch/choli/one-shoulder.jpg" alt="One Shoulder"><span>One Shoulder</span></li>
                                </ul>
                                </div>
                                <div class="rgtArr"></div>
                                </div>

                                <div class="bottomStyle mrgTop">
                                <span>Back Neck Style</span>
                                <p>Deck up your choli blouse design with these bold and trendy back neck styles.</p>
                                <div class="lftArr"></div>
                                <div class="imgbox" id="2">
                                <ul style="width: 4292px;">
                                <li><img src="images/stitch/choli/chinese-collar.jpg" alt="Chinese Collar"><span>Chinese Collar</span></li>
                                <li><img src="images/stitch/choli/bateau-or-boat.jpg" alt="Bateau or Boat"><span>Bateau or Boat</span></li>
                                <li><img src="images/stitch/choli/curved-square.jpg" alt="Curved Square"><span>Curved Square</span></li>
                                <li><img src="images/stitch/choli/horse-shoe.jpg" alt="Horse Shoe"><span>Horse Shoe</span></li>
                                <li><img src="images/stitch/choli/pointed.jpg" alt="Pointed"><span>Pointed</span></li>
                                <li><img src="images/stitch/choli/rounded.jpg" alt="Rounded"><span>Rounded</span></li>
                                <li><img src="images/stitch/choli/simple-u.jpg" alt="Simple U"><span>Simple U</span></li>
                                <li><img src="images/stitch/choli/simple-v.jpg" alt="Simple V"><span>Simple V</span></li>
                                <li><img src="images/stitch/choli/asymmetrical.jpg" alt="Asymmetrical"><span>Asymmetrical</span></li>
                                <li><img src="images/stitch/choli/loop-with-button.jpg" alt="Loop with Button"><span>Loop with Button</span></li>
                                <li><img src="images/stitch/choli/scallop.jpg" alt="Scallop"><span>Scallop</span></li>
                                <li><img src="images/stitch/choli/asymmetrical-scallop.jpg" alt="Asymmetrical Scallop"><span>Asymmetrical Scallop</span></li>
                                <li><img src="images/stitch/choli/pointed-round.jpg" alt="Pointed Round"><span>Pointed Round</span></li>
                                <li><img src="images/stitch/choli/round-with-string.jpg" alt="Pointed Round"><span>Round with String</span></li>
                                <li><img src="images/stitch/choli/potli-with-string.jpg" alt="Potli with String"><span>Potli with String</span></li>
                                <li><img src="images/stitch/choli/pointed-with-string.jpg" alt="Pointed with String"><span>Pointed with String</span></li>
                                <li><img src="images/stitch/choli/asymmetrical-with-string.jpg" alt="Asymmetrical with String"><span>Asymmetrical with String</span></li>
                                <li><img src="images/stitch/choli/glass-with-v.jpg" alt="Glass with V"><span>Glass with V</span></li>
                                <li><img src="images/stitch/choli/sweetheart-with-string.jpg" alt="Sweetheart with String"><span>Sweetheart with String</span></li>
                                <li><img src="images/stitch/choli/square-with-lace.jpg" alt="Square with Lace"><span>Square with Lace</span></li>
                                <li><img src="images/stitch/choli/circular-with-string.jpg" alt="Circular with String"><span>Circular with String</span></li>
                                <li><img src="images/stitch/choli/open-with-string.jpg" alt="Open with String"><span>Open with String</span></li>
                                <li><img src="images/stitch/choli/four-string.jpg" alt="Four String"><span>Four String</span></li>
                                <li><img src="images/stitch/choli/bustier.jpg" alt="Bustier"><span>Bustier</span></li>
                                <li><img src="images/stitch/choli/butterfly-bustier.jpg" alt="Butterfly Bustier"><span>Butterfly Bustier</span></li>
                                <li><img src="images/stitch/choli/stringed-deep--neck.jpg" alt="Stringed Deep Neck"><span>Stringed Deep Neck</span></li>
                                <li><img src="images/stitch/choli/off-shoulder.jpg" alt="Off Shoulder"><span>Off Shoulder</span></li>
                                <li><img src="images/stitch/choli/one-shoulder.jpg" alt="One Shoulder"><span>One Shoulder</span></li>
                                <li><img src="images/stitch/choli/backless.jpg" alt="Backless"><span>Backless</span></li>

                                </ul>
                                </div>
                                <div class="rgtArr"></div>
                                </div>

                                <div class="bottomStyle mrgTop">
                                <span>Sleeve Style</span>
                                <p>Choose a sleeve style for your choli blouse from our handpicked styles and pepper up your ethnic look.</p>
                                <div class="lftArr"></div>
                                <div class="imgbox" id="3">
                                <ul style="width: 2516px;">
                                <li><img src="images/stitch/choli/cap-sleeves.jpg" alt="Cap Sleeves"><span>Cap Sleeves</span></li>
                                <li><img src="images/stitch/choli/half-sleeves.jpg" alt="Half Sleeves"><span>Half Sleeves</span></li>
                                <li><img src="images/stitch/choli/sleeveless.jpg" alt="Sleeveless"><span>Sleeveless</span></li>
                                <li><img src="images/stitch/choli/elbow-sleeves.jpg" alt="Elbow Sleeves"><span>Elbow Sleeves</span></li>
                                <li><img src="images/stitch/choli/short-sleeves.jpg" alt="Short Sleeves"><span>Short Sleeves</span></li>
                                <li><img src="images/stitch/choli/v-cut.jpg" alt="V Cut"><span>V Cut</span></li>
                                <li><img src="images/stitch/choli/bell-sleeves.jpg" alt="Bell Sleeves"><span>Bell Sleeves</span></li>
                                <li><img src="images/stitch/choli/flutter.jpg" alt="Flutter"><span>Flutter</span></li>
                                <li><img src="images/stitch/choli/laces.jpg" alt="Laces"><span>Laces</span></li>
                                <li><img src="images/stitch/choli/lantern-sleeves.jpg" alt="Lantern Sleeves"><span>Lantern Sleeves</span></li>
                                <li><img src="images/stitch/choli/puff-sleeves.jpg" alt="Puff Sleeves"><span>Puff Sleeves</span></li>
                                <li><img src="images/stitch/choli/roll-up-sleeves.jpg" alt="Roll up Sleeves"><span>Roll up Sleeves</span></li>
                                <li><img src="images/stitch/choli/round-with-string.jpg" alt="Round with String"><span>Round with String</span></li>
                                <li><img src="images/stitch/choli/zig-zag-string.jpg" alt="Zig Zag String"><span>Zig Zag String</span></li>
                                <li><img src="images/stitch/choli/bishop-sleeves.jpg" alt="Bishop Sleeves"><span>Bishop Sleeves</span></li>
                                <li><img src="images/stitch/choli/trumpet-1.jpg" alt="Trumpet"><span>Trumpet 1</span></li>
                                <li><img src="images/stitch/choli/trumpet-2.jpg" alt="Trumpet"><span>Trumpet 2</span></li>

                                </ul>
                                </div>
                                <div class="rgtArr"></div>
                                </div>

                                <div class="bottomStyle mrgTop">
                                <span>Bottom Style</span>
                                <p>Select a pattern from our myriad lehenga style design options and stay in vogue.</p>
                                <div class="imgbox" id="4">
                                <ul style="margin-left: 56px; width: 740px;">
                                <li><img src="images/stitch/choli/umbrella.jpg" alt="Umbrella"><span>Umbrella</span></li>
                                <li><img src="images/stitch/choli/a-line.jpg" alt="A Line"><span>A Line</span></li>
                                <li><img src="images/stitch/choli/fish-kali.jpg" alt="Fish Kali"><span>Fish Kali</span></li>
                                <li><img src="images/stitch/choli/mermaid-fish-tail.jpg" alt="Mermaid/Fish Tail"><span>Mermaid/Fish Tail</span></li>
                                <li><img src="images/stitch/choli/straight.jpg" alt="Straight"><span>Straight</span></li>
                                </ul>
                                </div>
                                </div>
    </div>

  </div>



</div> <!--content-dress-->

<?php
}
?>


<!--tabs for classic product view-->
<?php if ($page_type != 0) : ?>
<div id="producttab" class="producttab">
    <ul class="nav nav-tabs">
        <?php if ($description) : ?>
        <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
        <?php endif; ?>

        <?php if ($attribute_groups) { ?>
        <li class="<?php echo (!$description ? 'active' : 'item_nonactive'); ?>"><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
        <?php } ?>

        <?php if ($review_status) { ?>
        <li class="<?php echo (!$description && !$attribute_groups ? 'active' : 'item_nonactive'); ?>"><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
        <?php } ?>
      <?php if ($seller_review_status) { ?>
        <li class="<?php echo (!$description && !$attribute_groups ? 'active' : 'item_nonactive'); ?>"><a href="#tab-review" data-toggle="tab"><?php echo $tab_seller_review; ?></a></li>

        <?php } ?>

        <?php if ($tags) : ?>
        <li class="<?php echo (!$description && !$attribute_groups && !$review_status ? 'active' : 'item_nonactive'); ?>"><a data-toggle="tab" href="#tab-tags"><?php echo (isset($customisation_translation[$lang]["tags_tab_title"][$store_id]) ? $customisation_translation[$lang]["tags_tab_title"][$store_id] : 'TAGS'); ?></a></li>
        <?php endif; ?>


        <?php if (!empty($html_product_tab)) : ?>
        <li class="<?php echo (!$description && !$attribute_groups && !$review_status && !$tags ? 'active' : 'item_nonactive'); ?>"><a data-toggle="tab" href="#tab-custom-tab"><?php echo (!empty($tab_title) ? $tab_title : 'Custom block'); ?></a></li>
        <?php endif; ?>

    </ul>
    <div class="tab-content">
        <?php if ($description) : ?>
        <div class="tab-pane active" id="tab-description"><span itemprop="description"><?php echo $description; ?></span></div>
        <?php endif; ?>
        <?php if ($attribute_groups) { ?>
        <div class="<?php echo (!$description ? 'tab-pane active' : 'tab-pane'); ?>" id="tab-specification">
            <table class="table table-bordered">
                <?php foreach ($attribute_groups as $attribute_group) { ?>
                <thead>
                <tr>
                    <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                </tr>
                </thead>
                <tbody>
                <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                <tr>
                    <td><?php echo $attribute['name']; ?></td>
                    <td><?php echo $attribute['text']; ?></td>
                </tr>
                <?php } ?>
                </tbody>
                <?php } ?>
            </table>
        </div>
        <?php } ?>
  

        <?php if ($tags) : ?>
        <div id="tab-tags" class="<?php echo (!$description && !$attribute_groups && !$review_status ? 'tab-pane active ' : 'tab-pane'); ?>">
            <?php for ($i = 0; $i < count($tags); $i++) { ?>
            <?php if ($i < (count($tags) - 1)) { ?>
            <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
            <?php } else { ?>
            <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
            <?php } ?>
            <?php } ?>
        </div>
        <?php endif; ?>

        <?php if (!empty($html_product_tab)) : ?>
        <div id="tab-custom-tab" class="<?php echo (!$description && !$attribute_groups && !$review_status && !$tags ? 'tab-pane active' : 'tab-pane'); ?>">
            <?php echo $html_product_tab; ?>
        </div>
        <?php endif; ?>


    </div>
</div>
<?php endif; ?>
<!--end tabs for classic product view-->

</div>
<!--end full container-->

<?php echo $content_bottom; ?>

<!--related-->
<?php
if ($products) {
if (!isset($customisation_products['related'][$store_id]) || $customisation_products['related'][$store_id] != 'disable'):
   global $config, $loader, $registry, $settings;
   $type_of_slider = 'latest';

   $store_id = $config->get('config_store_id');

$customisation_slider = $config->get('customisation_slider_store');


$loader->model('custom/general');
$model_module = $registry->get('model_custom_general');
$setting = $model_module->getModuleSettings($type_of_slider);

$heading_title = $text_related;

$related = true;
$type_of_slider = 'related';

include('catalog/view/theme/slider_horizontal_carousel.php');
endif;
}
?>

<!--end related-->




<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
  console.log('sdf');
  $.ajax({
    url: 'index.php?route=checkout/cart/add',
    type: 'post',
    data: $('#content-new input[type=\'text\'], #product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
    dataType: 'json',
    beforeSend: function() {
      $('#button-cart').button('loading');
    },
    complete: function() {
      $('#button-cart').button('reset');
    },
    success: function(json) {
      //console.log(json);return;
      $('.alert, .text-danger').remove();
      $('.form-group').removeClass('has-error');

      if (json['error']) {
        if (json['error']['option']) {
          for (i in json['error']['option']) {
            var element = $('#input-option' + i.replace('_', '-'));

            if (element.parent().hasClass('input-group')) {
              element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
            } else {
              element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
            }
                        /* Validate color option */
                        if(typeof(colorOptionId) != "undefined" && colorOptionId !== null && colorOptionId!=undefined && colorOptionId==i.replace('_', '-')){
                            $('.prp-colorswatch-productpage-icons').after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                        }
          }
        }

        if (json['error']['recurring']) {
          $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
        }

        // Highlight any found errors
        $('.text-danger').parent().addClass('has-error');
      }

      if (json['success']) {

                var str=json['total'];
                var myArray = str.split(' ');
                var str1=myArray[0];

                $('.cart-total-number').html(str1);

                $('.cart > ul').load('index.php?route=common/cart/info ul li');

                $('#notification').parent().before('<div class="preloader"><div class="success_ev" style="display: none;">' + json['success'] + '</div></div>');
                $('.success_ev').fadeIn();

                setTimeout(function(){
                    jQuery('.success_ev').fadeOut();
                    jQuery('.preloader').remove();
                },1500)
                //$('#open-cart').click();

            }
    }
  });
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
  pickTime: false
});

$('.datetime').datetimepicker({
  pickDate: true,
  pickTime: true
});

$('.time').datetimepicker({
  pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
  var node = this;

  $('#form-upload').remove();

  $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

  $('#form-upload input[name=\'file\']').trigger('click');

  if (typeof timer != 'undefined') {
      clearInterval(timer);
  }

  timer = setInterval(function() {
    if ($('#form-upload input[name=\'file\']').val() != '') {
      clearInterval(timer);

      $.ajax({
        url: 'index.php?route=tool/upload',
        type: 'post',
        dataType: 'json',
        data: new FormData($('#form-upload')[0]),
        cache: false,
        contentType: false,
        processData: false,
        beforeSend: function() {
          $(node).button('loading');
        },
        complete: function() {
          $(node).button('reset');
        },
        success: function(json) {
          $('.text-danger').remove();

          if (json['error']) {
            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
          }

          if (json['success']) {
            alert(json['success']);

            $(node).parent().find('input').attr('value', json['code']);
          }
        },
        error: function(xhr, ajaxOptions, thrownError) {
          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
      });
    }
  }, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#button-review').on('click', function() {
  $.ajax({
    url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
    type: 'post',
    dataType: 'json',
        data: $("#form-review").serialize(),
        beforeSend: function() {
      $('#button-review').button('loading');
    },
    complete: function() {
      $('#button-review').button('reset');
    },
    success: function(json) {
      $('.alert-success, .alert-danger').remove();

      if (json['error']) {
        $('#seller_write_review').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
      }

      if (json['success']) {
        $('#seller_write_review').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

        $('input[name=\'name\']').val('');
        $('textarea[name=\'text\']').val('');
        $('input[name=\'rating\']:checked').prop('checked', false);
      }
    }
  });
});

$('#seller_review').load('index.php?route=product/product/seller_review&product_id=<?php echo $product_id; ?>');

$('#button-seller_review').on('click', function() {
  $.ajax({
    url: 'index.php?route=product/product/seller_write&product_id=<?php echo $product_id; ?>',
    type: 'post',
    dataType: 'json',
        data: $("#form-seller-review").serialize(),
        beforeSend: function() {
      $('#button-seller_review').button('loading');
    },
    complete: function() {
      $('#button-seller_review').button('reset');
    },
    success: function(json) {
      $('.alert-success, .alert-danger').remove();

      if (json['error']) {
        $('#write_review').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
      }

      if (json['success']) {
        $('#write_review').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

        $('input[name=\'name\']').val('');
        $('textarea[name=\'text\']').val('');
        $('input[name=\'rating\']:checked').prop('checked', false);
      }
    }
  });
});


//--></script>
<?php echo $footer; ?>
