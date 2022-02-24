var idProvincias;
var idLocalidades;
var nombreLocalidades;

function crearLista(source) {
	return JSON.parse(source);
}

function listarLocalidades(idProvincia, cmb) {
	cmb.length = 0;
	if (idProvincia == -1)
		return;
	for (var i = 0; i < idProvincias.length; ++i) {
		if (idProvincias[i] == idProvincia) {
			cmb.options.add(new Option(nombreLocalidades[i], idLocalidades[i]));
		}
	}
}