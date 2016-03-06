#include "include/ControllableChar";

class SaveAndLoad
{
	
	
	SaveAndLoad()
	{
		
	}
	
	void Save()
	{
		Request@ writeReq = Request("write save", 0, WRITE_CONTAINER_FILE, "/saves/save.bin");
		addRequest("SaveContainer", writeReq );
	}
	
	void Load()
	{
		Request@ readReq = Request("read save", 0, READ_CONTAINER_FILE, "/loads/load.bin");
		addRequest("SaveContainer", readReq);
	}
}