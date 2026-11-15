@extends('shop::layouts.master')

@section('page_title')
    {{ $page->page_title }}
@endsection



@section('seo')
    <meta name="title" content="{{ $page->meta_title }}" />

    <meta name="description" content="{{ $page->meta_description }}" />

    <meta name="keywords" content="{{ $page->meta_keywords }}" />

@endsection
@if($page->url_key  == 'questions-and-answers')
@section('head')
    <script>
        function docReady(fn) {
            // see if DOM is already available
            if (document.readyState === "complete" || document.readyState === "interactive") {
                // call on next available tick
                setTimeout(fn, 1);
            } else {
                document.addEventListener("DOMContentLoaded", fn);
            }
        }
        docReady(function() {
            let myLabels = document.querySelectorAll('.lbl-toggle'); Array.from(myLabels).forEach(label => { label.addEventListener('keydown', e => { if (e.which === 32 || e.which === 13) { e.preventDefault(); label.click(); }; }); });

        });


    </script>
    <style>
        .wrap-collabsible {
            margin-bottom: 1.2rem 0;
        }

        input[type='checkbox'] {
            display: none;
        }

        .lbl-toggle {
            display: block;
            direction: ltr;
            font-weight: bold;
            font-size: 1.2rem;
            text-transform: uppercase;
            text-align: right;
            padding: 1rem;
            color: #444;
            background: #eee;
            cursor: pointer;
            border-radius: 7px;
            transition: all 0.25s ease-out;
            margin: 10px;
        }

        .lbl-toggle:hover {
            color: #7C5A0B;
        }

        .lbl-toggle::before {
            content: ' ';
            display: inline-block;

            border-top: 5px solid transparent;
            border-bottom: 5px solid transparent;
            border-left: 5px solid currentColor;
            vertical-align: middle;
            margin-right: .7rem;
            transform: translateY(-2px);

            transition: transform .2s ease-out;
        }

        .toggle:checked + .lbl-toggle::before {
            transform: rotate(90deg) translateX(-3px);
        }

        .collapsible-content {
            max-height: 0px;
            overflow: hidden;
            transition: max-height .25s ease-in-out;
        }

        .toggle:checked + .lbl-toggle + .collapsible-content {
            max-height: 100vh;
        }

        .toggle:checked + .lbl-toggle {
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }

        .collapsible-content .content-inner {
            background: rgba(110, 224, 66, .2);
            border-bottom: 1px solid rgba(110, 224, 66, .45);
            border-bottom-left-radius: 7px;
            border-bottom-right-radius: 7px;
            padding: .5rem 1rem;
        }
    </style>
@endsection
@endif


@section('content-wrapper')

    {!! DbView::make($page)->field('html_content')->render() !!}

@endsection
