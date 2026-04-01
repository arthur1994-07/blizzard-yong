package ran.ui
{
    import flash.external.*;

    public class DataAdapter extends Object
    {
        public static var notifyHoldStart:Function;
        public static var notifyHoldEnd:Function;
        public static var notifyHoldEndForce:Function;
        public static var notifyHoldEndOutside:Function;
        public static var notifyLeftMouseClick:Function;
        public static var notifyRightMouseClick:Function;
        public static var getSlotTooltip:Function;
        public static var getSlotSubTooltip:Function;
        public static var getAddSlotCount:Function;
        public static var getAddSlotBinding:Function;
        public static var getTradeSlotCount:Function;
        public static var getTradeSlotBinding:Function;
        public static var showTooltipSlot_bySlot:Function;
        public static var showTooltipSlot_byID:Function;
        public static var hideTooltipSlot:Function;
        public static var getMaxTooltipWidth:Function;
        public static var getMinTooltipWidth:Function;
        public static var registerMessageLogListener:Function;
        public static var unregisterMessageLogListener:Function;
        public static var chatLogRefresh:Function;
        public static var registerRenderTexture:Function;
        public static var unregisterRenderTexture:Function;
        public static var clubIconRenderTexture:Function;
        public static var visibleHtmlView:Function;
        public static var saveConversionMode:Function;
        public static var setConversionMode:Function;
        public static var isGameRun:Function;
        public static var GetCompositionString:Function;
        public static var SetCompositionString:Function;
        public static var SetFocusInTextInput:Function;
        public static var saveProp:Function;
        public static var registerInterface:Function;
        public static var registerDisplayInterface:Function;
        public static var getLargeMapIconTooltip:Function;

        public function DataAdapter()
        {
            return;
        }// end function

        public static function initialize() : void
        {
            ExternalInterface.call("OnDataAdapterInit", DataAdapter);
            return;
        }// end function

    }
}
