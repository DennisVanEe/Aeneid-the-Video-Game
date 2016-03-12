// Name: AIChar.as
// Author(s): Jason Wang
// version 0.1
// --------------------------------------
// This class is designed to hold all
// character's stats.

class CharStats {
	// Universal stats
	int cHealth; // Current Health //MAKE IT PROTECTED
	int mHealth; // Maximum Health
	float walkSpeed; // Walk speed

	// Player character-only stats
	int piety; // Piety points
	float carryWeight; // Done in kilograms
	float maxCarryWeight; // Done in kilograms

	// NPC-only stats
	float rotationSpeed = 10; // to be set later after testing. degree per seconds
	bool invincibility;
	bool isItHostile;

	CharStats() {
		CharStats( 0, 0, 0, 0, 0, 0, 0, false, true );
	}

	CharStats( int cH, int mH, float wS, int p, float cW, float mCW ) {
		CharStats( cH, mH, wS, p, cW, mCW, 0, false, false );
	}

	CharStats( int cH, int mH, float wS, float rS, bool immunity, bool hostile ) {
		CharStats( cH, mH, wS, 0, 0, 3402823466, rS, immunity, hostile );
	}

	CharStats( int cH, int mH, float wS, int p, float cW, float mCW, float rS, bool immunity, bool hostile ) {
		cHealth = cH;
		mHealth = mH; 
		walkSpeed = wS;
		piety = p;
		carryWeight = cW;
		maxCarryWeight = mCW;
		rotationSpeed = rS;
		invincibility = immunity;
		isItHostile = hostile;
	}

	void damage( int dmg ) { cHealth -= dmg; }
	void heal( int margin ) { cHealth += margin; }
	void incMaxHealth( int margin ) { mHealth += margin; }
	void decMaxHealth( int margin ) { mHealth -= margin; }
	void setHealth( int absHealth ) { mHealth = absHealth; }

	void changeWalkSpeed( int margin ) { walkSpeed += margin; }
	void setWalkSpeed( int wS ) { walkSpeed = wS; }

	void changePiety( int margin ) { piety += margin; }
	void setPiety( int p ) { piety = p; }

	void changeMass( float margin ) { carryWeight += margin; }
	void setMass( float m ) { carryWeight = m; }
	void changeMaxMass( float margin ) { maxCarryWeight += margin; }
	void setMaxMass( float mMass ) { maxCarryWeight = mMass; }

	void setHostility( bool hostile ) { isItHostile = hostile; }
	void setInvincibility( bool isInvincible ) { invincibility = isInvincible; }

	int getCHealth() { return cHealth; }
	int getMHealth() { return mHealth; }
	float getWalkSpeed() { return walkSpeed; }
	int getPiety() { return piety; }
	float getCarryWeight() { return carryWeight; }
	float getMaxCarryWeight() { return maxCarryWeight; }
	float getRotationSpeed() { return rotationSpeed; }
	bool isInvincible() { return invincibility; }
	bool isHostile() { return isItHostile; }
}
