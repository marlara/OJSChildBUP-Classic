/**
 * @file /js/custom.js
 *
 * Copyright (c) Lara Marziali
 * Distributed under the GNU GPL v3. For full terms see the file LICENSE.
 *
 * @brief Handle JavaScript functionality unique to this theme.
 */

 (function($) {

    //Conditional logic if there is not an issue but there is the additional content

    if($(".current_issue").length == 0  && $('.additional_content').length ) {
        $(".sidebar_wrapper").insertAfter($('.additional_content'));
        $(".additional_content").css({"width": "70%", "float": "left"}); 
    }

})(jQuery);