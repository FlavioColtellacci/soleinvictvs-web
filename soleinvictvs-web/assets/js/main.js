/* =======================================
   SOLEINVICTVS — main.js
   C-006-B · Three behaviors · No libraries
   ======================================= */

document.addEventListener('DOMContentLoaded', function () {

  /* === NAV SCROLL === */
  var nav = document.querySelector('nav');
  window.addEventListener('scroll', function () {
    nav.classList.toggle('scrolled', window.scrollY > 60);
  }, { passive: true });

  /* === MOBILE NAV === */
  var hamburger = document.querySelector('.hamburger');
  var navMenu   = document.querySelector('.nav-menu');

  hamburger.addEventListener('click', function () {
    navMenu.classList.toggle('open');
  });

  navMenu.querySelectorAll('a').forEach(function (link) {
    link.addEventListener('click', function () {
      navMenu.classList.remove('open');
    });
  });

  document.addEventListener('click', function (e) {
    if (!nav.contains(e.target)) {
      navMenu.classList.remove('open');
    }
  });

  /* === FADE-IN OBSERVER === */
  var observer = new IntersectionObserver(function (entries) {
    entries.forEach(function (entry) {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
        observer.unobserve(entry.target);
      }
    });
  }, { threshold: 0.15 });

  document.querySelectorAll('.fade-in').forEach(function (el) {
    observer.observe(el);
  });

});
