
class Planta{
	
	const property anioDeObtencion
	const property altura
	
	method toleranciaAlSol()
	method esFuerte() = self.toleranciaAlSol() >= 10
	method condicionBasica() {return self.esFuerte()}
	method condicionAlternativa()
	method daSemillas(){return self.condicionBasica()|| self.condicionAlternativa()}
	method espacioOcupado()
	
}


class Menta inherits Planta{
	
	override method toleranciaAlSol(){ return 6}
	
	override method condicionAlternativa(){return altura > 0.4}
	
	override method espacioOcupado(){return altura * 3}
	method esParcelaIdeal(unaParcela) {return unaParcela.superficie()>6}
}

class Soja inherits Planta{
	
	override method toleranciaAlSol(){
		var tolerancia = 9
		if (altura < 0.5) {tolerancia = 6}
		else if (altura.between(0.5,1)) {tolerancia = 7}
		return tolerancia
	}
	
	override method condicionAlternativa(){return anioDeObtencion > 2007 && altura > 1}
	override method espacioOcupado(){return altura * 0.5}
	method esParcelaIdeal(unaParcela) {return self.toleranciaAlSol()== unaParcela.horasDeSol()}
}

class Quinoa inherits Planta{
	const property toleranciaAlSol
	
	override method toleranciaAlSol() = toleranciaAlSol
	
	override method condicionAlternativa(){return anioDeObtencion < 2005}
	
	override method espacioOcupado(){return 0.5}
	
	method esParcelaIdeal(unaParcela) = unaParcela.plantas().any {p=>p.altura()>1.5}
}


class Hierbabuena inherits Menta{
	override method espacioOcupado() {return super()*2}
}

class SojaTransgenica inherits Soja{
	override method daSemillas(){return false}
	
	override method esParcelaIdeal(unaParcela) = unaParcela.cantidadMaxima() == 1
}