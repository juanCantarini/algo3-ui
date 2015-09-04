package pantallaPrincipal

import ar.tp.dieta.Accion2
import ar.tp.dieta.Busqueda
import ar.tp.dieta.Busqueda2
import ar.tp.dieta.CondicionVegano
import ar.tp.dieta.CondimentoBuilder
import ar.tp.dieta.Filtro
import ar.tp.dieta.FiltroPorGustos
import ar.tp.dieta.FiltroPorIngredienteCaro
import ar.tp.dieta.IngredienteBuilder
import ar.tp.dieta.PosteriorBusquedaDiezPrimeros
import ar.tp.dieta.PosteriorBusquedaOrdenadoCalorias
import ar.tp.dieta.Receta
import ar.tp.dieta.RecetaBuilder
import ar.tp.dieta.RecetarioPublico
import ar.tp.dieta.RutinaActiva
import ar.tp.dieta.TestRepositorio
import ar.tp.dieta.Usuario
import ar.tp.dieta.UsuarioBuilder
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class PantallaPrincipalAplicationModel extends TestRepositorio{
	
	Busqueda2 busquedaUsuario = new Busqueda2
	Receta recetaSeleccionada
	Accion2 accion = new Accion2
	List<Receta> recetas = new ArrayList<Receta>
	Usuario usuario
	RecetarioPublico recetario = new RecetarioPublico
	String mensaje
	Busqueda busqueda1 = new Busqueda => [
			agregarFiltro(new FiltroPorIngredienteCaro)
	]
	Busqueda busqueda2 = new Busqueda => [
			agregarFiltro(new PosteriorBusquedaOrdenadoCalorias)
	]
	Busqueda busqueda3 = new Busqueda => [
			agregarFiltro(new FiltroPorGustos)
	]
	Filtro filtroPrimeras = new PosteriorBusquedaDiezPrimeros
	
	new(){
		
		arrozConPollo = new RecetaBuilder("Arroz con Pollo").calorias(500).autor("Carlos Nahir").dificultad(RecetaBuilder.FACIL).procesoPreparacion("Hervir el arroz con azafran y agregar el pollo previamente salteado").temporada(RecetaBuilder.INVIERNO).agregarIngrediente(new IngredienteBuilder("arroz").cantidad(500).build()).agregarIngrediente(new IngredienteBuilder("pollo").cantidad(1000).build()).agregarCondimento(new CondimentoBuilder("azafran").cantidad(2).build()).build()
		fideosConManteca = new RecetaBuilder("Fideos con manteca").calorias(600).autor("Narda Lepes").dificultad(RecetaBuilder.MEDIA).procesoPreparacion("Hervir los fideos. Colar.").temporada(RecetaBuilder.INVIERNO).agregarIngrediente(new IngredienteBuilder("pasta").cantidad(500).build()).agregarCondimento(new CondimentoBuilder("sal").cantidad(2).build()).agregarIngrediente(new IngredienteBuilder("manteca").cantidad(10).build()).build()
		lomoMostaza = new RecetaBuilder("Lomo a la Mostaza").calorias(1200).autor("Mirtha Legrand").dificultad(RecetaBuilder.DIFICIL).procesoPreparacion("Poner el lomo con la mostaza en el horno.").temporada(RecetaBuilder.VERANO).agregarIngrediente(new IngredienteBuilder("lomo").cantidad(1000).build()).agregarCondimento(new CondimentoBuilder("sal").cantidad(2).build()).agregarCondimento(new CondimentoBuilder("mostaza").cantidad(30).build()).build()
		gelatinaFrambuesa = new RecetaBuilder("Gelatina de Frambuesa").calorias(120).autor("Dolly").dificultad(RecetaBuilder.FACIL).procesoPreparacion("Mezclar gelatina azucar y agua").temporada(RecetaBuilder.VERANO).agregarIngrediente(new IngredienteBuilder("gelatina").cantidad(250).build()).agregarCondimento(new CondimentoBuilder("azucar").cantidad(500).build()).build()
		ensalada = new RecetaBuilder("Ensalada").calorias(10).autor("Antonio Gasalla").dificultad(RecetaBuilder.FACIL).procesoPreparacion("Cortar la verdura y mezclar. No olvidar de lavar").temporada(RecetaBuilder.PRIMAVERA).agregarIngrediente(new IngredienteBuilder("cebolla").cantidad(150).build()).agregarIngrediente(new IngredienteBuilder("lechuga").cantidad(300).build()).agregarIngrediente(new IngredienteBuilder("tomate").cantidad(150).build()).agregarCondimento(new CondimentoBuilder("sal").cantidad(2).build()).build()
		arrozBlanco = new RecetaBuilder("Arroz Blanco").calorias(10).autor("Antonio Gasalla").dificultad(RecetaBuilder.FACIL).procesoPreparacion("Hervir el arroz. Comer.").temporada(RecetaBuilder.OTOÑO).agregarIngrediente(new IngredienteBuilder("arroz").cantidad(500).build()).build()
		
		basket = new RutinaActiva => [
			setTiempoDeEjercicio(240)
		]
		
		usuario = new UsuarioBuilder("Miguel").peso(70.5).altura(1.73).fechaNacimiento(1989, 6, 28).sexo("M").rutina(basket).condicion(new CondicionVegano).preferencia("fruta").email("soyvegano@edrans.com").build()
		
		usuario.misRecetas.add(arrozConPollo)
		recetario.agregarReceta(fideosConManteca)
		recetario.agregarReceta(lomoMostaza)
		recetario.agregarReceta(gelatinaFrambuesa)
		recetario.agregarReceta(ensalada)
		recetario.agregarReceta(arrozBlanco)
		usuario.recetario = recetario
//		usuario.agregarRecetaFavorita(lomoMostaza)
//		usuario.agregarRecetaFavorita(ensalada)
//		usuario.agregarRecetaFavorita(gelatinaFrambuesa)
//		usuario.agregarRecetaFavorita(fideosConManteca)
//		usuario.agregarRecetaFavorita(arrozBlanco)
//		usuario.agregarRecetaFavorita(arrozConPollo)
		usuario.accion2 = accion
		usuario.comidasQueNoMeGustan.add("arroz")
		usuario.agregarBusqueda(busqueda1)
		usuario.busquedaFiltrada()
		usuario.removerBusqueda(busqueda1)
		usuario.agregarBusqueda(busqueda2)
		usuario.busquedaFiltrada()
		usuario.removerBusqueda(busqueda2)
		usuario.agregarBusqueda(busqueda3)
		usuario.busquedaFiltrada()
		usuario.removerBusqueda(busqueda3)
		recetas.addAll(establecerRecetas())
	}
	
	def establecerRecetas() {
	
			if(!usuario.recetasFavoritas2.isEmpty){	
				mensaje = "Estas son sus recetas favoritas"
				return(filtroPrimeras.aplicarFiltroUsuario(usuario,usuario.recetasFavoritas2))
			}else{
				if(!usuario.misBusquedas.isEmpty){
					mensaje = "Este es el resultado de su ultima consulta"
					return(filtroPrimeras.aplicarFiltroUsuario(usuario,usuario.busquedaFiltrada))
				}else{
					mensaje = "Estas son las recetas mas consultadas"
					return(filtroPrimeras.aplicarFiltroUsuario(usuario,usuario.accion2.getRecetasFinales))
				}
		}
	}
	
	def refrescar() {
		recetas.removeAll
		recetas = filtrar()
	}
	
	//////////////////  ENTRA A FAVORITO/////////////////////
	
	def void agregarORemoverRecetaFavorita(){
			if(usuario.recetasFavoritas2.contains(recetaSeleccionada)){
				usuario.eliminarRecetaFavorita(recetaSeleccionada)
			} else{ 
				usuario.agregarRecetaFavorita(recetaSeleccionada)
			}
	}
	
	def filtrar(){
		busquedaUsuario.filtrar(usuario,usuario.recetasQuePuedoVer)
	}
}
