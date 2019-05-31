class RWT {
	tag = "RWT";
  	class cron {
    	file = "mods\LBCron\functions";
    	class cronInit {
			postInit = 1;
		};
		class cronJobAdd {};
		class cronJobRemove {};
		class cronJobRun {};
  	};
};
