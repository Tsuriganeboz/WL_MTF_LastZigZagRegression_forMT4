//+------------------------------------------------------------------+
//|                                                      WL_Util.mqh |
//|                                    Copyright 2016, Tsuriganeboz  |
//|                                  https://github.com/Tsuriganeboz |
//+------------------------------------------------------------------+
#property copyright "Copyright 2016, Tsuriganeboz"
#property link      "https://github.com/Tsuriganeboz"
#property strict
//+------------------------------------------------------------------+
//| defines                                                          |
//+------------------------------------------------------------------+
// #define MacrosHello   "Hello, world!"
// #define MacrosYear    2010
//+------------------------------------------------------------------+
//| DLL imports                                                      |
//+------------------------------------------------------------------+
// #import "user32.dll"
//   int      SendMessageA(int hWnd,int Msg,int wParam,int lParam);
// #import "my_expert.dll"
//   int      ExpertRecalculate(int wParam,int lParam);
// #import
//+------------------------------------------------------------------+
//| EX5 imports                                                      |
//+------------------------------------------------------------------+
// #import "stdlib.ex5"
//   string ErrorDescription(int error_code);
// #import
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string WL_GetTimeFrameString(int timeFrame)
{
   string ret = "";
   
   switch(timeFrame)
   {
      case 1:
         ret = "M1";
         break;
      case 5:
         ret = "M5";
         break;
      case 15:
         ret = "M15";
         break;
      case 30:
         ret = "M30";
         break;
      case 60:
         ret = "H1";
         break;
      case 240:
         ret = "H4";
         break;
      case 1440:
         ret = "D1";
         break;
      case 10080:
         ret = "W1";
         break;
      case 43200:
         ret = "MN1";
         break;
      default:
         ret = "Current Timeframe";
         break;
   }

   return ret;
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int WL_GetBarIndexOfTimeFrame(int timeFrame, datetime time)
{
   return iBarShift(Symbol(), timeFrame, time);
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int WL_GetBuyOrSell(int orderType)
{
   switch (orderType)
   {
      case 1:
      case 3:
      case 5:
         return OP_SELL;
      default:
         return OP_BUY;
   }
}
