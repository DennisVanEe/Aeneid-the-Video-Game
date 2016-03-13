#include "Collectible.as"

class Weapon : Collectible
{
	private uint damage; //name conflict: damage is a class method

	Weapon( float mass, string name, ee::StaticEntity ent, uint dam )
	{
		Collectible( mass, name, ent ); //no matching constructors with this number of parameters
		damage = dam; //static entity needs an assign method (dennis...)
	}

	uint getDamage() const
	{
		return damage;
	}
}