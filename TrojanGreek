#include "include/AIChar.as";

array<AIChar> trojans; // Array of Trojans
array<AIChar> greek; // Array of Greeks

void initialize() {
    // Check savestate for previously saved stuff
    if( !( requestTrojans() && requestGreeks() ) ) {
        // ERROR HANDLING
    }
}

void step( uint16 milliseconds ) {
    
}

bool requestTrojans() {
    Request@ Foo = Request("read data", 0, READ_DATA, "test double"); // this request will retrieve a double called "test double"
    addRequest("trojans", Foo);
    waitForRequestQueueComp(); // wait and then get data
    double x = Foo.getDouble();
}

bool requestGreeks() {
    Request@ Foo = Request("read data", 0, READ_DATA, "test double"); // this request will retrieve a double called "test double"
    addRequest("trojans", Foo);
    waitForRequestQueueComp(); // wait and then get data
    double x = Foo.getDouble();
}