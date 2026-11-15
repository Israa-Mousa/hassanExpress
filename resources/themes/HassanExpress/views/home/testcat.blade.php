{{--@if (count(app('Webkul\Category\Repositories\CategoryRepository')->getVisibleCategoryTree(core()->getCurrentChannel()->root_category_id))))--}}
{{--    <section class="featured-products"  syle="background-color:blue" >--}}

{{--        <div class="featured-heading" >--}}
{{--            {{ __('shop::app.home.category-product') }}<br/>--}}

{{--        </div>--}}
{{--        <div class="main-container-wrapper container-wrapper">--}}
{{--            <div class="featured-grid product-grid-4">--}}
{{-- bxdfg--}}
{{--            @foreach (app('Webkul\Category\Repositories\CategoryRepository')->getVisibleCategoryTree(1) as $productFlat)--}}

{{--                --}}{{--                    {{$productFlat->price}}--}}
{{--                <!--                    --><?php //var_dump(app('Webkul\Product\Repositories\ProductRepository')->getPriceProducts());?>--}}
{{--                    @if (core()->getConfigData('catalog.products.homepage.out_of_stock_items'))--}}

{{--                        @include ('shop::products.list.card', ['product' => $productFlat])--}}
{{--                    @else--}}
{{--                        @if ($productFlat->isSaleable())--}}
{{--                            @include ('shop::products.list.card', ['product' => $productFlat])--}}
{{--                        @endif--}}
{{--                    @endif--}}


{{--                @endforeach--}}

{{--            </div>--}}

{{--        </div>--}}

{{--    </section>--}}
{{--@endif--}}
{!! view_render_event('bagisto.shop.layout.header.category.before') !!}

<?php
$pro=app('Webkul\Category\Repositories\CategoryRepository')->getcatProducts();
echo 'isrraa new';
var_dump($pro);


//<?php
//$categories = [];
//
//foreach (app('Webkul\Category\Repositories\CategoryRepository')->getVisibleCategoryTree(core()->getCurrentChannel()->root_category_id) as $category) {
//    echo $category->display_mode;
//    array_push($categories, $category);
//
//}
//
//?>

{{--@if (count($categories))--}}

{{--    <div class="list-container" style="text-align:center;margin-top: 50px;">--}}
{{--        <ul class="list-group">--}}

{{--            @foreach ($categories as $category)--}}

{{--                <li> {{ $category->name }} </li>--}}

{{--            @endforeach--}}

{{--        </ul>--}}
{{--    </div>--}}

{{--@endif--}}

<?php
//$product= (app('Webkul\Category\Repositories\CategoryRepository')->getVisibleCategoryTree(core()->getCurrentChannel()->root_category_id) as $category) {

{{--// $cat=app('Webkul\Category\Repositories\CategoryRepository')->getVisibleCategoryTree(11);--}}
{{--//var_dump($cat);--}}
{{--//echo '<br>';--}}
{{--//echo '<br>';--}}
{{--//echo '<br>';--}}
{{--//echo '<br>';--}}
{{--//echo '<br>';--}}
{{--//echo '<br>';--}}
{{--//echo '<br>'.'israaa'.'israa'.'israaaaaaaaaaaaa';--}}
{{--//echo '<br>';--}}
{{--//echo '<br>';--}}
{{--//echo '<br>';--}}
{{--//echo '<br>';--}}
{{--//echo '<br>';--}}
{{--//echo '<br>';--}}
{{--//print_r($cat);--}}
{{--//--}}
{{--////var_dump(app('Webkul\Category\Repositories\CategoryRepository')->getVisibleCategoryTree(11));--}}
{{--//$categories = [];--}}
{{--//--}}
{{--//foreach (app('Webkul\Category\Repositories\CategoryRepository')->getVisibleCategoryTree(core()->getCurrentChannel()->root_category_id) as $category) {--}}
{{--//    if ($category->slug) {--}}
{{--//        array_push($categories, $category);--}}
{{--////        echo $category['id'];--}}
{{--////        echo 'herjkkjdnvf';--}}
{{--//    }--}}
{{--//}--}}