ee::AnimatedEntity aeneas("Characters", "aeneas");
ee::AnimatedEntity boy("Characters", "boy");
ee::Camera aCamera, bCamera;

ee::StaticEntity back("Backdrop", "back");

void initialize()
{
	boy.setOrigin(400/8, 100/2);
	boy.setPosition(0, 0);
	boy.setCollidable(true);
	
	aeneas.setOrigin(400/8, 100/2);
	aeneas.setPosition(1280/2, 720/2);
	aeneas.setRenderLevel(0);
	aeneas.setCollidable(true);
	
	back.setRenderLevel(1);
	aCamera.setSize(ee::getWindowWidth() / 2, ee::getWindowHeight());
	bCamera.setSize(ee::getWindowWidth() / 2, ee::getWindowHeight());
	aCamera.setViewport(0, 0, 0.5f, 1);
	bCamera.setViewport(0.5f, 0, 0.5f, 1);
}

int supercool = 2;
bool collided = false;

int previousXA, previousYA, previousXB, previousYB;

int state = 0;

void step(int time)
{
	if (state == 0)
	{
		ee::bindAllFunctions();
		state++;
	}
	
	previousXA = aeneas.getPositionX();
	previousYA = aeneas.getPositionY();
	
	if (ee::isKeyPressed(ee::D))
		aeneas.move(1*time, 0.0f);
	if (ee::isKeyPressed(ee::A))
		aeneas.move(-1*time, 0.0f);
	if (ee::isKeyPressed(ee::S))
		aeneas.move(0.0f, -1*time);
	if (ee::isKeyPressed(ee::W))
		aeneas.move(0.0f, 1*time);
	if (ee::isKeyPressed(ee::E))
		aeneas.rotate(0.1*time);
	if (ee::isKeyPressed(ee::Q))
		aeneas.rotate(-0.1*time);
	
	if (ee::isColliding(aeneas.getSprite()) && !collided)
	{
		boy.setPosition(previousXA, previousYA);
	}
	
	aCamera.setCenter(aeneas.getPositionX(), aeneas.getPositionY());
	
	
		
	previousXB = aeneas.getPositionX();
	previousYB = aeneas.getPositionY();
	
	if (ee::isKeyPressed(ee::L))
		boy.move(1*time, 0.0f);
	if (ee::isKeyPressed(ee::J))
		boy.move(-1*time, 0.0f);
	if (ee::isKeyPressed(ee::K))
		boy.move(0.0f, -1*time);
	if (ee::isKeyPressed(ee::I))
		boy.move(0.0f, 1*time);
	if (ee::isKeyPressed(ee::O))
		boy.rotate(0.1*time);
	if (ee::isKeyPressed(ee::U))
		boy.rotate(-0.1*time);
	
	if (ee::isColliding(boy.getSprite()) && !collided)
	{
		aeneas.setPosition(previousXB, previousYB);
	}
	
	bCamera.setCenter(boy.getPositionX(), boy.getPositionY());
		
	aeneas.playFrame(time);
	boy.playFrame(time);
}