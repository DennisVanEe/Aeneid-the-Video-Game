#include "Collectible"

class Weapon : Collectible
{
	private uint damage;

	Weapon( int mass, string name, StaticEntity ent, uint dam )
	{
		Collectible( mass, name, ent );
		damage = dam;
	}

	uint damage()
	{
		
	}
}