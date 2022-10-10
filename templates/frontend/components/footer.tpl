{**
    * templates/frontend/components/footer.tpl
    *
    * 
    * @brief Site-wide footer; designed to contain a sidebar hook
    *
    *}
   
   <footer class="site-footer">
       <div class="container-fluid container-footer"> {* cancelled the sidebar div *}
           <div class="additional-footer-info">
               {if $pageFooter}
                   <div class="user-page-footer">
                       {$pageFooter}
                   </div>
               {/if}
               <div class="pkpbrand-wrapper" role="complementary">
                   <a href="{url page="about" op="aboutThisPublishingSystem"}">
                       <img class="footer-brand-image" alt="{translate key="about.aboutThisPublishingSystem"}" src="{$baseUrl}/{$brandImage}">
                   </a>
               </div>
           </div>
       </div>
   </footer>
   
   {load_script context="frontend"}
   
   {call_hook name="Templates::Common::Footer::PageFooter"}
   
   </body>
   </html>