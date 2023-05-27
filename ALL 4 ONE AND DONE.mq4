//+------------------------------------------------------------------+
//|                                                     ALL 4 ONE.mq4 |
//|                        Copyright 2021, MetaQuotes Software Corp. |
//|                                              https://www.mql5.com |
//+------------------------------------------------------------------+

#property copyright "Copyright 2021, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict

// Order Execution Enumeration
enum ENUM_ORDER_EXECUTION
  {
   INSTANT_EXECUTION,
   PENDING_ORDER,
   SIGNAL_FROM_INDICATOR
  };

// Order Execution Settings
input ENUM_ORDER_EXECUTION OrderToExecute = SIGNAL_FROM_INDICATOR;

// Read Signal after Candle Close
input bool ReadSignalAfterCandleClose = true;

// Signal Type Enumeration
enum ENUM_SIGNAL_TYPE
  {
   ABOVE_BELOW,
   CROSSOVER_ABOVE,
   CROSSOVER_BELOW,
   EQUAL,
   INCREASE,
   DECREASE,
   ARROW,
   OSCILLATOR,
   TREND,
   TREND_SINGLE_BUFFER
  };

// Main Indicator Settings
input string _1 = "<---- Main Indicator Settings ---->";
input ENUM_TIMEFRAMES Timeframe_for_Indicator_Signal = PERIOD_CURRENT;
input string Indicator_Use = "";
input ENUM_SIGNAL_TYPE Indicator_Signal_Type = ARROW;
input int Indicator_Shift_of_Signal = 0;
input int Buy_Signal_Buffer_Indexes = 0;
input int Sell_Signal_Buffer_Indexes = 1;

// Additional Trade Confirmation 1
input string _2 = "---- Additional Trade Confirmation 1 ----";
input ENUM_TIMEFRAMES Timeframe_for_Indicator_Signal_Confirmation1 = PERIOD_CURRENT;
input string Indicator_Use_Confirmation1 = "";
input ENUM_SIGNAL_TYPE Indicator_Signal_Type_Confirmation1 = ARROW;
input int Indicator_Shift_of_Signal_Confirmation1 = 0;
input int Buy_Signal_Buffer_Indexes_Confirmation1 = 0;
input int Sell_Signal_Buffer_Indexes_Confirmation1 = 1;

// Additional Trade Confirmation 2
input string _3 = "---- Additional Trade Confirmation 2 ----";
input ENUM_TIMEFRAMES Timeframe_for_Indicator_Signal_Confirmation2 = PERIOD_CURRENT;
input string Indicator_Use_Confirmation2 = "";
input ENUM_SIGNAL_TYPE Indicator_Signal_Type_Confirmation2 = ARROW;
input int Indicator_Shift_of_Signal_Confirmation2 = 0;
input int Buy_Signal_Buffer_Indexes_Confirmation2 = 0;
input int Sell_Signal_Buffer_Indexes_Confirmation2 = 1;

// Take Profit Indicator Settings
input string _4 = "---- Take Profit Indicator Settings ----";
input ENUM_TIMEFRAMES Timeframe_for_TakeProfit_Indicator_Signal = PERIOD_CURRENT;
input string TakeProfit_Indicator_Use = "";
input ENUM_SIGNAL_TYPE TakeProfit_Indicator_Signal_Type = ARROW;
input int TakeProfit_Indicator_Shift_of_Signal = 0;
input int TakeProfit_Buy_Signal_Buffer_Indexes = 0;
input int TakeProfit_Sell_Signal_Buffer_Indexes = 1;

// Take Profit Confirmation 1
input string _5 = "---- Take Profit Confirmation 1 ----";
input ENUM_TIMEFRAMES Timeframe_for_TakeProfit_Indicator_Signal_Confirmation1 = PERIOD_CURRENT;
input string TakeProfit_Indicator_Use_Confirmation1 = "";
input ENUM_SIGNAL_TYPE TakeProfit_Indicator_Signal_Type_Confirmation1 = ARROW;
input int TakeProfit_Indicator_Shift_of_Signal_Confirmation1 = 0;
input int TakeProfit_Buy_Signal_Buffer_Indexes_Confirmation1 = 0;
input int TakeProfit_Sell_Signal_Buffer_Indexes_Confirmation1 = 1;

