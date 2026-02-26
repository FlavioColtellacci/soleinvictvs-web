/* ─────────────────────────────────────────────────────────────
   SOLEINVICTVS — main.js
   Mobile nav toggle. Loaded with defer on all pages.
───────────────────────────────────────────────────────────── */

document.addEventListener('DOMContentLoaded', function () {
  var toggle = document.querySelector('.nav-toggle');
  if (!toggle) return;

  // Open / close on hamburger click
  toggle.addEventListener('click', function () {
    var isOpen = document.body.classList.toggle('nav-open');
    toggle.setAttribute('aria-expanded', isOpen.toString());
  });

  // Close on nav link click (navigating away or same-page anchor)
  document.querySelectorAll('.nav-links a').forEach(function (link) {
    link.addEventListener('click', function () {
      document.body.classList.remove('nav-open');
      toggle.setAttribute('aria-expanded', 'false');
    });
  });

  // Close on Escape key
  document.addEventListener('keydown', function (e) {
    if (e.key === 'Escape' && document.body.classList.contains('nav-open')) {
      document.body.classList.remove('nav-open');
      toggle.setAttribute('aria-expanded', 'false');
    }
  });
});
