function urlencode(str) {
	str = escape(str);
	str = str.replace('+', '%2B');
	str = str.replace('%20', '+');
	str = str.replace('*', '%2A');
	str = str.replace('/', '%2F');
	str = str.replace('@', '%40');
	return str;
}

function urldecode(str) {
	str = str.replace('+', ' ');
	str = unescape(str);
	return str;
}
/*
function $(o) {
	return document.getElementById(o);
}
*/
function $set(o, p) {
	document.getElementById(o).innerHTML = p;
}

function $value(o, p) {
	return $(o).value = p;
}

function JsonToArray(params) {
	try {
		return eval('(' + params + ')');
	} catch (e) {
		return new Array();
	}
}

function ArrayToJson(param) {
	function convert(param) {
		var txt = '';
		for ( var i in param) {
			if (typeof (param[i]) == "object")
				txt += '"' + i + '":' + convert(param[i]) + '},';
			else
				txt += '"' + i + '":"' + param[i] + '",';
		}
		return '{' + txt.substr(0, (txt.length - 1)) + '}';
	}
	return convert(param);
}