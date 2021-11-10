object inta{
	const parcelas = []
	
	method cantPlantas() = parcelas.sum {p=>p.cantPlantas()}
	method cantParcelas() = parcelas.size()
	method promedioDePlantas() =  self.cantPlantas() / self.cantParcelas() 
	
	method parcelaMasAutosustentable (){}
	method agregarParcelas(loteDeParcelas){parcelas.addAll(loteDeParcelas)}
}
