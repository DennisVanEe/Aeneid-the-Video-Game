#include "include/World.as"

World world;

void initialize() {
	world = World();

	setUpWorld( "VillageTown", "villageTownMap" );
}

void setUpWorld( string contName, string entName ) {
	world.add( world.getStaticEntity( contName, entName ), entName );

	if( contName.equals( "VillageTown" ) )
		setUpVillageTown();
}

void step( uint32 milliseconds ) {

}

// Put in art assets LOL
void setUpVillageTown() {
	world.add( world.getStaticEntity( "VillageTown", "brickRoof"), "brickRoof" );
}

void setUpBoundary()
{
	world.add(world.getStaticEntity(""))
}