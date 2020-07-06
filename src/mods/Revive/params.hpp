class modReviveSwitch {
  title = "BIS Revive Module:";
  values[] = {0,1};
  texts[] = {"Disabled","Enabled"};
  default = 1;
};
class ReviveMode {
    title    = "BIS Revive Mode:";
    values[] = {0,1,2};
    texts[]  = {"Disabled", "Enabled", "Player Attribute"};
    default  = 1;
};
class ReviveUnconsciousStateMode {
    title    = "BIS Revive Unconscious State Mode:";
    values[] = {0,1,2};
    texts[]  = {"Basic", "Advanced", "Realistic"};
    default  = 0;
};
class ReviveRequiredTrait {
    title    = "BIS Revive Required Trait:";
    values[] = {0,1};
    texts[]  = {"None", "Medic"};
    default  = 0;
};
class ReviveRequiredItems {
    title    = "BIS Revive Required Items:";
    values[] = {0,1,2};
    texts[]  = {"None", "Medkit", "Medkit / First Aid Kit"};
    default  = 2;
};
class ReviveRequiredItemsFakConsumed {
    title    = "BIS Revive Required Item FAK Consumed:";
    values[] = {0,1,2};
    texts[]  = {"Disabled", "Enabled"};
    default  = 1;
};
class ReviveMedicSpeedMultiplier {
    title    = "BIS Revive Medic Speed Multiplier:";
    values[] = {0,1,2};
    texts[]  = {"None", "1x", "2x"};
    default  = 2;
};
class ReviveDelay {
    title    = "BIS Revive Delay:";
    values[] = {0,10,20};
    texts[]  = {"Disabled", "10 Seconds", "20 Seconds"};
    default  = 10;
};
class ReviveForceRespawnDelay {
    title    = "BIS Revive Force Respawn Delay:";
    values[] = {0,10,20};
    texts[]  = {"Disabled", "10 Seconds", "20 Seconds"};
    default  = 10;
};
class ReviveBleedOutDelay {
    title    = "BIS Revive Bleed Out Delay:";
    values[] = {0,900,1200};
    texts[]  = {"Disabled", "900 Seconds", "1200 Seconds"};
    default  = 900;
};
class modReviveSpacer {
  title = " ";
  values[] = {0};
  texts[] = {" "};
  default = 0;
};