// Take Profit Confirmation 2
input string _6 = "---- Take Profit Confirmation 2 ----";
input ENUM_TIMEFRAMES Timeframe_for_TakeProfit_Indicator_Signal_Confirmation2 = PERIOD_CURRENT;
input string TakeProfit_Indicator_Use_Confirmation2 = "";
input ENUM_SIGNAL_TYPE TakeProfit_Indicator_Signal_Type_Confirmation2 = ARROW;
input int TakeProfit_Indicator_Shift_of_Signal_Confirmation2 = 0;
input int TakeProfit_Buy_Signal_Buffer_Indexes_Confirmation2 = 0;
input int TakeProfit_Sell_Signal_Buffer_Indexes_Confirmation2 = 1;

// Stop Loss Indicator Settings
input string _7 = "---- Stop Loss Indicator Settings ----";
input ENUM_TIMEFRAMES Timeframe_for_StopLoss_Indicator_Signal = PERIOD_CURRENT;
input string StopLoss_Indicator_Use = "";
input ENUM_SIGNAL_TYPE StopLoss_Indicator_Signal_Type = ARROW;
input int StopLoss_Indicator_Shift_of_Signal = 0;
input int StopLoss_Buy_Signal_Buffer_Indexes = 0;
input int StopLoss_Sell_Signal_Buffer_Indexes = 1;

// Stop Loss Confirmation 1
input string _8 = "---- Stop Loss Confirmation 1 ----";
input ENUM_TIMEFRAMES Timeframe_for_StopLoss_Indicator_Signal_Confirmation1 = PERIOD_CURRENT;
input string StopLoss_Indicator_Use_Confirmation1 = "";
input ENUM_SIGNAL_TYPE StopLoss_Indicator_Signal_Type_Confirmation1 = ARROW;
input int StopLoss_Indicator_Shift_of_Signal_Confirmation1 = 0;
input int StopLoss_Buy_Signal_Buffer_Indexes_Confirmation1 = 0;
input int StopLoss_Sell_Signal_Buffer_Indexes_Confirmation1 = 1;

// Stop Loss Confirmation 2
input string _9 = "---- Stop Loss Confirmation 2 ----";
input ENUM_TIMEFRAMES Timeframe_for_StopLoss_Indicator_Signal_Confirmation2 = PERIOD_CURRENT;
input string StopLoss_Indicator_Use_Confirmation2 = "";
input ENUM_SIGNAL_TYPE StopLoss_Indicator_Signal_Type_Confirmation2 = ARROW;
input int StopLoss_Indicator_Shift_of_Signal_Confirmation2 = 0;
input int StopLoss_Buy_Signal_Buffer_Indexes_Confirmation2 = 0;
input int StopLoss_Sell_Signal_Buffer_Indexes_Confirmation2 = 1;


// Trailing Stop Loss Settings
struct TrailingStopLossSettings
  {
   bool              UseTrailingStop;
   int               TrailingStopDistance;
   bool              UseTrailingStopATR;
   int               TrailingStopATRPeriod;
   int               TrailingStopATRLookback;
   ENUM_TIMEFRAMES   TrailingStopATRTimeframe;
  };

TrailingStopLossSettings trailingStopLossSettings;

// High/Low Stop Loss Settings
struct HighLowStopLossSettings
  {
   bool              UseHighLowStopLoss;
   double            HighLowStopLossDistance;
   bool              UseHighLowStopLossATR;
   int               HighLowStopLossATRPeriod;
   int               HighLowStopLossATRLookback;
   ENUM_TIMEFRAMES   HighLowStopLossATRTimeframe;
  };

HighLowStopLossSettings highLowStopLossSettings;

// Breakeven Settings
struct BreakevenSettings
  {
   bool              UseBreakeven;
   int               BreakevenDistance;
   bool              UseBreakevenATR;
   int               BreakevenATRPeriod;
   int               BreakevenATRLookback;
   ENUM_TIMEFRAMES   BreakevenATRTimeframe;
  };

