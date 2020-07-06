/* RE.hpp - Configuration classes for RemoteExec. - vigil.vindex@gmail.com - https://creativecommons.org/licenses/by-sa/4.0/ */
class CfgRemoteExec { // https://community.bistudio.com/wiki/Arma_3_CfgRemoteExec https://community.bistudio.com/wiki/remoteExec
    class Server {
        class Functions {
            mode = 1;
            jip = 1;
            class BIS_fnc_effectKilledAirDestruction {};
            class BIS_fnc_effectKilledSecondaries {};
            class BIS_fnc_objectVar {};
            // class BIS_fnc_execVM {};
            class BIS_fnc_debugConsoleExec {};
        };
        class Commands {
            mode = 1;
        };
    };
    class Client {
        class Functions {
            mode = 1;
            jip = 1;
        };
        class Commands {
            mode = 1;
        };
    };
};