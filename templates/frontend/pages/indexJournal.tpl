{**
    * templates/frontend/pages/indexJournal.tpl
    *
    *
    * @brief Display the index page for a journal
    *
    * @uses $currentJournal Journal This journal
    * @uses $journalDescription string Journal description from HTML text editor
    * @uses $homepageImage object Image to be displayed on the homepage
    * @uses $additionalHomeContent string Arbitrary input from HTML text editor
    * @uses $announcements array List of announcements
    * @uses $numAnnouncementsHomepage int Number of announcements to display on the
    *       homepage
    * @uses $issue Issue Current issue
    * @uses $issueIdentificationString string issue identification that relies on user's settings
    *}
   
   {include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}
   
   <main class="page_index_journal">
   
       {* Display homepage image if set, and wrap around journal summary if use chooses to display it *}
       {if $homepageImage} {*this has errors, so I corrected it with a new class "linear-gradient*}
           <div
               class="homepage_image{if $showJournalSummary} linear-gradient"{/if}
               style="background-image:url('{$publicFilesDir}/{$homepageImage.uploadName}')"
               >
               
       {/if}
   
       {if $showJournalSummary && $currentJournal->getLocalizedDescription()}
           <section class="container journal_summary"{if $homepageImage}style="color: #FFF"{/if}>
               <h2>{translate key="navigation.about"}</h2>
               {$currentJournal->getLocalizedDescription()}
           </section>
       {/if}
   
       {if $homepageImage}
           </div>
       {/if}
   
       <div class="container-fluid container-page">
   
           {* Announcements *}
           {if $announcements}
               <section class="announcements">
                   <h2>{translate key="announcement.announcements"}</h2>
                   <div class="row">
                       {foreach from=$announcements item=announcement}
                           <article class="col-md-4 announcement">
                               <p class="announcement_date">{$announcement->getDatePosted()|date_format:$dateFormatShort|escape}</p>
                               <h3 class="announcement_title">
                                   <a href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()|escape}">
                                       {$announcement->getLocalizedTitle()|escape}
                                   </a>
                               </h3>
                           </article>
                       {/foreach}
                   </div>
               </section>
           {/if}
   
           {call_hook name="Templates::Index::journal"}
   
           {* Latest issue *}
           
           {if $issue}
               <section class="current_issue">
                   <header>
                       {strip}
                           <h2 class="current_issue_title">
                               <span class="current_issue_label">{translate key="journal.currentIssue"}</span>
                               {if $issueIdentificationString}
                                    <span class="current_issue_identification">{$issueIdentificationString|escape}</span>
                               {/if}
                           </h2>
                       {/strip}
   
                       {* Published date *}
                       {if $issue->getDatePublished()}
                           <p class="published">
                               <span class="date_label">
                                   {translate key="submissions.published"}
                               </span>
                               <span class="date_format">
                                       {$issue->getDatePublished()|date_format:$dateFormatLong}
                               </span>
                           </p>
                       {/if}
                   </header>
                   {include file="frontend/objects/issue_toc.tpl"}
                   
                   {if $hasSidebar}
                    <div class="sidebar_wrapper" role="complementary">
                        {call_hook name="Templates::Common::Sidebar"}
                    </div>
                    <div class="clearfix"></div>
                    {/if}
                    <a class="read_more btn btn-secondary" href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}">
                        {translate key="journal.viewAllIssues"}
                    </a>
               </section>
               
            {else}
                {if $hasSidebar}
                   <div class="sidebar_wrapper" role="complementary">
                       {call_hook name="Templates::Common::Sidebar"}
                   </div>
                {/if}

            {/if}
   
   
           {* Additional Homepage Content *}
           {if $additionalHomeContent}
                <section class="additional_content">
                   {$additionalHomeContent}
               </section>
           {/if}
       </div>
   </main><!-- .page -->

{include file="frontend/components/footer.tpl"}