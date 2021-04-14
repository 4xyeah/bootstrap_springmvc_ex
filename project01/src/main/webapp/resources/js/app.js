let changeNavColor = function () {
	document.addEventListener('scroll', () => {
		let nav = document.querySelector('#mainNavbar');
		if (document.documentElement.scrollTop > nav.clientHeight) {
			nav.classList.add('scrolled');
		} else if (document.documentElement.scrollTop === 0) {
			nav.classList.remove('scrolled');
		}
	});
};

changeNavColor();
