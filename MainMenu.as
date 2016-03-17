#include "include/MainMenu.as"
#include "include/Menu.as"

MainMenu start;

void initialize() {
	start = MainMenu();
}

void step ( uint32 milliseconds ) {
	start.step( milliseconds );
}

