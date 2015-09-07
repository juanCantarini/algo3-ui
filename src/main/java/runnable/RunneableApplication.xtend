package runnable

import PantallaLogin.PantallaLogin
import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window

class RunneableApplication extends Application {
	
	static def void main(String[] args) { 
		new RunneableApplication().start()
	}

	override protected Window<?> createMainWindow() {
		return new PantallaLogin(this)
	}
}