BreakevenSettings breakevenSettings;

// Trailing Take Profit Settings
struct TrailingTakeProfitSettings
  {
   bool              UseTrailingTakeProfit;
   int               TrailingTakeProfitDistance;
   bool              UseTrailingTakeProfitATR;
   int               TrailingTakeProfitATRPeriod;
   int               TrailingTakeProfitATRLookback;
   ENUM_TIMEFRAMES   TrailingTakeProfitATRTimeframe;
  };

TrailingTakeProfitSettings trailingTakeProfitSettings;

// Static Take Profit Settings
struct StaticTakeProfitSettings
  {
   bool              UseStaticTakeProfit;
   double            StaticTakeProfitDistance;
   bool              UseStaticTakeProfitATR;
   int               StaticTakeProfitATRPeriod;
   int               StaticTakeProfitATRLookback;
   ENUM_TIMEFRAMES   StaticTakeProfitATRTimeframe;
  };

StaticTakeProfitSettings staticTakeProfitSettings;

// General parameters
input string GeneralLabel = "---- General Parameters ----";
input double LotSize = 0.01;
input double StopLossLevel = 15;
input double TakeProfitLevel = 15;

// Order settings
input string OrderSettingsLabel = "---- Order Settings ----";
input string GlobalOrderType = "Market"; // Choose order type: "Market", "Limit", or "Stop"
input int OrdersPerSignal = 1; // Number of orders to place per signal

// Pending order settings
input string PendingOrderLabel = "---- Pending Order Settings ----";
input double PendingOrderPips = 15; // Distance in pips for limit or stop orders
input int PendingOrderTimeframe = 60; // Timeframe for pending orders (in minutes)

// Risk management settings
input string RiskManagementLabel = "---- Risk Management Settings ----";
input double EquityPercentForLot = 1.0; // Percentage of equity used for lot calculation
input double PercentToRisk = 1.0; // Percentage of equity to risk per trade
input double AddLotSizeIfLoss = 0.01; // Increase lot size if the previous order is a loss
input string AddLotSizeMode = "Same Order Type"; // Lot size increment options: "Same Order Type", "Every Closed Trade", "Open Trades (Same Order Type)", "Every Open Trades", "All Trades"

// Close On Opposite Signal Settings
input string CloseOnOppositeSignalLabel = "---- Close On Opposite Signal Settings ----";
input bool CloseOnOppositeSignal = true;

// Grid trading settings
input string GridTradingLabel = "---- Grid Trading Settings ----";
input bool EnableGridTrading = false; // Enable or disable grid trading
input double GridATRMultiplier = 1.0; // ATR multiplier for grid trading
input int MaxNumberOfTrades = 10; // Maximum number of trades for grid trading
input double GridPipStep = 50; // Pip step between orders for grid trading

// Add input for allowed trading hours
input string _10 = "<---- Trading Hours Settings ---->";
input string AllowedTradingHours = "00:00-23:59";

// Add news filter inputs
input string _11 = "<---- News Filter Settings ---->";
input bool EnableNewsFilter = true;
input int PreNewsImpactMinutes = 60;
input int PostNewsImpactMinutes = 60;

// Add inputs for advanced time management
input string _12 = "<---- Trading Sessions Settings ---->";
input bool EnableTradingSessions = true;
input string Session1_Start = "00:00";
input string Session1_End = "23:59";
input string Session2_Start = "";
input string Session2_End = "";
input string Session3_Start = "";
input string Session3_End = "";

// Add inputs for day filter
input string _13 = "<---- Day Filter Settings ---->";
input bool EnableDaysFilter = true;
input bool TradeOnMonday = true;
input bool TradeOnTuesday = true;
input bool TradeOnWednesday = true;
input bool TradeOnThursday = true;
input bool TradeOnFriday = true;
input bool TradeOnSaturday = true;  // Set to true if trading is allowed on Saturday, false otherwise
input bool TradeOnSunday = true;    // Set to true if trading is allowed on Sunday, false otherwise

