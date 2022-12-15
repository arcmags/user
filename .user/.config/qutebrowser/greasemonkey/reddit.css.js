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
    #header,
    .option,
    .side {
        background: none !important;
    }
`)
