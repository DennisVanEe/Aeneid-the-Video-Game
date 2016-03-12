#include "Collectible.as"

class Armor : Collectible
{
	private uint protection;

	Armor( int mass, string name, StaticEntity ent, uint pro )
	{
		Collectible( mass, name, ent );
		proection = pro;
	}
}