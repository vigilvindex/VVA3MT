/* Revive.hpp - Configuration classes for Revive. - vigil.vindex@gmail.com - https://creativecommons.org/licenses/by-sa/4.0/ - https://community.bistudio.com/wiki/Arma_3_Revive */
ReviveMode = 1;                         // 0: disabled, 1: enabled, 2: controlled by player attributes
ReviveUnconsciousStateMode = 0;         // 0: basic, 1: advanced, 2: realistic
ReviveRequiredTrait = 0;                // 0: none, 1: medic trait is required
ReviveRequiredItems = 2;                // 0: none, 1: medkit, 2: medkit or first aid kit
ReviveRequiredItemsFakConsumed = 1;     // 0: first aid kit is not consumed upon revive, 1: first aid kit is consumed
ReviveMedicSpeedMultiplier = 2;         // speed multiplier for revive performed by medic
ReviveDelay = 10;                       // time needed to revive someone (in secs)
ReviveForceRespawnDelay = 10;           // time needed to perform force respawn (in secs)
ReviveBleedOutDelay = 900;              // unconscious state duration (in secs)
enablePlayerAddRespawn = 0;             // Disable framework respawn?