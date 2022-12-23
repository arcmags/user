// ==UserScript==
// @name        Reddit
// @include     *://*.reddit.com/*
// ==/UserScript==

/* ~/.config/qutebrowser/greasemonkey/reddit.css.js :: */
/* intended for qutebrowser with darkmode enabled */

GM_addStyle(`
    .account-activity-box,
    .premium-banner,
    .premium-banner-outer,
    .promotedlink,
    .redesign-beta-optin,
    .sidebox.create {
        display: none !important;
    }

    body,
    body:before,
    #header,
    .commentarea,
    .option,
    .side,
    .titlebox,
    .usertext-body {
        background: none !important;
    }

    textarea {
        background: #000000 !important;
    }
`)
