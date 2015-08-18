package pantallas

import ar.tp.dieta.Ingrediente
import ar.tp.dieta.IngredienteBuilder
import ar.tp.dieta.Receta
import ar.tp.dieta.RecetaBuilder
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.MainWindow



class DetalleReceta extends MainWindow<Receta>{
		
		Ingrediente arroz = new IngredienteBuilder("arroz").cantidad(500).build()
		Ingrediente azafran = new IngredienteBuilder("azafran").cantidad(2).build()
		Receta polloAzafran = new RecetaBuilder("polloAzafran").calorias(100).autor("Daniel").dificultad("Mediana").procesoPreparacion("Hervir el arroz con azafran y agregar el pollo previamente salteado").temporada("Invierno").agregar(arroz).agregar(azafran).build()
		
		new() {
			super(new Receta)
		}
		
		Receta = polloAzafran
		
		def void init() {
		
		arroz = new IngredienteBuilder("arroz").cantidad(500).build()
		azafran = new IngredienteBuilder("azafran").cantidad(2).build()
		polloAzafran = new RecetaBuilder("polloAzafran").calorias(100).autor("Daniel").dificultad("Mediana").procesoPreparacion("Hervir el arroz con azafran y agregar el pollo previamente salteado").temporada("Invierno").agregar(arroz).agregar(azafran).build()
		
		}
		
		override createContents(Panel mainPanel) {
			title = "Detalle de receta"
			mainPanel.layout = new VerticalLayout
			val panelSuperior = new Panel(mainPanel)
			val panelInferior = new Panel(mainPanel)
			mainPanel.layout = new ColumnLayout(2)
			val panelMedio = new Panel(mainPanel)
			new Label(panelSuperior).bindValueToProperty("nombreDeLaReceta")
			new Label(panelSuperior).bindValueToProperty("calorias")
			new Label(panelSuperior).bindValueToProperty("autor")
			new Label(panelMedio).text = "Dificultad"
			new Label(panelMedio).text = "Temporada"
			new Label(panelMedio).bindValueToProperty("dificultadDePreparacion")
			new Label(panelMedio).bindValueToProperty("temporadaALaQueCorresponde")
			new Label(panelMedio).text = "Ingredientes"
			new Label(panelMedio).text = "Condimentos"
			
		}
		
		def static void main(String[] args) {
			new DetalleReceta().startApplication
		}
		
}