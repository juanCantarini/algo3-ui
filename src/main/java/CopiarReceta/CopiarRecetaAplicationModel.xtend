package CopiarReceta

import ar.tp.dieta.CondimentoBuilder
import ar.tp.dieta.IngredienteBuilder
import ar.tp.dieta.Receta
import ar.tp.dieta.RecetaBuilder
import ar.tp.dieta.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class CopiarRecetaAplicationModel {
	
	String nombreCopia  
	Receta receta
	Usuario usuario
	
	new(Receta parametroReceta, Usuario parametroUsuario){
		receta = parametroReceta
		usuario = parametroUsuario
		nombreCopia = receta.nombreDeLaReceta
	}
	
	def void copiar(){
		
		if(!usuario.repitoReceta(receta.nombreDeLaReceta)){
			val recetaTemporal = new RecetaBuilder(nombreCopia).calorias(receta.calorias).autor(usuario.nombre).dificultad(receta.dificultadDePreparacion).procesoPreparacion(receta.procesoDePreparacion).temporada(receta.temporadaALaQueCorresponde).build()
			receta.ingredientes.forEach [ ingrediente | recetaTemporal.ingredientes.add(new IngredienteBuilder(ingrediente.nombre).cantidad(ingrediente.cantidad).build())]
			receta.condimentos.forEach [ condimento | recetaTemporal.condimentos.add(new CondimentoBuilder(condimento.nombre).cantidad(condimento.cantidad).build())]
			usuario.misRecetas.add(recetaTemporal)	
		}else{
			throw new UserException("Ya tiene una receta con ese nombre")
		}
	}				
}