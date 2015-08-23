package pantallas

import ar.tp.dieta.CondimentoBuilder
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
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.MainWindow

class DetalleReceta extends MainWindow<Receta>{
		
		new() {
			super(new RecetaBuilder("polloAzafran").calorias(500).autor("Daniel").dificultad("Mediana").procesoPreparacion("Hervir el arroz con azafran y agregar el pollo previamente salteado").temporada("Invierno").agregarCondimento(new CondimentoBuilder("azafran").cantidad(2).build()).agregarIngrediente(new IngredienteBuilder("carne").cantidad(500).build()).build()
)
		}
		
		override createContents(Panel mainPanel) {
			title = "Detalle de receta"
			mainPanel.layout = new VerticalLayout
			
			//PANELES
			
			val panelNombreReceta = new Panel(mainPanel)
			val panelSuperior = new Panel(mainPanel)
			panelSuperior.layout = new HorizontalLayout
			val panelMedio = new Panel(mainPanel)
			panelMedio.layout = new ColumnLayout(2)
			val panelTablas = new Panel(mainPanel)
			panelTablas.layout = new HorizontalLayout
			val panelAuxiliar = new Panel(panelTablas)
			panelAuxiliar.layout = new VerticalLayout
			val panelFavorito = new Panel(mainPanel)
			panelFavorito.layout = new HorizontalLayout
			val panelProceso = new Panel(mainPanel)
			
			//CONTENIDO DE LOS PANELES
			
			new Label(panelNombreReceta).bindValueToProperty("nombreDeLaReceta")
			
			//PANEL SUPERIOR - CALORIAS Y AUTOR
			
			new Label(panelSuperior).bindValueToProperty("calorias")
			new Label(panelSuperior).text = "calorias  ---- creado por"
			new Label(panelSuperior).bindValueToProperty("autor")
			
			//PANEL MEDIO - DIFICULTAD, TEMPORADA E INGREDIENTES
			
			new Label(panelMedio).text = "Dificultad"
			new Label(panelMedio).text = "Temporada"
			new Label(panelMedio).bindValueToProperty("dificultadDePreparacion")
			new Label(panelMedio).bindValueToProperty("temporadaALaQueCorresponde")
			new Label(panelMedio).text = "Ingredientes"
			new Label(panelMedio).text = "Condimentos"
			
			grillaIngredientes(panelTablas)
			new List(panelAuxiliar).bindItemsToProperty("condimentos")			
			new Label(panelAuxiliar).text = "Condiciones Preexistentes"
			new List(panelAuxiliar).bindItemsToProperty("condicionesPreexistentes")
			
			//PANEL FAVORITO - CHECKBOX FAVORITO
			
			new CheckBox(panelFavorito)
			new Label(panelFavorito).text = "Favorita        "
			
			
			//PANEL PROCESO - PROCEDIMIENTO DE LA RECETA
			
			new Label(panelProceso).text = "Proceso de preparacion"
			new Label(panelProceso).bindValueToProperty("procesoDePreparacion")			
			
		}
		
		def grillaIngredientes(Panel panelMedio){
			val grilla = new Table(panelMedio, typeof(Receta)) => [
				width = 400
				height = 1000
				bindItemsToProperty("ingredientes")
			]
			new Column<Receta>(grilla) => [
				title = "Ingrediente"
				bindContentsToProperty("nombre")
			]
			
			new Column<Receta>(grilla) => [
				title = "Cantidad"
				bindContentsToProperty("cantidad")
			]
		}
		
		def static void main(String[] args) {
			new DetalleReceta().startApplication
		}
		
}