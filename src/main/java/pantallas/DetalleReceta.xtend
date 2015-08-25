package pantallas

import ar.tp.dieta.CondimentoBuilder
import ar.tp.dieta.IngredienteBuilder
import ar.tp.dieta.Receta
import ar.tp.dieta.RecetaBuilder
import ar.tp.dieta.RecetarioPublico
import ar.tp.dieta.RutinaActiva
import ar.tp.dieta.Usuario
import ar.tp.dieta.UsuarioBuilder
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.MainWindow

class DetalleReceta extends MainWindow<DetalleRecetaAplicationModel>{
		
		new() {
			super(new DetalleRecetaAplicationModel())
//			super(new RecetaBuilder("polloAzafran").calorias(500).autor("Daniel").dificultad("Mediana").procesoPreparacion("Hervir el arroz con azafran y agregar el pollo previamente salteado").temporada("Invierno").agregarCondimento(new CondimentoBuilder("azafran").cantidad(2).build()).agregarIngrediente(new IngredienteBuilder("carne").cantidad(50).build()).build())
		}
		
		override createContents(Panel mainPanel) {
			title = "Detalle de receta"
			mainPanel.layout = new VerticalLayout
			//val Usuario usuario = construirUsuario()
			
			
			//PANELES
			
			val panelNombreReceta = new Panel(mainPanel)
			
			val panelSuperior = new Panel(mainPanel)
			panelSuperior.layout = new HorizontalLayout
			
			val panelInfo = new Panel(mainPanel)
			panelInfo.layout = new ColumnLayout(2)
			
			val panelMedio = new Panel(mainPanel)
			panelMedio.layout = new ColumnLayout(2)
			
			val panelIzquierdo = new Panel(panelMedio)
			
			val panelDerecho = new Panel(panelMedio)
			
			val panelProceso = new Panel(mainPanel)
			
			//CONTENIDO DE LOS PANELES
			
			new Label(panelNombreReceta).bindValueToProperty("receta.nombreDeLaReceta")
			
			//PANEL SUPERIOR - CALORIAS Y AUTOR
			
			new Label(panelSuperior).bindValueToProperty("receta.calorias")
			new Label(panelSuperior).text = "calorias  ---- creado por"
			new Label(panelSuperior).bindValueToProperty("receta.autor")
			
			//PANEL MEDIO - DIFICULTAD, TEMPORADA E INGREDIENTES
			
			new Label(panelInfo).text = "Dificultad"
			new Label(panelInfo).text = "Temporada"
			new Label(panelInfo).bindValueToProperty("receta.dificultadDePreparacion")
			new Label(panelInfo).bindValueToProperty("receta.temporadaALaQueCorresponde")
			new Label(panelInfo).text = "Ingredientes"
			new Label(panelInfo).text = "Condimentos"
			
			grillaIngredientes(panelIzquierdo)
			
			new List(panelDerecho).bindItemsToProperty("receta.condimentos")			
			new Label(panelDerecho).text = "Condiciones Preexistentes"
			new List(panelDerecho).bindItemsToProperty("receta.condicionesPreexistentes")
			
			//PANEL FAVORITO - CHECKBOX FAVORITO
			
			val panelFavo = new Panel(panelIzquierdo)
			panelFavo.layout = new HorizontalLayout
			
			new Label(panelFavo).text = "Favorita"
			
			new CheckBox(panelFavo) => [
				bindValueToProperty("favorita")
				bindEnabledToProperty("editable")
			]
			
			
			//PANEL PROCESO - PROCEDIMIENTO DE LA RECETA
			
			new Label(panelProceso).text = "Proceso de preparacion"
			new Label(panelProceso).bindValueToProperty("receta.procesoDePreparacion")			
			new Button(panelProceso) => [
				caption = "Volver"
				//onClick [ | ]			
			]
			
			
		}
		
		def grillaIngredientes(Panel panelMedio){
			val grilla = new Table(panelMedio, typeof(Receta)) => [
				width = 400
				height = 1000
				bindItemsToProperty("receta.ingredientes")
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
		
		/*def Usuario construirUsuario(){
			val Usuario usuario= new UsuarioBuilder("Daniel").peso(70.4).altura(1.83).fechaNacimiento(1992, 6, 4).sexo("M").rutina(new RutinaActiva => [
			setTiempoDeEjercicio(90)]).preferencia("carne").preferencia("pescado").email("usuariosincondicion@mail.com").build()
			val recetarioPublico = new RecetarioPublico
			recetarioPublico.recetas.add(modelObject)
			usuario.recetario = recetarioPublico
			return usuario
		}*/
		
		def static void main(String[] args) {
			new DetalleReceta().startApplication
		}
		
}