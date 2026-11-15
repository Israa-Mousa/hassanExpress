@if (count(app('Webkul\Product\Repositories\ProductRepository')->getNewProducts()))
    <section class="featured-products">

        <div class="featured-heading">
            {{ __('shop::app.home.new-products') }}<br/>
        </div>
            <div class="main-container-wrapper container-wrapper">
                <div class="product-grid-4">

                    @foreach (app('Webkul\Product\Repositories\ProductRepository')->getNewProducts() as $productFlat)

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
