@if (count(app('Webkul\Category\Repositories\CategoryRepository')->getcatProducts(17)))
    <section class="featured-products">

        <div class="featured-heading">
            {{ __('shop::app.home.category-products') }}<br/>

        </div>
        <div class="main-container-wrapper container-wrapper">
            <div class="featured-grid product-grid-4">

                @foreach (app('Webkul\Category\Repositories\CategoryRepository')->getcatProducts(17) as $productFlat)
{{--                   {{$productFlat->id}}--}}
                    @if (core()->getConfigData('catalog.products.homepage.out_of_stock_items'))
                        @include ('shop::products.list.card', ['product' => $productFlat])
                    @else
                        @if ($productFlat->isSaleable())
                            @include ('shop::products.list.card', ['product' => $productFlat])
                        @endif
                    @endif

                @endforeach

            </div>

        </div>

    </section>



@endif
{!! view_render_event('bagisto.shop.layout.header.category.before') !!}
<?php
$pro=app('Webkul\Category\Repositories\CategoryRepository')->getcatProducts(1);
//echo 'nvbckclkcl';
//echo $pro;

foreach ($pro as $value) {
//echo  $value[1];
// echo $value->id;
//    echo '<br>';

}
//
//echo 'nesks';
//echo '<br>';
//echo '<br>';

