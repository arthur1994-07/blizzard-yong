package ran.ui
{
    import flash.display.*;
    import ran.ui.core.*;
    import scaleform.clik.events.*;

    public interface IUICoreInterface
    {

        public function IUICoreInterface();

        function set focusWindow(param1:MWindow) : void;

        function get focusWindow() : MWindow;

        function LoadCompleteProc(param1:DisplayObject, param2:int, param3:int, param4:Boolean) : void;

        function SwapESCList(param1:DisplayObject) : void;

        function WindowCloseESC(param1:int, param2:DisplayObject) : void;

        function OpenTooltip(event:SimpleTooltipEvent) : void;

        function CloseTooltip(event:SimpleTooltipEvent) : void;

        function IsLoadWidget(param1:DisplayObject) : Boolean;

        function snapCheck(param1:DisplayObject, param2:int, param3:int) : Array;

    }
}
