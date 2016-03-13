#include "Collectible.as"

class Weapon : Collectible
{
	private uint power;

	Weapon( float mass, string name, ee::StaticEntity ent, uint dam )
	{
		super( mass, name, ent );
		power = dam;
	}

	uint getDamage() const
	{
		return power;
	}
}