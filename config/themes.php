<?php

return [
    'default' => 'default',

    'themes' => [
        'default' => [
            'views_path' => 'resources/themes/default/views',
            'assets_path' => 'public/themes/default/assets',
            'name' => 'Default'
        ],
        'jawwal' => [
            'views_path' => 'resources/themes/test/views',
            'assets_path' => 'public/themes/test/assets',
            'name' => 'test'
        ],
        'test' => [
            'views_path' => 'resources/themes/jawwal/views',
            'assets_path' => 'public/themes/jawwal/assets',
            'name' => 'jawwal'
        ],

         'HassanExpress' => [
             'views_path' => 'resources/themes/HassanExpress/views',
             'assets_path' => 'public/themes/hassan/assets',
             'name' => 'HassanExpress',
         ],


        'velocity' => [
            'views_path' => 'resources/themes/velocity/views',
            'assets_path' => 'public/themes/velocity/assets',
            'name' => 'Velocity',
            'parent' => 'default'
        ],
    ],

    'admin-default' => 'default',

    'admin-themes' => [
        'default' => [
            'views_path' => 'resources/admin-themes/default/views',
            'assets_path' => 'public/admin-themes/default/assets',
            'name' => 'Default'
        ]
    ]
];