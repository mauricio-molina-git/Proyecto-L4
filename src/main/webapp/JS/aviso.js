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
	case 4:
		alert("No se pudo registrar, ambas password deben coincidir!");
		break;
	case 5:
		alert("Usuario agregado, ya puede iniciar sesion");
		break;
	case 6:
		alert("No se pudo agregar, ya existe ese usuario");
		break;
	case 7:
		alert("No se pudo agregar, faltaron datos");
		break;
	case 8:
		alert("Nose pudo agregar, proveedor ya existente");
		break;
	case 9:
		alert("No se pudo modificar, ambas password deben coincidir!");
		break;
	default:
		return;
		break;
	}
}