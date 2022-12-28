// ==UserScript==
// @name        Arch Wiki
// @include     *://wiki.archlinux.org/*
// ==/UserScript==

/* ~/.config/qutebrowser/greasemonkey/wiki.archlinux.css.js :: */

GM_addStyle(`
    .sidebar-toc:after {
        background: none !important;
    }
`)
