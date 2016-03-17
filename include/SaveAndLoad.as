#include "ControllableChar.as";

class SaveAndLoad
{
	
	
	SaveAndLoad()
	{
		
	}
	
	void Save()
	{
		ee::writeToDataCont( "Aeneas", variable name, actual variable itself );
	}
	
	void Load()
	{
		ee::readFromDataCont( "Aeneas", variable name, actual variable itself );
	}
}