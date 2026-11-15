@extends('shop::layouts.master')

@php
    $channel = core()->getCurrentChannel();

    $homeSEO = $channel->home_seo;

    if (isset($homeSEO)) {
        $homeSEO = json_decode($channel->home_seo);

        $metaTitle = $homeSEO->meta_title;

        $metaDescription = $homeSEO->meta_description;

        $metaKeywords = $homeSEO->meta_keywords;
    }
@endphp

@section('page_title')
    {{ isset($metaTitle) ? $metaTitle : "" }}
@endsection

@section('head')

    @if (isset($homeSEO))
        @isset($metaTitle)
            <meta name="title" content="{{ $metaTitle }}" />
        @endisset

        @isset($metaDescription)
            <meta name="description" content="{{ $metaDescription }}" />
        @endisset

        @isset($metaKeywords)
            <meta name="keywords" content="{{ $metaKeywords }}" />
        @endisset
    @endif
@endsection

@section('content-wrapper')
    {!! view_render_event('bagisto.shop.home.content.before') !!}

    @if (! is_null($channel->home_page_content))
        {!! DbView::make($channel)->field('home_page_content')->with(['sliderData' => $sliderData])->render() !!}
   <?php //var_dump('hereh');?>
    @else
       <?php die('mmmm');?>
        @include('shop::home.slider', ['sliderData' => $sliderData])
       <div>ncbkskskk</div>

       @include('shop::home.featured-products')
        @include('shop::home.new-products')
        @include('shop::home.price-product')
       @include("shop::home.category-product")
        <div>ncbkskskk</div>
    @endif

    {{ view_render_event('bagisto.shop.home.content.after') }}

@endsection
