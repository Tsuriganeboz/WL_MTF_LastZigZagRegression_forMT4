//+------------------------------------------------------------------+
//|                                  WL_MTF_LastZigZagRegression.mq4 |
//|                                    Copyright 2016, Tsuriganeboz  |
//|                                  https://github.com/Tsuriganeboz |
//+------------------------------------------------------------------+
#include <WL/WL_MTF_ZigZagUtil.mqh>
#include <WL/WL_ObjectUtil.mqh>
#include <WL/WL_ObjectRegressionUtil.mqh>
#include <WL/Enum/WL_TimeFrame.mqh>
#include <WL/WL_Util.mqh>


#property copyright "Copyright 2016, Tsuriganeboz"
#property link      "https://github.com/Tsuriganeboz"
#property version   "1.00"
#property strict
#property indicator_chart_window

//--- 
sinput WL_TimeFrame TimeFrame = PeriodM1;    // 基準時間軸

sinput int InpDepth = 12;     // Depth
sinput int InpDeviation = 5;  // Deviation
sinput int InpBackstep = 3;   // Backstep

sinput int ShiftZigZagPoint = 4;


color RegressionColor = Blue;

int ZigZagCountMax = 20;


#define WL_OBJ_NAME_REGRESSION  "WL_MTF_Regression"


//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   string timeFrameName = WL_GetTimeFrameString(TimeFrame); 

   ObjectDelete(WL_OBJ_NAME_REGRESSION + "(" + timeFrameName + ")");  

//---
   //Alert("Deinit !");
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
//---

   double priceBuf[];
   datetime timeBuf[];
   
   int arraySize = ZigZagCountMax;
   
   ArrayResize(priceBuf, arraySize);
   ArrayResize(timeBuf, arraySize);
   
   ArrayInitialize(priceBuf, 0);
   ArrayInitialize(timeBuf, 0);         
      
   WL_MTFZigZagFillArray(Symbol(), TimeFrame, 0, 
                        priceBuf, timeBuf, arraySize);
                       
                        
   int shiftZigZagPoint = (ZigZagCountMax < ShiftZigZagPoint) ? ZigZagCountMax : ShiftZigZagPoint;
   --shiftZigZagPoint;                    


   string timeFrameName = WL_GetTimeFrameString(TimeFrame);
   string name = WL_OBJ_NAME_REGRESSION + "(" + timeFrameName + ")"; 

   WL_ObjectFindAndDelete(name);

   WL_CreateRegression(name, RegressionColor,
                        timeBuf[shiftZigZagPoint], time[0]);                        
                           
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
