// ==UserScript==
// @name        Leader Telegram
// @include     *://*.leadertelegram.com/*
// ==/UserScript==

/* ~/.config/qutebrowser/greasemonkey/leadertelegram.css.js :: */
/* intended for qutebrowser with darkmode enabled */

GM_addStyle(`
    #asset-below,
    #main-bottom-container,
    #site-footer-container,
    #site-header,
    #site-header-container,
    #sticky-anchor,
    #tncms-region-article_bottom,
    #tncms-region-front-full-top,
    .ad-col,
    .col-md-12,
    .fixed-col-right,
    .header-promo,
    .main-sidebar,
    .modal-body,
    .nav-home,
    .not-logged-in,
    .paging-link,
    .row-senary,
    .site-logo-container,
    .subscription-required,
    .tnt-photo-purchase {
        display: none !important;
    }
`)
