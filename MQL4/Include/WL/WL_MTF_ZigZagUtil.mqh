//+------------------------------------------------------------------+
//|                                            WL_MTF_ZigZagUtil.mqh |
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
double WL_MTFGetZigZag(string symbol, int timeFrame, int index)
{
   return iCustom(symbol, timeFrame, "ZigZag",
                  InpDepth, InpDeviation, InpBackstep,
                  0, index);
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void WL_MTFZigZagFillArray(string symbol, int timeFrame, int index,
                           double& priceBuf[], datetime& timeBuf[], int bufCount)
{
   datetime timeArray[];
   int arrayCount = ArrayCopySeries(timeArray, MODE_TIME, symbol, timeFrame);
   if (arrayCount == -1)
      return; 


   int zigZagCount = 0;

   for (int i = (0 + index); i < arrayCount; i++)
   {
      double price = WL_MTFGetZigZag(symbol, timeFrame, i);
      if (price != 0)
      {
         priceBuf[zigZagCount] = price;      
         timeBuf[zigZagCount] = iTime(Symbol(), timeFrame, i);
         
         ++zigZagCount;
         if (zigZagCount >= bufCount)   
            break;
      }
      else {}
   }
   
}

