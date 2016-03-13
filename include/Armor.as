#include "Collectible.as"

class Armor : Collectible
{
	private uint protection; //name conflict (protection is class method)

	
	Armor( float mass, string name, StaticEntity ent, uint pro ) //StaticEntity not data type in global namespace
	{
		//need to construct the inherited Collectible object(like super()) or just have a no args default constructor in Collectible
		Collectible( mass, name, ent );
		protection = pro;
	}

	uint protection() const
	{
		return protection;
	}
}