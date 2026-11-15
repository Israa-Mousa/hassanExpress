<?php

namespace App\Http\Middleware;

use Closure;

class LangMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {

	    if (strpos($request->url(), 'admin') !== false) {
		    $input = $request->all();
		    if(!isset($input['locale'])){
			    $input['locale']    =   'ar';
		    }
		    $request->replace($input);

	    }

	    return $next($request);
    }
}
