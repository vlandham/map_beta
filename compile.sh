#!/usr/bin/env bash

coffee -o all_js/ -c coffee/vis.coffee

cat all_js/plugins.js all_js/script.js all_js/CustomTooltip.js all_js/libs/jquery-ui-1.8.21.custom.min.js all_js/selectToUISlider.jQuery.js all_js/libs/bootstrap-tooltip.js all_js/libs/crossfilter.min.js all_js/vis.js | uglifyjs -o js/vis.min.js
