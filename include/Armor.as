#include "Collectible.as"

class Armor : Collectible
{
	private uint protection;

	Armor( float mass, string name, StaticEntity ent, uint pro )
	{
		Collectible( mass, name, ent );
		proection = pro;
	}

	uint protection() const
	{
		return protection;
	}
}