extern bool EnableBuyOrder = true;    // Allows placing buy orders
extern bool EnableSellOrder = true;   // Allows placing sell orders
extern bool EnableTakeProfit = true;  // Allows setting a take profit level
extern bool EnableStopLoss = true;    // Allows setting a stop loss level
extern int Slippage = 3;              // Maximum allowed slippage in points
extern double Lots = 0.1;             // Number of lots to trade
extern int MagicNumber = 123456;      // Unique identifier for EA's orders




// Global variables
datetime lastBarTime;
bool isNewBar;

// Indicator buffers and variables
double MainIndicatorBuffer[];
double Confirmation1Buffer[];
double Confirmation2Buffer[];

double TakeProfitIndicatorBuffer[];
double TakeProfitConfirmation1Buffer[];
double TakeProfitConfirmation2Buffer[];

double StopLossIndicatorBuffer[];
double StopLossConfirmation1Buffer[];
double StopLossConfirmation2Buffer[];

// Trading session variables
datetime Session_StartTime[3];
datetime Session_EndTime[3];

// Allowed trading hours variables
datetime AllowedTradingStart;
datetime AllowedTradingEnd;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()

{
    InitializeTradingSessions();
    InitializeIndicatorBuffers();
    InitializeAllowedTradingHours();
    return INIT_SUCCEEDED;
}

void InitializeTradingSessions()
{
    for(int i = 0; i < 3; i++)
    {
        Session_StartTime[i] = StrToTime(Session_Start[i]);
        Session_EndTime[i] = StrToTime(Session_End[i]);
    }
}

void InitializeIndicatorBuffers()
{
    InitializeBuffer(MainIndicatorBuffer);
    InitializeBuffer(Confirmation1Buffer);
    InitializeBuffer(Confirmation2Buffer);
    
    InitializeBuffer(TakeProfitIndicatorBuffer);
    InitializeBuffer(TakeProfitConfirmation1Buffer);
    InitializeBuffer(TakeProfitConfirmation2Buffer);
    
    InitializeBuffer(StopLossIndicatorBuffer);
    InitializeBuffer(StopLossConfirmation1Buffer);
    InitializeBuffer(StopLossConfirmation2Buffer);
}

void InitializeBuffer(double& buffer[])
{
    IndicatorBuffers(3);
    SetIndexBuffer(0, buffer);
}

void InitializeAllowedTradingHours()
{
    AllowedTradingStart = ParseTradingTime(StringSubstr(AllowedTradingHours, 0, 5));
    AllowedTradingEnd = ParseTradingTime(StringSubstr(AllowedTradingHours, 6, 5));
}

datetime ParseTradingTime(string timeString)
{
    int hour = StrToInteger(StringSubstr(timeString, 0, 2));
    int minute = StrToInteger(StringSubstr(timeString, 3, 2));
    return TimeLocal() - TimeLocal() % 86400 + hour * 3600 + minute * 60;
}

bool IsWithinTradingHours()
{
    datetime currentTime = TimeCurrent();
    return (currentTime >= AllowedTradingStart && currentTime <= AllowedTradingEnd);
}

