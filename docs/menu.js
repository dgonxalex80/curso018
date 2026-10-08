document.addEventListener('DOMContentLoaded', function () {
  var navbar = document.getElementById('navbar');
  if (!navbar) return;

  var mobileToggle = document.querySelector('.navbar-toggle');
  if (mobileToggle) {
    mobileToggle.setAttribute('aria-label', 'Abrir o cerrar el menú del curso');
    mobileToggle.setAttribute('aria-controls', 'navbar');
    mobileToggle.setAttribute('aria-expanded', 'false');
  }

  function setOpen(item, open) {
    item.classList.toggle('submenu-open', open);
    item.querySelector('a').setAttribute('aria-expanded', String(open));
  }

  // Los submenús se abren con clic, toque, Enter o Espacio.
  navbar.querySelectorAll('.dropdown-submenu').forEach(function (item, index) {
    var toggle = item.querySelector('a');
    var menu = item.querySelector('ul');
    menu.id = 'curso-submenu-' + index;
    toggle.setAttribute('aria-controls', menu.id);
    toggle.removeAttribute('data-toggle');
    toggle.removeAttribute('data-bs-toggle');
    toggle.addEventListener('click', function (event) {
      event.preventDefault();
      event.stopPropagation();
      var open = !item.classList.contains('submenu-open');
      item.parentElement.querySelectorAll('.dropdown-submenu').forEach(function (sibling) {
        setOpen(sibling, false);
      });
      setOpen(item, open);
    });
    toggle.addEventListener('keydown', function (event) {
      if (event.key === ' ' || event.key === 'ArrowRight') {
        event.preventDefault();
        event.stopPropagation();
        if (event.key === ' ') toggle.click();
        else { setOpen(item, true); menu.querySelector('a').focus(); }
      }
    });
    item.addEventListener('keydown', function (event) {
      if (event.key === 'Escape' || event.key === 'ArrowLeft') {
        event.preventDefault();
        event.stopPropagation();
        setOpen(item, false);
        toggle.focus();
      }
    });
  });

  var page = window.location.pathname.split('/').pop() || 'index.html';
  navbar.querySelectorAll('a[href]').forEach(function (link) {
    if (link.getAttribute('href') !== page) return;
    link.setAttribute('aria-current', 'page');
    link.parentElement.classList.add('active');
    var submenu = link.closest('.dropdown-submenu');
    if (submenu) { submenu.classList.add('active'); setOpen(submenu, true); }
  });

  if (window.jQuery) {
    window.jQuery(navbar).on('hidden.bs.dropdown', function (event) {
      event.target.querySelectorAll('.dropdown-submenu').forEach(function (item) {
        setOpen(item, false);
      });
    });
  }
});
