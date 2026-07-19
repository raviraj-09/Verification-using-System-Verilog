//********************************************
// (c) SION Semiconductors (P) Ltd, Bangalore
// All rights reserved.
//********************************************
// Filename    : 8_Enum_Rand.sv
// Description : Randomization with enum type
//********************************************


class Enum_Rand;

// Declaration of enumarated datatype
typedef enum {SUN, MON, TUE, WED, THU, FRI, SAT} days_e;

// Queue of Enum
days_e choices[$];

rand days_e choice;

constraint cday {choice inside choices;}
endclass


// Top level program block
program EnumRand;

Enum_Rand days;

initial begin

  days = new();

  // Initializing Range of Enum_Rand
  days.choices = {Enum_Rand::SUN, Enum_Rand::SAT};

  // Assertion based randomization
  assert (days.randomize());
  $display("Random weekend day %s\n", days.choice.name);

  // Modify Enum_Rand 
  days.choices = {Enum_Rand::MON, Enum_Rand::TUE, Enum_Rand::WED, Enum_Rand::THU, Enum_Rand::FRI};
  assert (days.randomize());
  $display("Random week day %s", days.choice.name);

end

endprogram
