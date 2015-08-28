package pantallaPrincipal

import ar.tp.dieta.Accion2
import ar.tp.dieta.Busqueda
import ar.tp.dieta.CondicionVegano
import ar.tp.dieta.CondimentoBuilder
import ar.tp.dieta.FiltroPorIngredienteCaro
import ar.tp.dieta.IngredienteBuilder
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
	
	Accion2 accion
	List<Receta> recetas = new ArrayList<Receta>
	List<Usuario> usuarios = new ArrayList<Usuario>
	RecetarioPublico recetario = new RecetarioPublico
	String mensaje
	Busqueda busqueda1 = new Busqueda => [
			agregarFiltro(new FiltroPorIngredienteCaro)
	]
	
	
	new(){
		
		arrozConPollo = new RecetaBuilder("Arroz con Pollo").calorias(500).autor("Carlos Nahir").dificultad("Mediana").procesoPreparacion("Hervir el arroz con azafran y agregar el pollo previamente salteado").temporada("Invierno").agregarIngrediente(new IngredienteBuilder("arroz").cantidad(500).build()).agregarIngrediente(new IngredienteBuilder("pollo").cantidad(1000).build()).agregarCondimento(new CondimentoBuilder("azafran").cantidad(2).build()).build()
		fideosConManteca = new RecetaBuilder("Fideos con manteca").calorias(600).autor("Narda Lepes").dificultad("Facil").procesoPreparacion("Hervir los fideos. Colar.").temporada("Invierno").agregarIngrediente(new IngredienteBuilder("pasta").cantidad(500).build()).agregarCondimento(new CondimentoBuilder("sal").cantidad(2).build()).agregarIngrediente(new IngredienteBuilder("manteca").cantidad(10).build()).build()
		lomoMostaza = new RecetaBuilder("Lomo a la Mostaza").calorias(1200).autor("Mirtha Legrand").dificultad("Dificil").procesoPreparacion("Poner el lomo con la mostaza en el horno.").temporada("Verano").agregarIngrediente(new IngredienteBuilder("lomo").cantidad(1000).build()).agregarCondimento(new CondimentoBuilder("sal").cantidad(2).build()).agregarCondimento(new CondimentoBuilder("mostaza").cantidad(30).build()).build()
		gelatinaFrambuesa = new RecetaBuilder("Gelatina de Frambuesa").calorias(120).autor("Dolly").dificultad("Facil").procesoPreparacion("Mezclar gelatina azucar y agua").temporada("Verano").agregarIngrediente(new IngredienteBuilder("gelatina").cantidad(250).build()).agregarCondimento(new CondimentoBuilder("azucar").cantidad(500).build()).build()
		ensalada = new RecetaBuilder("Ensalada").calorias(10).autor("Antonio Gasalla").dificultad("Facil").procesoPreparacion("Cortar la verdura y mezclar. No olvidar de lavar").temporada("Verano").agregarIngrediente(new IngredienteBuilder("cebolla").cantidad(150).build()).agregarIngrediente(new IngredienteBuilder("lechuga").cantidad(300).build()).agregarIngrediente(new IngredienteBuilder("tomate").cantidad(150).build()).agregarCondimento(new CondimentoBuilder("sal").cantidad(2).build()).build()
		arrozBlanco = new RecetaBuilder("Arroz Blanco").calorias(10).autor("Antonio Gasalla").dificultad("Facil").procesoPreparacion("Hervir el arroz. Comer.").temporada("Invierno").agregarIngrediente(new IngredienteBuilder("arroz").cantidad(500).build()).build()
		
		
		basket = new RutinaActiva => [
			setTiempoDeEjercicio(240)
		]
		
		usuarioVegano = new UsuarioBuilder("Miguel").peso(70.5).altura(1.73).fechaNacimiento(1989, 6, 28).sexo("M").rutina(basket).condicion(new CondicionVegano).preferencia("fruta").email("soyvegano@edrans.com").build()
		usuarioVegano.agregarBusqueda(busqueda1)
		
		recetario.agregarReceta(arrozConPollo)
		recetario.agregarReceta(fideosConManteca)
		recetario.agregarReceta(lomoMostaza)
		recetario.agregarReceta(gelatinaFrambuesa)
		recetario.agregarReceta(ensalada)
		recetario.agregarReceta(arrozBlanco)
		usuarioVegano.recetario = recetario
		/*usuarioHipertenso.recetario = recetario
		usuarioSinCondicion.recetario = recetario
		usuarioCeliaco.recetario = recetario
		usuarioDiabetico.recetario = recetario*/
		//usuarioVegano.agregarRecetaFavorita(lomoMostaza)
		//usuarioVegano.agregarRecetaFavorita(ensalada)
		usuarios.add(usuarioVegano)
		/*usuarios.add(usuarioHipertenso)
		usuarios.add(usuarioSinCondicion)
		usuarios.add(usuarioCeliaco)
		usuarios.add(usuarioDiabetico)*/
		usuarioVegano.accion2 = accion
	}
	
	def getRecetas(){
		
		var int i = 0
		var List<Receta> temporal = new ArrayList<Receta>
		
		if(!usuarios.get(0).recetasFavoritas2.isEmpty){	
			/*while(i<10 && i<usuarios.get(0).recetasFavoritas2.size){
				temporal.add(usuarios.get(0).recetasFavoritas2.get(i))
			}
			return temporal*/
			mensaje = "Estas son sus recetas favoritas"
			return(usuarios.get(0).recetasFavoritas2)
		}else{
			if(!usuarios.get(0).misBusquedas.isEmpty){
				mensaje = "Estas es el resultado de su ultima consulta"
				return(usuarios.get(0).busquedaFiltrada())
			}else{
				mensaje = "Estas son las recetas mas consultadas"
				usuarios.get(0).busquedaFiltrada()
				return(usuarios.get(0).accion2.getRecetasFinales)
			}
		}
	}
}