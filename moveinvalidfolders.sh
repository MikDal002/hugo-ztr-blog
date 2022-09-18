#!/bin/bash

# Languages must start with public/ to make simpler intersections
languages=(
"public" # default language PL 
"public/en" 
)

corrections=(
    "%%LANG%%/tags/.net %%LANG%%/tags/net" 
    "%%LANG%%/categories/.net %%LANG%%/categories/net" 
)

for index in ${!corrections[*]} 
do
    for lang in ${languages[*]}
    do
        item=${corrections[index]}
        working="${item//%%LANG%%/${lang}}" 
        
        mv $working
        # _redirects file must be like in netlify docs https://docs.netlify.com/routing/redirects/
        echo "${working//public/}" >> public/_redirects
    done
    echo "next!"
done
