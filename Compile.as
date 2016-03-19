//#include "Aeneas.as"
//#include "Camera.as" 
								//CONSISTENT problems with contructor syntax
								//DENNIS centerCamera is not declared in HUD error
//#include "TrojanGreek.as"
#include "include/AIChar.as" 
							//FIX writeToDataCont THIRD INT PARAMETER dennis will fix this
//#include "include/Character.as" //HAVE TO IMPLEMENT LAST METHODS
//#include "include/ControllableChar.as"  
											//DENNIS NO MATCHING SIGNATURESWITH isKeyPressed();
											//DENNIS no for each loop support in angelscript???
											//JASON CHANGE FOR EACH LOOPS TO FOR LOOPS
//#include "include/MainMenu.as"  //find out how to call isKeyPressed properly DENNIS
//#include "include/World.as"
void initialize() {}

void step(uint x) {}

//#include "include/CharStats.as"  //success
//#include "include/Movable.as" //success
//#include "include/Collectible.as" //success
//#include "include/Weapon.as" //success
//#include "include/Armor.as" //success

//these bottom classes are things I think are not ABSOLUTELY necessary for the demo, in the interest of having a game ready for saturday - Andrew
//#include "include/Vector.as"  //i dont think we are using this
//#include "include/Button.as"   //I dont think we are using button
//#include "include/Cluster.as"  //I dont think we are using cluster
//#include "include/Fighting.as"   //I dont think we are using???
//#include "include/Menu.as"    //I dont think we are using this interface
//#include "SaveAndLoad.as"
//#include "Inventory.as"