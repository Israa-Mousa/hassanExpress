@if (count(app('Webkul\Product\Repositories\ProductRepository')->getTopRatedProducts()))
    <section class="featured-products">

        <div class="featured-heading">
            {{ __('shop::app.home.top-rated-products') }}<br/>

        </div>
        <div class="main-container-wrapper container-wrapper">
            <div class="featured-grid product-grid-4">

                @foreach (app('Webkul\Product\Repositories\ProductRepository')->getTopRatedProducts() as $productFlat)

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
