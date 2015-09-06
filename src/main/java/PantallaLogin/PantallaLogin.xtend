package PantallaLogin

import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.MainWindow
import pantallaPrincipal.PantallaPrincipal

class PantallaLogin extends MainWindow<PantallaLoginAplicationModel>{
	
	new(){
		super (new PantallaLoginAplicationModel)
	}
	
	def static void main(String[] args) {
			new PantallaLogin().startApplication()
	}
	
	override createContents(Panel mainPanel){
		
		title = "Login"
		mainPanel.layout = new VerticalLayout
		
		new Label(mainPanel).text = "Usuario"
		new TextBox(mainPanel) => [
			bindValueToProperty("nombre")
		]
		
		new Label(mainPanel).text = "Contraseña"
		new TextBox(mainPanel) => [
			bindValueToProperty("contraseña")
		]
		
		val panelBotonera = new Panel(mainPanel).layout = new HorizontalLayout
		new Button(panelBotonera) => [
			caption = "OK"
			onClick[ | new PantallaPrincipal(this,modelObject.validar()).open]
		] 
		new Button(panelBotonera) => [
			caption = "Cancelar"
			onClick[ | this.close()]
		]
		
	}
	
}