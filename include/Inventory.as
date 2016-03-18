#include "Collectible.as"
#include "CharStats.as"

class Inventory
{
	dictionary< Collectible > items; //expected method, found dictionary
	float totalweight;

	Inventory() //expected identifier, instead found (
	{
		items = new dictionary< Collectible >();
		totalweight = 0;
	}

	float getCurrentWeight()
	{
		return totalweight;
	}


	void addItem( const string &in name, Collectible obj )
	{
		items.set( name, obj );
		totalweight += obj.getMass();
	}

	bool removeItem( const string &in name )
	{
		if( items.exists( name ) )
		{
			items.delete( name );
			return true;
		}
		else
			return false;
	}
} //unexpected