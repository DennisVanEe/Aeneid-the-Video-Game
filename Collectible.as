#include "Movable.as"

class Collectible : Movable
{
	private int mass;
	private string name;
	private StaticEntity entity;

	Collectible( int weight, string n, StaticEntity ent )
	{
		Movable();
		mass = weight;
		name = n;
		entity = ent;
	}

	int getMass() const
	{
		return mass;
	}

	string getName() const
	{
		return name;
	}
}