#include "Collectible.as"
#include "CharStats.as"

class Inventory
{
	array< Collectible > items;
	float totalweight;

	Inventory() //expected identifier, instead found (
	{
		items = array< Collectible >();
		totalweight = 0;
	}

	float getCurrentWeight()
	{
		return totalweight;
	}


	void addItem( const string &in name, Collectible obj )
	{
		items.insertLast( obj );
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