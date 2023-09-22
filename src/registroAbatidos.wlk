object registroAbatidosCOD {
	const property registro = [[20230922,10],[20230921,20]]
	
	method existeElDia(dia){
		return registro.any({elemento => elemento.get(0) == dia})
	}
	
	method agregarAbatidosDia(cantidad,dia){
		if(!self.existeElDia(dia)){registro.add([dia,cantidad])}else{self.error("Ya existe registro para el día indicado")}
	}
	
	method agregarAbatidosVariosDias(listas){
		registro.addAll(listas)
	}
	
	method elElementoConElDia(dia){
		return registro.find({elemento => elemento.get(0) == dia})
	}
	
	method eliminarElRegistroDelDia(dia){
		self.elElementoConElDia(dia).remove(self.cantidadDeAbatidosDelDia(dia))
	}
	
	method eliminarElRegistroDeLosDias(dia1,dia2,dia3){
		self.eliminarElRegistroDelDia(dia1)
		self.eliminarElRegistroDelDia(dia2)
		self.eliminarElRegistroDelDia(dia3)
	}
	
	method cantidadDeDiasRegistrados(){
		return registro.count({elementos => elementos.contains(registro.get(0))})
	}
	
	method estaVacioElRegistro(){
		return registro.isEmpty()
	}
	
	method algunDiaAbatio(cantidad){
		return registro.find({elemento => elemento.get(1) == cantidad})
	}
	
	method primerValorDeAbatidos(){
		return registro.get(0).get(1)
	}
	
	method ultimoValorDeAbatidos(){
		return registro.get(registro.last()).get(1)
	}
	
	method maximoValorDeAbatidos(){
		return registro.max({elemento => elemento.get(1)})
	}
	
	method totalAbatidos(){
		return registro.sum({elemento => elemento.get(1)})
	}
	
	method cantidadDeAbatidosDelDia(dia){
		return self.elElementoConElDia(dia).get(1)
	}
	
	method ultimoValorDeAbatidosConSize(){
		return registro.get(registro.size() - 1).get(1)
	}
	
	method diasConAbatidosSuperioresA(cuanto){
		return registro.filter({elemento => elemento.get(1) > cuanto})
	}
	
	method valoresDeAbatidosPares(){
		return registro.filter({elemento => elemento.get(1) % 2 == 0})
	}
	
	method elValorDeAbatidos(cantidad){
		return registro.find({elemento => elemento.get(1) == cantidad})
	}
	
	method abatidosSumando(cantidad){
		return registro.map({elemento => elemento.get(1) + cantidad})
	}
	
	method abatidosEsAcotada(n1,n2){
		return registro.any({elemento => elemento.get(1).between(n1,n2)})
	}
	
	method algunDiaAbatioMasDe(cantidad){
		return registro.any({elemento => elemento.get(1) > cantidad})
	}
	
	method todosLosDiasAbatioMasDe(cantidad){
		return registro.all({elemento => elemento.get(1) > cantidad})
	}
	
	method cantidadAbatidosMayorALaPrimera(){
		return registro.all({elemento => elemento.get(1) > self.primerValorDeAbatidos()})
	}
	
	method esCrack(){
		return registro.all({})
	}
}