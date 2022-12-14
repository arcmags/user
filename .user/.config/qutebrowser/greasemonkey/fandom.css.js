// ==UserScript==
// @name        Fandom
// @include     *://*.fandom.com/*
// ==/UserScript==

GM_addStyle(`
    #mixed-content-footer, #WikiaBar, .fandom-sticky-header.is-visible,
    .bottom-ads-container, .top-ads-container, .page__right-rail {
        display: none !important;
    }
    .main-container {
        background: #ffffff !important;
    }
    body.theme-fandomdesktop-dark .main-page .mcwiki-header {
        background: none !important;
        border: none !important;
    }
`)
