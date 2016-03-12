#include "Collectible.as"
#include "CharStats.as"

class Inventory
{
	private dictionary< Collectible > items;
	private float totalweight;

	Inventory()
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
}