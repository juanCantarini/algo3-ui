package pantallaPrincipal

import ar.tp.dieta.Receta
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.MainWindow

class PantallaPrincipal extends MainWindow<DetalleRecetaAplicationModel>{
	
	new(){
		super (new DetalleRecetaAplicationModel)
	}
	
	def static void main(String[] args) {
			new PantallaPrincipal().startApplication
	}
	
	override createContents(Panel mainPanel){
		title = "Bienvenido a ¿Que comemos?"
		mainPanel.layout = new VerticalLayout
		
		new Label(mainPanel).text = "Estas fueron sus ultimas consultas"
		grillaConsulta(mainPanel)
	}
	
	
	def grillaConsulta(Panel mainPanel){
			val grilla = new Table(mainPanel, typeof(DetalleRecetaAplicationModel)) => [
				width = 400
				height = 1000
				bindItemsToProperty("receta")
			]
			new Column<DetalleRecetaAplicationModel>(grilla) => [
				title = "Nombre"
				bindContentsToProperty("nombreDeLaReceta")
			]
			
			new Column<DetalleRecetaAplicationModel>(grilla) => [
				title = "Calorias"
				bindContentsToProperty("calorias")
			]
			
			new Column<DetalleRecetaAplicationModel>(grilla) => [
				title = "Dificultad"
				bindContentsToProperty("dificultadDePreparacion")
			]
			
			new Column<DetalleRecetaAplicationModel>(grilla) => [
				title = "Temporada"
				bindContentsToProperty("temporada")
			]
		}
		
		
}