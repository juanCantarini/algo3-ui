package pantallas

import ar.tp.dieta.CondimentoBuilder
import ar.tp.dieta.IngredienteBuilder
import ar.tp.dieta.Receta
import ar.tp.dieta.RecetaBuilder
import ar.tp.dieta.RecetarioPublico
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
	
	new () {
		receta = new RecetaBuilder("polloAzafran")
		.calorias(500).autor("Daniel")
		.dificultad("Mediana")
		.procesoPreparacion("Hervir el arroz con azafran y agregar el pollo previamente salteado")
		.temporada("Invierno")
		.agregarCondimento(new CondimentoBuilder("azafran").cantidad(2).build())
		.agregarIngrediente(new IngredienteBuilder("carne").cantidad(50).build())
		.build()
		
		usuario = new UsuarioBuilder("Daniel")
		.peso(70.4)
		.altura(1.83)
		.fechaNacimiento(1992, 6, 4)
		.sexo("M")
		.rutina(new RutinaActiva => [
			setTiempoDeEjercicio(90)])
		.preferencia("carne")
		.preferencia("pescado")
		.email("usuariosincondicion@mail.com")
		.build()
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