package CopiarReceta

import ar.tp.dieta.CondimentoBuilder
import ar.tp.dieta.ElementoDeReceta
import ar.tp.dieta.Ingrediente
import ar.tp.dieta.IngredienteBuilder
import ar.tp.dieta.Receta
import ar.tp.dieta.RecetaBuilder
import ar.tp.dieta.Usuario
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
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
		
		
		if(!usuario.misRecetas.contains(receta)){
			var recetaTemporal = new Receta
			val elementosRecetaTemporal = new ArrayList<ElementoDeReceta>
			
			receta.elementosDeReceta.forEach[ elemento | if(elemento.getClass().equals(new Ingrediente)){
																elementosRecetaTemporal.add(new IngredienteBuilder(elemento.nombre).cantidad(elemento.cantidad).build())
																
															}else{
																elementosRecetaTemporal.add(new CondimentoBuilder(elemento.nombre).cantidad(elemento.cantidad).build())
															}]
			
			recetaTemporal = new RecetaBuilder(nombreCopia).calorias(receta.calorias).autor(usuario.nombre).dificultad(receta.dificultadDePreparacion).procesoPreparacion(receta.procesoDePreparacion).temporada(receta.temporadaALaQueCorresponde).build()
			recetaTemporal.elementosDeReceta.addAll(elementosRecetaTemporal)
			usuario.misRecetas.add(recetaTemporal)	
		}
	}				
}