bool IsWithinTradingSessions(const datetime& currentTime)
{
    if(!EnableTradingSessions)
        return true;

    for(int i = 0; i < 3; i++)
    {
        if(currentTime >= Session_StartTime[i] && currentTime <= Session_EndTime[i])
            return true;
    }
    
    return false;
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CloseOrders(bool isTakeProfit)
  {
   for(int i = OrdersTotal() - 1; i >= 0; i--)
     {
      if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
        {
         if(OrderSymbol() == Symbol())
           {
            double closePrice = (OrderType() == OP_BUY) ? Bid : Ask;
            double triggerPrice = isTakeProfit ? OrderTakeProfit() : OrderStopLoss();

            if((OrderType() == OP_BUY && closePrice >= triggerPrice) ||
               (OrderType() == OP_SELL && closePrice <= triggerPrice))
              {
               bool isOrderClosed = OrderClose(OrderTicket(), OrderLots(), closePrice, 3, clrRed);
               if(!isOrderClosed)
                 {
                  Print("Error closing order: ", GetLastError());
                 }
              }
           }
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ManageOpenOrders()
  {
   double breakevenLevel = 20;
   double trailingStopLevel = 40;

   for(int i = OrdersTotal() - 1; i >= 0; i--)
     {
      if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
        {
         if(OrderSymbol() == Symbol())
           {
            double atr = NormalizeDouble(iATR(Symbol(), Period(), Atr_period, Bars_lookback), Digits);
            double newStopLoss;

            if(OrderType() == OP_BUY)
              {
               if(UseBreakeven && (Ask - OrderOpenPrice() >= breakevenLevel * Point))
                 {
                  newStopLoss = OrderOpenPrice() + breakevenLevel * Point;
                  ModifyOrderAndPrintResult(OrderTicket(), newStopLoss, OrderTakeProfit(), OrderExpiration(), Green, "Breakeven");
                 }

               if(UseTrailingStop && (Ask - OrderOpenPrice() >= trailingStopLevel * Point))
                 {
                  newStopLoss = Ask - trailingStopLevel * Point;
                  ModifyOrderAndPrintResult(OrderTicket(), newStopLoss, OrderTakeProfit(), OrderExpiration(), Green, "Trailing stop");
                 }

               if(UseATR && (OrderStopLoss() < OrderOpenPrice() - Atr_multiplier * atr))
                 {
                  newStopLoss = OrderOpenPrice() - Atr_multiplier * atr;
                  ModifyOrderAndPrintResult(OrderTicket(), newStopLoss, OrderTakeProfit(), OrderExpiration(), Green, "ATR-based stop loss");
                 }
              }
            else
               if(OrderType() == OP_SELL)
                 {
                  if(UseBreakeven && (OrderOpenPrice() - Bid >= breakevenLevel * Point))
                    {
                     newStopLoss = OrderOpenPrice() - breakevenLevel * Point;
                     ModifyOrderAndPrintResult(OrderTicket(), newStopLoss, OrderTakeProfit(), OrderExpiration(), Red, "Breakeven");
                    }

                  if(UseTrailingStop && (OrderOpenPrice() - Bid >= trailingStopLevel * Point))
                    {
                     newStopLoss = Bid + trailingStopLevel * Point;
                     ModifyOrderAndPrintResult(OrderTicket(), newStopLoss, OrderTakeProfit(), OrderExpiration(), Red, "Trailing stop");
                    }

                  if(UseATR && (OrderStopLoss() > OrderOpenPrice() + Atr_multiplier * atr))
                    {
                     newStopLoss = OrderOpenPrice() + atr * Atr_multiplier;
                     ModifyOrderAndPrintResult(OrderTicket(), newStopLoss, OrderTakeProfit(), OrderExpiration(), Red, "ATR-based stop loss");
                    }
                 }
           }
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CloseOnOppositeSignal(bool buySignal, bool sellSignal)
  {
   for(int i = OrdersTotal() - 1; i >= 0; i--)
     {
      if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
        {
         if(OrderSymbol() == Symbol())
           {
            if(buySignal && OrderType() == OP_SELL)
              {
               bool orderClosed = OrderClose(OrderTicket(), OrderLots(), Bid, 3, clrNONE);
               if(!orderClosed)
                 {
                  Print("Error closing sell order: ", GetLastError());
                 }
              }

            if(sellSignal && OrderType() == OP_BUY)
              {
               bool orderClosed = OrderClose(OrderTicket(), OrderLots(), Ask, 3, clrNONE);
               if(!orderClosed)
                 {
                  Print("Error closing buy order: ", GetLastError());
                 }
              }
           }
        }
     }
  }

void OnDeinit(const int reason)
{
  // Close all open orders for the current symbol
  for(int i = OrdersTotal() - 1; i >= 0; i--)
    {
     if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
       {
        if(OrderSymbol() == Symbol())
          {
           bool orderClosed = OrderClose(OrderTicket(), OrderLots(), (OrderType() == OP_BUY) ? Bid : Ask, Slippage, clrNONE);
           if(!orderClosed)
             {
              Print("Error closing order: ", GetLastError());
             }
          }
       }
    }
}



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
{
  // Implement these functions according to your trading logic
  ReadSignalAndExecuteTrade();
  CheckNewBar();
  CloseOrders(true);  //Check take profit
  CloseOrders(false);  //Check stop loss
}

void CheckNewBar()
{
  datetime currentBarTime = iTime(Symbol(), PERIOD_CURRENT, 0);
  isNewBar = (currentBarTime != lastBarTime);
  lastBarTime = currentBarTime;
}

//+------------------------------------------------------------------+
//| Place Buy and Sell Orders                                        |
//+------------------------------------------------------------------+
void PlaceOrders(int buyType, int sellType)
  {
   double slippage = Slippage * Point;

   if(EnableBuyOrder && buyType != 0)
     {
      double buyPrice = (buyType == OP_BUY) ? Ask : Bid;
      int buyOrder = OrderSend(Symbol(), buyType, Lots, buyPrice, slippage, 0, 0, "", MagicNumber, 0, Blue);
      if(buyOrder <= 0)
        {
         Print("Error placing buy order: ", GetLastError());
        }
     }

   if(EnableSellOrder && sellType != 0)
     {
      double sellPrice = (sellType == OP_SELL) ? Bid : Ask;
      int sellOrder = OrderSend(Symbol(), sellType, Lots, sellPrice, slippage, 0, 0, "", MagicNumber, 0, Red);
      if(sellOrder <= 0)
        {
         Print("Error placing sell order: ", GetLastError());
        }
     }
  }

//+------------------------------------------------------------------+
//| Check if the take profit level is reached                        |
//+------------------------------------------------------------------+
void CheckTakeProfit()
  {
   if(!EnableTakeProfit)
      return;

   for(int i = OrdersTotal() - 1; i >= 0; i--)
     {
      if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
        {
         if(OrderSymbol() == Symbol())
           {
            double closePrice = (OrderType() == OP_BUY) ? Bid : Ask;
            double takeProfit = OrderTakeProfit();

            if((OrderType() == OP_BUY && closePrice >= takeProfit) || (OrderType() == OP_SELL && closePrice <= takeProfit))
              {
               bool isOrderClosed = OrderClose(OrderTicket(), OrderLots(), closePrice, Slippage, clrGreen);
               if(!isOrderClosed)
                 {
                  Print("Error closing order on take profit: ", GetLastError());
                 }
              }
           }
        }
     }
  }

//+------------------------------------------------------------------+
//| Check if the stop loss level is reached                          |
//+------------------------------------------------------------------+
void CheckStopLoss()
  {
   if(!EnableStopLoss)
      return;

   for(int i = OrdersTotal() - 1; i >= 0; i--)
     {
      if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
        {
         if(OrderSymbol() == Symbol())
           {
            double closePrice = (OrderType() == OP_BUY) ? Bid : Ask;
            double stopLoss = OrderStopLoss();

            if((OrderType() == OP_BUY && closePrice <= stopLoss) || (OrderType() == OP_SELL && closePrice >= stopLoss))
              {
               bool isOrderClosed = OrderClose(OrderTicket(), OrderLots(), closePrice, Slippage, clrRed);
               if(!isOrderClosed)
                 {
                  Print("Error closing order on stop loss: ", GetLastError());
                 }
              }
           }
        }
     }
  }

//+------------------------------------------------------------------+
//| Read Signal and Execute Trade                                     |
//+------------------------------------------------------------------+
void ReadSignalAndExecuteTrade()
  {
   if(!IsTradingAllowed())
      return;

   CheckNewBar();

   if(!isNewBar)
      return;

// Reading and executing main signals
   double mainBuySignal, mainSellSignal;
   double confirm1BuySignal, confirm1SellSignal;
   double confirm2BuySignal, confirm2SellSignal;

   LoadIndicatorValues(Indicator_Use, Timeframe_for_Indicator_Signal, Buy_Signal_Buffer_Indexes, Sell_Signal_Buffer_Indexes, mainBuySignal, mainSellSignal);
   LoadIndicatorValues(Indicator_Use_Confirmation1, Timeframe_for_Indicator_Signal_Confirmation1, Buy_Signal_Buffer_Indexes_Confirmation1, Sell_Signal_Buffer_Indexes_Confirmation1, confirm1BuySignal, confirm1SellSignal);
   LoadIndicatorValues(Indicator_Use_Confirmation2, Timeframe_for_Indicator_Signal_Confirmation2, Buy_Signal_Buffer_Indexes_Confirmation2, Sell_Signal_Buffer_Indexes_Confirmation2, confirm2BuySignal, confirm2SellSignal);

   bool entryBuySignal = AreEntryIndicatorsAligned(mainBuySignal, confirm1BuySignal, confirm2BuySignal);
   bool entrySellSignal = AreEntryIndicatorsAligned(mainSellSignal, confirm1SellSignal, confirm2SellSignal);

   CloseOnOppositeSignal(entryBuySignal, entrySellSignal);

   if(entryBuySignal)
      PlaceOrders(OP_BUY, 0);
   else
      if(entrySellSignal)
         PlaceOrders(0, OP_SELL);

// Managing Open orders
   ManageOpenOrders();

// Check Take Profit
   double tpBuySignal, tpSellSignal;
   double tpConfirm1BuySignal, tpConfirm1SellSignal;
   double tpConfirm2BuySignal, tpConfirm2SellSignal;

   LoadIndicatorValues(TakeProfit_Indicator_Use, Timeframe_for_TakeProfit_Indicator_Signal, TakeProfit_Buy_Signal_Buffer_Indexes, TakeProfit_Sell_Signal_Buffer_Indexes, tpBuySignal, tpSellSignal);
   LoadIndicatorValues(TakeProfit_Indicator_Use_Confirmation1, Timeframe_for_TakeProfit_Indicator_Signal_Confirmation1, TakeProfit_Buy_Signal_Buffer_Indexes_Confirmation1, TakeProfit_Sell_Signal_Buffer_Indexes_Confirmation1, tpConfirm1BuySignal, tpConfirm1SellSignal);
   LoadIndicatorValues(TakeProfit_Indicator_Use_Confirmation2, Timeframe_for_TakeProfit_Indicator_Signal_Confirmation2, TakeProfit_Buy_Signal_Buffer_Indexes_Confirmation2, TakeProfit_Sell_Signal_Buffer_Indexes_Confirmation2, tpConfirm2BuySignal, tpConfirm2SellSignal);

   bool tpSignal = AreEntryIndicatorsAligned(tpBuySignal, tpConfirm1BuySignal, tpConfirm2BuySignal) || AreEntryIndicatorsAligned(tpSellSignal, tpConfirm1SellSignal, tpConfirm2SellSignal);


//+------------------------------------------------------------------+
//| Check if all entry indicators align                              |
//+------------------------------------------------------------------+
   bool AreEntryIndicatorsAligned(double value1, double value2, double value3)
     {
      return (value1 > 0 && value2 > 0 && value3 > 0);
     }

// Loading indicator values
   void LoadIndicatorValues(string indicatorUse, ENUM_TIMEFRAMES timeframe, int buySignalBufferIndex, int sellSignalBufferIndex, double &buySignal, double &sellSignal)
     {
      // Get the handle of the indicator
      int handle = iCustom(Symbol(), timeframe, indicatorUse, 0, buySignalBufferIndex + sellSignalBufferIndex + 1);
      // Check if the handle is valid
      if(handle == INVALID_HANDLE)
        {
         Print("Error getting the handle of the indicator: ", GetLastError());
         return;
        }

      // Calculate limit for the loop below
      int countedBars = IndicatorCounted();
      int limit = Bars - countedBars;

      // Loop through all bars from the current bar to the oldest bar not yet handled
      for(int i = limit - 1; i >= 0; i--)
        {
         // Get buy and sell signals from the indicator
         buySignal = iCustom(Symbol(), timeframe, indicatorUse, i, buySignalBufferIndex);
         sellSignal = iCustom(Symbol(), timeframe, indicatorUse, i, sellSignalBufferIndex);
         // Process the indicator signals here
        }
     }
}
//+------------------------------------------------------------------+
