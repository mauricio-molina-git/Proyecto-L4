function validarInput(txtInput, rEx) {
	var texto = txtInput.value;

	if (!rEx.test(texto)) {
		var caracteres = stringToArray(texto);
		caracteres.pop();
		var cad = arrayToString(caracteres);
		txtInput.value = cad;
	}
}

function stringToArray(str) {
	var arreglo = [];
	for (var i = 0; i < str.length; ++i)
		arreglo.push(str.charAt(i));
	return arreglo;
}

function arrayToString(arreglo) {
	var str = "";
	for (var i = 0; i < arreglo.length; ++i)
		str = str + arreglo[i];
	return str;
}

function mensajeError(Input, str) {
	if (Input.validity.patternMismatch)
		Input.setCustomValidity(str);
	else
		Input.setCustomValidity("");
}