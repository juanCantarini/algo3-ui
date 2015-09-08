package detalleReceta

import ar.tp.dieta.Receta
import ar.tp.dieta.Usuario
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
		usuario.contenesEstaRecetaEnFavs(receta)
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