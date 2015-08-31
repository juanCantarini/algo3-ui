package ar.tp.dieta

import org.junit.Before

class TestAccion2 {
	
	@Before
	def void init (){
		
		Accion2 accion
		List<Receta> recetas = new ArrayList<Receta>
		List<Usuario> usuarios = new ArrayList<Usuario>
		RecetarioPublico recetario = new RecetarioPublico
		String mensaje
		Busqueda busqueda1 = new Busqueda => [
				agregarFiltro(new FiltroPorIngredienteCaro)
		]
		
		basket = new RutinaActiva => [
				setTiempoDeEjercicio(240)
			]
			
		usuarioVegano = new UsuarioBuilder("Miguel").peso(70.5).altura(1.73).fechaNacimiento(1989, 6, 28).sexo("M").rutina(basket).condicion(new CondicionVegano).preferencia("fruta").email("soyvegano@edrans.com").build()
		usuarioVegano.agregarBusqueda(busqueda1)
		
		arrozConPollo = new RecetaBuilder("Arroz con Pollo").calorias(500).autor("Carlos Nahir").dificultad("Mediana").procesoPreparacion("Hervir el arroz con azafran y agregar el pollo previamente salteado").temporada("Invierno").agregarIngrediente(new IngredienteBuilder("arroz").cantidad(500).build()).agregarIngrediente(new IngredienteBuilder("pollo").cantidad(1000).build()).agregarCondimento(new CondimentoBuilder("azafran").cantidad(2).build()).build()
		fideosConManteca = new RecetaBuilder("Fideos con manteca").calorias(600).autor("Narda Lepes").dificultad("Facil").procesoPreparacion("Hervir los fideos. Colar.").temporada("Invierno").agregarIngrediente(new IngredienteBuilder("pasta").cantidad(500).build()).agregarCondimento(new CondimentoBuilder("sal").cantidad(2).build()).agregarIngrediente(new IngredienteBuilder("manteca").cantidad(10).build()).build()
		lomoMostaza = new RecetaBuilder("Lomo a la Mostaza").calorias(1200).autor("Mirtha Legrand").dificultad("Dificil").procesoPreparacion("Poner el lomo con la mostaza en el horno.").temporada("Verano").agregarIngrediente(new IngredienteBuilder("lomo").cantidad(1000).build()).agregarCondimento(new CondimentoBuilder("sal").cantidad(2).build()).agregarCondimento(new CondimentoBuilder("mostaza").cantidad(30).build()).build()
		gelatinaFrambuesa = new RecetaBuilder("Gelatina de Frambuesa").calorias(120).autor("Dolly").dificultad("Facil").procesoPreparacion("Mezclar gelatina azucar y agua").temporada("Verano").agregarIngrediente(new IngredienteBuilder("gelatina").cantidad(250).build()).agregarCondimento(new CondimentoBuilder("azucar").cantidad(500).build()).build()
		ensalada = new RecetaBuilder("Ensalada").calorias(10).autor("Antonio Gasalla").dificultad("Facil").procesoPreparacion("Cortar la verdura y mezclar. No olvidar de lavar").temporada("Verano").agregarIngrediente(new IngredienteBuilder("cebolla").cantidad(150).build()).agregarIngrediente(new IngredienteBuilder("lechuga").cantidad(300).build()).agregarIngrediente(new IngredienteBuilder("tomate").cantidad(150).build()).agregarCondimento(new CondimentoBuilder("sal").cantidad(2).build()).build()
		arrozBlanco = new RecetaBuilder("Arroz Blanco").calorias(10).autor("Antonio Gasalla").dificultad("Facil").procesoPreparacion("Hervir el arroz. Comer.").temporada("Invierno").agregarIngrediente(new IngredienteBuilder("arroz").cantidad(500).build()).build()
				
		recetario.agregarReceta(arrozConPollo)
		recetario.agregarReceta(fideosConManteca)
		recetario.agregarReceta(lomoMostaza)
		recetario.agregarReceta(gelatinaFrambuesa)
		recetario.agregarReceta(ensalada)
		recetario.agregarReceta(arrozBlanco)
		usuarioVegano.recetario = recetario
		
		usuarios.add(usuarioVegano)
		usuarioVegano.accion2 = accion
		
	}
	
}