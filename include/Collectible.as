#include "Movable.as"

class Collectible : Movable
{
	private float mass;
	private string name;
	private ee::StaticEntity entity; 

	Collectible( float weight, string n, ee::StaticEntity ent ) 
	{
		Movable();
		mass = weight;
		name = n;
		entity = ent;
	}

	float getMass() const
	{
		return mass;
	}

	string getName() const
	{
		return name;
	}
}