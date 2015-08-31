package detalleReceta

import ar.tp.dieta.CondimentoBuilder
import ar.tp.dieta.IngredienteBuilder
import ar.tp.dieta.Receta
import ar.tp.dieta.RecetaBuilder
import ar.tp.dieta.RutinaActiva
import ar.tp.dieta.Usuario
import ar.tp.dieta.UsuarioBuilder
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class DetalleRecetaAplicationModel {
	
	Usuario usuario
	Receta receta
	
	new (Receta recetaSeleccionada, Usuario usuarioSeleccionado) {
		receta = recetaSeleccionada
		usuario = usuarioSeleccionado
	} 
	
	def boolean getFavorita() {
		usuario.agregarRecetaFavorita(receta.nombreDeLaReceta)
		usuario.contenesEstaRecetaEnFavs(receta.nombreDeLaReceta)
	}
	
	def boolean getEditable() {
		false
	}
	
//	def setFavorita(boolean favorita){
//		if(favorita) {
//			usuario.agregarRecetaFavorita(receta.nombreDeLaReceta)
//		} else {
//			usuario.
//		}
//	}
}