	var bitMenu = document.querySelector('.bitMenu');

	function showMenu(x, y){
		bitMenu.style.left = x + 'px';
		bitMenu.style.top = y + 'px';
		bitMenu.classList.add('show-bitMenu');
	}

	function hideMenu(){
		bitMenu.classList.remove('show-bitMenu');
	}

	function onContextMenua(e){
		e.preventDefault();
		showMenu(e.pageX, e.pageY);
		document.addEventListener('mousedown', onMouseDown, false);
	}

	function onMouseDown(e){
		hideMenu();
		document.removeEventListener('mousedown', onMouseDown);
	}

	document.addEventListener('contextmenu', onContextMenua, false);
