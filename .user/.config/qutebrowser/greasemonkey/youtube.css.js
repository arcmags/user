// ==UserScript==
// @name        YouTube
// @include     *://*.youtube.com/*
// ==/UserScript==

/* ~/.config/qutebrowser/greasemonkey/youtube.css.js :: */

GM_addStyle(`
    .ytd-action-companion-ad-renderer,
    .ytd-ad-slot-renderer {
        display: none !important;
    }
`)
