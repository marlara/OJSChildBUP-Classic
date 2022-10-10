/**
 * @file /js/custom.js
 *
 * Copyright (c) Lara Marziali
 * Distributed under the GNU GPL v3. For full terms see the file LICENSE.
 *
 * @brief Handle JavaScript functionality unique to this theme.
 */

 (function($) {

	// Conditional logic for the sidebar wheter issue not exists and the additional content exists

    if($(".current_issue").length < 0  && $('.additional_content').length ) //Try to check the length of the selector, if it returns you something then the element must exists else not.
    {
        $( ".additional-content" ).append( $( ".sidebar_wrapper" ) );
    } else if($(".current_issue").length){
        $(".sidebar_wrapper").insertAfter($(".sections"));
    }

})(jQuery);