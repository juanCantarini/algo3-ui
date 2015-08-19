package pantallas

import ar.tp.dieta.IngredienteBuilder
import ar.tp.dieta.Receta
import ar.tp.dieta.RecetaBuilder
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.MainWindow

class DetalleReceta extends MainWindow<Receta>{
		
		new() {
			super(new RecetaBuilder("polloAzafran").calorias(500).autor("Daniel").dificultad("Mediana").procesoPreparacion("Hervir el arroz con azafran y agregar el pollo previamente salteado").temporada("Invierno").agregar(new IngredienteBuilder("azafran").cantidad(2).build()).agregar(new IngredienteBuilder("arroz").cantidad(500).build()).build()
)
		}
		
		override createContents(Panel mainPanel) {
			title = "Detalle de receta"
			mainPanel.layout = new VerticalLayout
			val panelNombreReceta = new Panel(mainPanel)
			val panelSuperior = new Panel(mainPanel)
			panelSuperior.layout = new HorizontalLayout
			val panelMedio = new Panel(mainPanel)
			panelMedio.layout = new ColumnLayout(2)
			val panelIngredientes = new Panel(mainPanel)
			panelIngredientes.layout = new ColumnLayout(2)
			val panelInferior = new Panel(mainPanel)
			panelInferior.layout = new ColumnLayout(2)
			val panelFavorito = new Panel(mainPanel)
			panelFavorito.layout = new HorizontalLayout
			val panelProceso = new Panel(mainPanel)
			new Label(panelNombreReceta).bindValueToProperty("nombreDeLaReceta")
			new Label(panelSuperior).bindValueToProperty("calorias")
			new Label(panelSuperior).text = "calorias  ---- creado por"
			new Label(panelSuperior).bindValueToProperty("autor")
			new Label(panelMedio).text = "Dificultad"
			new Label(panelMedio).text = "Temporada"
			new Label(panelMedio).bindValueToProperty("dificultadDePreparacion")
			new Label(panelMedio).bindValueToProperty("temporadaALaQueCorresponde")
			new Label(panelMedio).text = "Ingredientes"
			//new Label(panelMedio).text = "Condimentos"
			new Label(panelMedio).text = "Condiciones Preexistentes"
			new List(panelMedio).bindItemsToProperty("elementosDeReceta")
			//new List(panelMedio).bindItemsToProperty("condicionesPreexistentes")
			new CheckBox(panelFavorito)
			new Label(panelFavorito).text = "Favorita"
			new Label(panelProceso).text = "Proceso de preparacion"
			new Label(panelProceso).bindValueToProperty("procesoDePreparacion")			
			
		}
		
		def static void main(String[] args) {
			new DetalleReceta().startApplication
		}
		
}