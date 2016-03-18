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
<<<<<<< HEAD
}

void setUpBoundary()
{
	world.add(world.getStaticEntity(""))
=======
	world.add( world.getStaticEntity( "VillageTown", "clayPot" ), "clayPot" );
	world.add( world.getStaticEntity( "VillageTown", "eastCrossThatchRoof" ), "eastCrossThatchRoof" );
	world.add( world.getStaticEntity( "VillageTown", "fourHouseNE" ), "fourHouseNE" );
	world.add( world.getStaticEntity( "VillageTown", "fourHouseNW" ), "fourHouseNW" );
	world.add( world.getStaticEntity( "VillageTown", "fourHouseSE" ), "fourHouseSE" );
	world.add( world.getStaticEntity( "VillageTown", "fourHouseSW" ), "fourHouseSW" );
	world.add( world.getStaticEntity( "VillageTown", "northEastGrayPlankHouse" ), "northEastGrayPlankHouse" );
	world.add( world.getStaticEntity( "VillageTown", "northEastWall" ), "northEastWall" );
	world.add( world.getStaticEntity( "VillageTown", "northEastWoodRoofHouse" ), "northEastWoodRoofHouse" );
	world.add( world.getStaticEntity( "VillageTown", "northEastTreeBottom" ), "northEastTreeBottom" );
	world.add( world.getStaticEntity( "VillageTown", "northEastTree" ), "northEastTree" );
	world.add( world.getStaticEntity( "VillageTown", "rotundaRoof" ), "rotundaRoof" );
	world.add( world.getStaticEntity( "VillageTown", "sEWall" ), "sEWall" );
	world.add( world.getStaticEntity( "VillageTown", "sEWoodThatchRoof" ), "sEWoodThatchRoof" );
	world.add( world.getStaticEntity( "VillageTown", "southTreeCluster" ), "southTreeCluster" );
	world.add( world.getStaticEntity( "VillageTown", "strawRoof" ), "strawRoof" );
	world.add( world.getStaticEntity( "VillageTown", "strawRoofEastGrayCross" ), "strawRoofEastGrayCross" );
	world.add( world.getStaticEntity( "VillageTown", "strawRoofEastGray" ), "strawRoofEastGray" );
	world.add( world.getStaticEntity( "VillageTown", "sWThatchHouse" ), "sWThatchHouse" );
	world.add( world.getStaticEntity( "VillageTown", "sWThatchHouse" ), "sWThatchHouse" );
	world.add( world.getStaticEntity( "VillageTown", "sWWall2" ), "sWWall2" );
	world.add( world.getStaticEntity( "VillageTown", "sWWall" ), "sWWall" );
	world.add( world.getStaticEntity( "VillageTown", "thatchRoof" ), "thatchRoof" );
	world.add( world.getStaticEntity( "VillageTown", "topTreeBottom" ), "topTreeBottom" );
	world.add( world.getStaticEntity( "VillageTown", "topTree" ), "topTree" );
	world.add( world.getStaticEntity( "VillageTown", "treetops" ), "treetops" );
	world.add( world.getStaticEntity( "VillageTown", "wall" ), "wall" );
	world.add( world.getStaticEntity( "VillageTown", "westTreeCluster" ), "westTreeCluster" );
	world.add( world.getStaticEntity( "VillageTown", "westTree" ), "westTree" );
>>>>>>> e35d16c661719285082bb7f196831f7c0d29256b
}