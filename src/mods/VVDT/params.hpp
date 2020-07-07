/* params.cpp
Description: Parameter data for the VVDT module.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/07/21 Updated: 2016/08/16 Version: 0.0.1
*/
class modVVDTSwitch {
  title = "Date Time Module:";
  values[] = {0,1};
  texts[] = {"Disabled","Enabled"};
  default = 1;
};
class modVVDTRandom {
  title = "Date Time Settings - Random Date Time:";
  values[] = {0,1};
  texts[] = {"Disabled","Enabled"};
  default = 0;
};
class modVVDTMoon {
  title = "Date Time Settings - Change Date To Nearest Full Moon:";
  values[] = {0,1};
  texts[] = {"Disabled","Enabled"};
  default = 0;
};
class modVVDTYear {
  title = "Date Time Settings - Year:";
  values[] = {2035,2034,2033,2032,2031,2030,2029,2028,2027,2026,2025,2024,2023,2022,2021,2020,2019,2018,2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004,2003,2002,2001,2000,1999,1998,1997,1996,1995,1994,1993,1992,1991,1990,1989,1988,1987,1986,1985,1984,1983,1982,1981,1980,1979,1978,1977,1976,1975,1974,1973,1972,1971,1970,1969,1968,1967,1966,1965,1964,1963,1962,1961,1960,1959,1958,1957,1956,1955,1954,1953,1952,1951,1950,1949,1948,1947,1946,1945,1944,1943,1942,1941,1940,1939,1938,1937,1936,1935,1934,1933,1932,1931,1930,1929,1928,1927,1926,1925,1924,1923,1922,1921,1920,1919,1918,1917,1916,1915,1914,1913,1912,1911,1910};
  texts[] = {"2035","2034","2033","2032","2031","2030","2029","2028","2027","2026","2025","2024","2023","2022","2021","2020","2019","2018","2017","2016","2015","2014","2013","2012","2011","2010","2009","2008","2007","2006","2005","2004","2003","2002","2001","2000","1999","1998","1997","1996","1995","1994","1993","1992","1991","1990","1989","1988","1987","1986","1985","1984","1983","1982","1981","1980","1979","1978","1977","1976","1975","1974","1973","1972","1971","1970","1969","1968","1967","1966","1965","1964","1963","1962","1961","1960","1959","1958","1957","1956","1955","1954","1953","1952","1951","1950","1949","1948","1947","1946","1945","1944","1943","1942","1941","1940","1939","1938","1937","1936","1935","1934","1933","1932","1931","1930","1929","1928","1927","1926","1925","1924","1923","1922","1921","1920","1919","1918","1917","1916","1915","1914","1913","1912","1911","1910"};
  default = 2020;
};
class modVVDTMonth {
  title = "Date Time Settings - Month:";
  values[] = {1,2,3,4,5,6,7,8,9,10,11,12};
  texts[] = {"January","February","March","April","May","June","July","August","September","October","November","December"};
  default = 6;
};
class modVVDTDay {
  title = "Date Time Settings - Day:";
  values[] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31};
  texts[] = {"1st","2nd","3rd","4th","5th","6th","7th","8th","9th","10th","11th","12th","13th","14th","15th","16th","17th","18th","19th","20th","21st","22nd","23rd","24th","25th","26th","27th","28th","29th","30th","31st"};
  default = 15;
};
class modVVDTHour {
  title = "Date Time Settings - Hour:";
  values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23};
  texts[] = {"00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23"};
  default = 11;
};
class modVVDTMinute {
  title = "Date Time Settings - Minute:";
  values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59};
  texts[] = {"00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59"};
  default = 30;
};
class modVVDTSyncSwitch {
  title = "Date Time Settings - Sync Time:";
  values[] = {0,1};
  texts[] = {"Disabled","Enabled"};
  default = 0;
};
class modVVDTSyncSkipTime {
  title = "Date Time Settings - Day Cycle Time To Skip:";
  values[] = {1,10,20,30};
  texts[] = {"1 Minute","10 Minutes","20 Minutes","30 Minutes"};
  default = 1;
};
class modVVDTSyncMethod {
  title = "Date Time Settings - Change Time Method:";
  values[] = {0,1};
  texts[] = {"SkipTime","SetDate"};
  default = 0;
};
class modVVDTSyncInterval {
  title = "Date Time Settings - Sync Interval:";
  values[] = {1,10,20,30};
  texts[] = {"1 Minute","10 Minutes","20 Minutes","30 Minutes"};
  default = 10;
};
class modVVDTSyncSkipInterval {
  title = "Date Time Settings - Skip Interval:";
  values[] = {1,10,20,30};
  texts[] = {"1 Minute","10 Minutes","20 Minutes","30 Minutes"};
  default = 1;
};
class modVVDTSyncNightCycle {
  title = "Date Time Settings - Custom Night Cycle:";
  values[] = {0,1};
  texts[] = {"Disabled","Enabled"};
  default = 0;
};
class modVVDTSyncNightCycleSkipTime {
  title = "Date Time Settings - Custom Night Cycle Time To Skip:";
  values[] = {1,10,20,30};
  texts[] = {"1 Minute","10 Minutes","20 Minutes","30 Minutes"};
  default = 1;
};
class modVVDTSpacer {
  title = " ";
  values[] = {0};
  texts[] = {" "};
  default = 0;
};