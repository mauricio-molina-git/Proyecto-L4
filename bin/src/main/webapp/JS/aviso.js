function mensaje(estado) {
switch (estado) {
	case 1:
		alert("Exito");
		break;
	case 2:
		alert("No se pudo :(");
		break;
	case 3:
		alert("Datos de entrada invalidos!");
		break;
	default:
		return;
		break;
	}
}