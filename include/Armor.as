#include "Collectible.as"

class Armor : Collectible
{
	private uint protect;

	
	Armor( float mass, string name, ee::StaticEntity ent, uint pro ) 
	{
		//need to construct the inherited Collectible object(like super()) or just have a no args default constructor in Collectible
		super( mass, name, ent );
		protect = pro;
	}

	uint protection() const
	{
		ee::consolePrintln( "Armor.as/protection: returns the protection of the armor." );
		return protect;
	}
}