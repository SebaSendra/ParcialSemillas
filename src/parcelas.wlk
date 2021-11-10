
class Parcela {
	const property ancho
	const property largo
	const property horasDeSol
	const plantas = []
	
	method superficie()= ancho * largo
	method cantidadMaxima() {
		var cantidad
		if (ancho>largo)
			cantidad = self.superficie() / 5
		else {cantidad = self.superficie() / 3 + largo}
		return cantidad
	}
	method tieneComplicaciones()= plantas.any{p=>p.toleranciaAlSol()<horasDeSol}
	
	method plantarPlanta(unaPlanta){
		plantas.add(unaPlanta)
		if (self.superaElMaximo() || self.leDaMuchoSol()){
			self.error('Error, la capacidad ha sido superada, o la planta no tolera el sol')
		}
	}
	method superaElMaximo() = plantas.size() > self.cantidadMaxima()
	method leDaMuchoSol() = horasDeSol >= plantas.last().toleranciaAlSol()+2
	method plantarLote(loteDePlantas) {plantas.addAll(loteDePlantas)}
	method quitarPlanta(unaPlanta){plantas.remove(unaPlanta)}
	method quitarLote(loteDePlantas){plantas.removeAll(loteDePlantas)}
	method horasDeSol() =horasDeSol
	method plantas() = plantas
	method cantPlantas() = plantas.size()
	
}

class ParcelaEcologica inherits Parcela {
	
	method seAsociaBien(unaPlanta)= not self.tieneComplicaciones() && unaPlanta.esParcelaIdeal(self)
}

class ParcelaIndustrial inherits Parcela {
	method seAsociaBien(unaPlanta)= plantas.size() <= 2 && unaPlanta.esFuerte()
}