//+------------------------------------------------------------------+
//|                                                WL_ObjectUtil.mqh |
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
bool WL_ObjectFind(string objectName)
{
   return (ObjectFind(objectName) != -1);
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void WL_ObjectFindAndDelete(string objectName)
{
   if (WL_ObjectFind(objectName))
   {
      ObjectDelete(objectName);
   }
   else {}
}
